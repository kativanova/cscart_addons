<?php

use Tygh\Enum\UserTypes;
use Tygh\Tygh;
use Tygh\Enum\SiteArea;

defined('BOOTSTRAP') or die('Access denied');

function fn_my_notifications_change_company_status_before_mail(
    $company_id,
    $status_to,
    $reason,
    $status_from,
    $skip_query,
    $notify,
    $company_data,
    $user_data,
    $result,
    $account
) {
    if($status_from == 'N') {
        $event_dispatcher = Tygh::$app['event.dispatcher'];
        $notification_settings_factory = Tygh::$app['event.notification_settings.factory'];
        $force_notification = [UserTypes::VENDOR => $notify];
        $notification_rules = $notification_settings_factory->create($force_notification);

        $data = [
            'to_company_id' => $company_id,
        ];

        $event_dispatcher->dispatch('vendor_new_company_rules', $data, $notification_rules);
    }
}