<?php
/***************************************************************************
 *                                                                          *
 *   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
 *                                                                          *
 * This  is  commercial  software,  only  users  who have purchased a valid *
 * license  and  accept  to the terms of the  License Agreement can install *
 * and use this program.                                                    *
 *                                                                          *
 ****************************************************************************
 * PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
 * "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
 ****************************************************************************/


namespace Tygh\Addons\MailCatcher;


use Tygh\Enum\NotificationSeverity;
use Tygh\Mailer\Message;
use Tygh\Mailer\Transports\PhpMailerTransport;

/**
 * Class MailerTransport
 *
 * @package Tygh\Addons\MailCatcher
 *
 * phpcs:disable
 */
class MailerTransport extends PhpMailerTransport
{
    /**
     * @var Message|null
     */
    private $message;

    /**
     * @var array<string, string> Map message id to subject
     */
    private $processed_messages = [];

    /**
     * @inheritDoc
     */
    public function sendMessage(Message $message)
    {
        $this->message = $message;
        $this->Mailer = 'file';

        $result = parent::sendMessage($message);

        $this->message = null;

        return $result;
    }

    /**
     * Send mail using the PHP mail() function.
     *
     * @param string $header The message headers
     * @param string $body   The message body
     *
     * @return bool
     */
    protected function fileSend($header, $body)
    {
        $header = static::stripTrailingWSP($header) . static::$LE . static::$LE;

        if ($this->message) {
            $message_id = $this->saveMessage($this->message, $header, $body);
            $this->processed_messages[$message_id] = $this->message->getSubject();
        }

        return true;
    }

    /**
     * Gets email message html file path and eml file path
     *
     * @param string $message_id Message ID
     *
     * @return string[]
     */
    public static function getMessageFiles($message_id)
    {
        $dir = self::getDirPath();

        $path_html = $dir . $message_id . '.html';
        $path_eml = $dir . $message_id . '.eml';

        if (file_exists($path_html) && file_exists($path_eml)) {
            return [$path_html, $path_eml];
        }

        return [];
    }

    /**
     * @return string
     */
    private static function getDirPath()
    {
        return fn_get_cache_path(false) . 'tmp/mailcatcher/';
    }

    /**
     * @param \Tygh\Mailer\Message $message Message
     * @param string               $header  Header
     * @param string               $body    Body
     *
     * @return string
     */
    private function saveMessage(Message $message, $header, $body)
    {
        $dir = self::getDirPath();
        fn_mkdir($dir);

        $message_id = spl_object_hash($message);
        $path_html = $dir . $message_id . '.html';
        $path_eml = $dir . $message_id . '.eml';

        $this->saveMessageHtml($path_html, $message_id, $message);
        $this->saveMessageEml($path_eml, $header, $body);

        return $message_id;
    }

    /**
     * @param string               $path        File path
     * @param string               $message_id  Message ID
     * @param \Tygh\Mailer\Message $message     Message instance
     *
     * @return void
     */
    private function saveMessageHtml($path, $message_id, Message $message)
    {
        file_put_contents($path, $this->getMessageHtml($message_id, $message));
        chmod($path, DEFAULT_FILE_PERMISSIONS);
    }

    /**
     * @param string $path   File path
     * @param string $header Header
     * @param string $body   Body
     *
     * @return void
     */
    private function saveMessageEml($path, $header, $body)
    {
        file_put_contents($path, $header .  $body);
        chmod($path, DEFAULT_FILE_PERMISSIONS);
    }

    /**
     * @param string               $message_id  Message ID
     * @param \Tygh\Mailer\Message $message     Message instance
     *
     * @return string
     */
    private function getMessageHtml($message_id, Message $message)
    {
        $from = htmlspecialchars($this->getAddressLineText($message->getFrom()));
        $to = htmlspecialchars($this->getAddressLineText($message->getFrom()));
        $reply_to = htmlspecialchars($this->getAddressLineText($message->getReplyTo()));
        $cc = htmlspecialchars($this->getAddressLineText($message->getCC()));
        $bcc = htmlspecialchars($this->getAddressLineText($message->getBCC()));
        $url = fn_url('mailcatcher.eml?id=' . $message_id);

        $images = [];

        foreach ($message->getEmbeddedImages() as $image) {
            $images['cid:' . $image['cid']] = fn_get_rel_dir($image['file']);
        }
        $body = str_replace(array_keys($images), array_values($images), $message->getBody());

        return
            "<h4>"
            . "<div style=\"text-align: right\"><a href=\"{$url}\" target=\"_blank\">Download .eml file</a></div>"
            . "<h4>{$message->getSubject()}</h4>"
            . "<div><strong>From</strong>: {$from}</div>"
            . "<div><strong>To</strong>: {$to}</div>"
            . ($reply_to ? "<div><strong>Reply-To</strong>: {$to}</div>" : '')
            . ($cc ? "<div><strong>CC</strong>: {$cc}</div>" : '')
            . ($bcc ? "<div><strong>BCC</strong>: {$bcc}</div>" : '')
            . "<br/><div>{$body}</div>"
            . "</div>";
    }

    /**
     * @param array<string, string> $addresses Addresses
     *
     * @return string
     */
    private function getAddressLineText(array $addresses)
    {
        $items = [];

        foreach ($addresses as $address => $name) {
            $items[] =  "{$name} <{$address}>";
        }

        return implode(', ', $items);
    }

    /**
     * @param array<string, string> $processed_messages Messages
     *
     * @return string
     */
    private function getNotificationBody($processed_messages)
    {
        $lines = [];

        foreach ($processed_messages as $message_id => $subject) {
            $url = fn_url('mailcatcher.view?id=' . $message_id);
            $lines[] = "<li style=\"list-style: decimal;\"><a href=\"{$url}\" class=\"cm-dialog-opener cm-dialog-auto-size\" title=\"".htmlspecialchars($subject)."\" data-ca-target-id=\"mailcatcher_message_{$message_id}\">{$subject}</a></li>";
        }

        return "<ol style=\"padding: 0px;list-style: decimal;margin: 0 0 10px 25px;\">" . implode("\n", $lines) . "</ol>";
    }

    /**
     * @inheritDoc
     * @return void
     */
    public function __destruct()
    {
        parent::__destruct();
        $this->sendNotifications();
    }

    /**
     * @return void
     */
    public function sendNotifications()
    {
        if (empty($this->processed_messages)) {
            return;
        }

        fn_set_notification(
            NotificationSeverity::NOTICE,
            __('mailcatcher.notification.cathed_messages', [count($this->processed_messages)]),
            $this->getNotificationBody($this->processed_messages),
            'K'
        );

        $this->processed_messages = [];
    }
}
