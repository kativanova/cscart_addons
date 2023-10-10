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

/**
 * @var string $mode
 */

use Tygh\Addons\MailCatcher\MailerTransport;

defined('BOOTSTRAP') or die('Access denied');

$message_id = isset($_REQUEST['id']) ? (string) $_REQUEST['id'] : null;

if ($message_id === null) {
    return [CONTROLLER_STATUS_NO_PAGE];
}

$files = MailerTransport::getMessageFiles(fn_basename($message_id));

if (empty($files)) {
    return [CONTROLLER_STATUS_NO_PAGE];
}

list($html_path, $eml_path) = $files;

if ($mode === 'view') {
    echo file_get_contents($html_path);

    return [CONTROLLER_STATUS_NO_CONTENT];
}

if ($mode === 'eml') {
    fn_get_file($eml_path, $message_id . '.eml');
}

return [CONTROLLER_STATUS_NO_PAGE];
