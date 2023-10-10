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

use Tygh\Enum\ProductFeatures;
use Tygh\Registry;
use Tygh\Enum\NotificationSeverity;
use Tygh\Providers\EventDispatcherProvider;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_ei_premoderation_notification_vendor_data_premoderation_request_approval_for_products_pre($product_ids, $update_product)
{
    $event_dispatcher = EventDispatcherProvider::getEventDispatcher();

    $event_dispatcher->dispatch(
        'ei_premoderation_notification.products_on_moderation',
        [
            'product_ids'  => $product_ids,
        ]
    );
}