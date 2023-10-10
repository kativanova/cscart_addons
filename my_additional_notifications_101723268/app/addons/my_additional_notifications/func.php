<?php

use Tygh\Enum\OrderStatuses;
use Tygh\Enum\SiteArea;
use Tygh\Enum\UserTypes;
use Tygh\Notifications\DataProviders\OrderDataProvider;
use Tygh\Settings;

function fn_my_additional_notifications_change_order_status_post($order_id, $status_to, $status_from, $force_notification, $place_order, $order_info, $edp_data)
{
    if ($status_to === OrderStatuses::COMPLETE) {
        $my_additional_notifications_settings = Settings::instance()->getValues('my_additional_notifications', 'ADDON', false, $order_info['company_id']);

        if (!empty($my_additional_notifications_settings['email_for_complete_order_notification'])) {
            /** @var \Tygh\Mailer\Mailer $mailer */
            $mailer = Tygh::$app['mailer'];

            $provider = new OrderDataProvider(['order_info' => $order_info]);
            $dataValue = $provider->get(UserTypes::ADMIN);
            $data = $dataValue->toArray();
            $result = $mailer->send(
                [
                    'to'                    => $my_additional_notifications_settings['email_for_complete_order_notification'],
                    'from'                  => 'default_company_orders_department',
                    'template_code'         =>  'order_notification.c',
                    'data'                  => $provider->get(UserTypes::ADMIN)->toArray(),
                    'company_id'            => $order_info['company_id'],
                ],
                SiteArea::ADMIN_PANEL,
                $order_info['lang_code']
            );
        }
    }
};
