<?php

use Tygh\Tygh;
use Tygh\Registry;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

if ($mode == 'manage'
    && (!isset(Tygh::$app['session']['auth']['is_root']) 
        || Tygh::$app['session']['auth']['is_root'] != 'Y' 
        || Registry::get('runtime.company_id'))
) {

    $section_id = Tygh::$app['view']->getTemplateVars('section_id');
    
    if($section_id !== 'Upgrade_center') {
        return;
    }

    $options = Tygh::$app['view']->getTemplateVars('options');
    foreach($options['main'] as $key => $option) {
        if($option['name'] === 'license_number') {
            unset($options['main'][$key]);
        }
    }
    //fn_print_die($options);
    Tygh::$app['view']->assign('options', $options);
}