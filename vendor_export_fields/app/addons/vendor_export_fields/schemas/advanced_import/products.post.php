<?php

use Tygh\Enum\UserTypes;
use Tygh\Enum\Addons\AdvancedImport\ImportStrategies;

if (Tygh::$app['session']['auth']['user_type'] === UserTypes::VENDOR) {
    unset($schema['options']['import_strategy']['variants'][ImportStrategies::IMPORT_ALL ]);
}
 return $schema;