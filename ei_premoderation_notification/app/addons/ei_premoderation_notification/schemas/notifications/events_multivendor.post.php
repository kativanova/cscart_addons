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

use Tygh\Enum\SiteArea;
use Tygh\Enum\UserTypes;
use Tygh\Notifications\Transports\Mail\MailTransport;
use Tygh\Notifications\Transports\Mail\MailMessageSchema;
use Tygh\Registry;
use Tygh\Tools\Url;

defined('BOOTSTRAP') or die('Access denied');
/** @var array<string, array> $schema */

$schema['ei_premoderation_notification.products_on_moderation'] = [
    'group'     => 'vendors',
    'name'      => [
        'template' => 'ei_premoderation_notification.event.premoderation_notification_for_admin',
        'params'   => [],
    ],
    'receivers' => [
        UserTypes::ADMIN => [
            MailTransport::getId() => MailMessageSchema::create([
                'area'            => SiteArea::ADMIN_PANEL,
                'from'            => 'default_company_orders_department',
                'to'              => 'company_support_department',
                'template_code'   => 'vendor_data_premoderation_notification_for_admin',
                'company_id'      => 0,
                'to_company_id'   => 0,
                'language_code'   => Registry::get('settings.Appearance.backend_default_language'),
                'data_modifier'   => static function ($data) {
                    $product_ids = isset($data['product_ids']) ? $data['product_ids'] : [];
                    $products = fn_get_product_name($product_ids);

                    foreach ($products as $product_id => &$product) {
                        $product = [
                            'product' => $product,
                            'urn'     => Url::buildUrn(['products', 'update'], ['product_id' => $product_id]),
                            'url'     => fn_url('admin:' . Url::buildUrn(['products', 'update'], ['product_id' => $product_id]), 'A'),
                        ];
                    }
                    unset($product);
                    
                    return [
                        'products' => $products,
                        'link_to_the_list' => fn_url('admin:' . Url::buildUrn(['products', 'manage'], ['status' => 'R']), 'A'),
                    ];
                },
            ]),
        ],
    ],
];

return $schema;
