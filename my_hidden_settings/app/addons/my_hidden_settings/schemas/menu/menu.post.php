<?php

use Tygh\Tygh;
use Tygh\Registry;

if (!isset(Tygh::$app['session']['auth']['is_root']) 
    || Tygh::$app['session']['auth']['is_root'] != 'Y' 
    || Registry::get('runtime.company_id')
) {
    unset($schema['top']['settings']['items']['store_mode']);
}
return $schema;