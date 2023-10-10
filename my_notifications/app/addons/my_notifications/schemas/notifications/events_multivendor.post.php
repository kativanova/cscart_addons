<?php

use Tygh\Enum\UserTypes;
use Tygh\Enum\SiteArea;
use Tygh\Notifications\DataValue;
use Tygh\Notifications\Transports\Mail\MailTransport;
use Tygh\Notifications\Transports\Mail\MailMessageSchema;

$schema['vendor_new_company_rules'] = [
    'group' => 'vendors',
    'name' => [
        'template' => 'event.vendor_new_company_rules',
    ],
    'receivers' => [
        UserTypes::VENDOR => [
            MailTransport::getId()     => MailMessageSchema::create([
                'area'            => SiteArea::ADMIN_PANEL,
                'from'            => 'default_company_support_department',
                'to'              => DataValue::create('user_data.email'),
                'company_id'      => 0,
                'to_company_id'   => DataValue::create('to_company_id'),
                'template_code'   => 'vendor_new_company_rules',
                'language_code'   => DataValue::create('user_data.lang_code', CART_LANGUAGE),
                'storefront_id'   => DataValue::create('company.registered_from_storefront_id'),
            ]),
        ],
    ]
];

return $schema;