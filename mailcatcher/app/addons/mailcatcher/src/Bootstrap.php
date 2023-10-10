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

use Tygh\Core\ApplicationInterface;
use Tygh\Core\BootstrapInterface;
use Tygh\Core\HookHandlerProviderInterface;

class Bootstrap implements BootstrapInterface, HookHandlerProviderInterface
{
    /**
     * @var \Tygh\Addons\MailCatcher\MailerTransport|null
     */
    private static $mailer_transport;

    /**
     * @inheritDoc
     */
    public function boot(ApplicationInterface $app)
    {
        /**
         * @var \Pimple\Container $app
         */
        unset($app['mailer.transport.default']);
        $app['mailer.transport.default'] = static function () {
            return static function (array $settings) {
                return self::$mailer_transport = new MailerTransport($settings);
            };
        };
    }

    /**
     * @inheritDoc
     */
    public function getHookHandlerMap()
    {
        return [
            'complete' => static function () {
                if (!self::$mailer_transport) {
                    return;
                }

                self::$mailer_transport->sendNotifications();
            },
            'redirect_complete' => static function () {
                if (!self::$mailer_transport) {
                    return;
                }

                self::$mailer_transport->sendNotifications();
            },
        ];
    }
}
