<?php

use Tygh\Tygh;
use Tygh\Enum\UserTypes;
use Tygh\Addons\ProductReviews\Notifications\EventIdProviders\ProductReviewsEventProvider;

function fn_my_additional_notifications_tools_change_status(array $params, $result)
{
    if (
        !$result
        || $params['table'] !== 'product_reviews'
        || empty($params['id'])
        || $params['status'] == 'D'
    ) {
        return;
    }

    $auth = &Tygh::$app['session']['auth'];
    $product_review_id = $params['id'];

    $receivers[UserTypes::VENDOR] = true;
    $receivers[UserTypes::CUSTOMER] = true;

    /** @var \Tygh\Notifications\Settings\Factory $notification_settings_factory */
    $notification_settings_factory = Tygh::$app['event.notification_settings.factory'];
    $notification_rules = $notification_settings_factory->create($receivers);

    /** @var \Tygh\Notifications\EventDispatcher $event_dispatcher */
    $event_dispatcher = Tygh::$app['event.dispatcher'];
    $event_dispatcher->dispatch(
        'my_additional_notifications.new_post_approved',
        fn_product_reviews_get_data_for_notification((int) $product_review_id, $auth),
        $notification_rules,
        new ProductReviewsEventProvider((int) $product_review_id)
    );
}
