<?php

use Tygh\Enum\SiteArea;
use Tygh\Enum\UserTypes;
use Tygh\Notifications\DataValue;
use Tygh\Notifications\Transports\Mail\MailMessageSchema;
use Tygh\Notifications\Transports\Mail\MailTransport;
use Tygh\Registry;

defined('BOOTSTRAP') or die('Access denied');

$schema['profile.created.c']['receivers'][UserTypes::ADMIN] = [
    MailTransport::getId() => MailMessageSchema::create([
        'area'            => SiteArea::ADMIN_PANEL,
        'from'            => 'company_users_department',
        'to'              => 'default_company_site_administrator',
        'template_code'   => 'create_profile_for_admin',
        'company_id'      => 0,
        'to_company_id'   => 0,
        'storefront_id'   => DataValue::create('storefront_id'),
        'language_code'   => Registry::get('settings.Appearance.backend_default_language'),
        'data_modifier'   => static function (array $data) {
            return array_merge($data, [
                'url' => fn_url('profiles.update?user_id=' . $data['user_data']['user_id'], 'A'),
            ]);
        }
    ]),
];

return $schema;