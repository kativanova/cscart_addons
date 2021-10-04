<?php

use Tygh\Tygh;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

if ($mode === 'manage') {

    $features = Tygh::$app['view']->getTemplateVars('features');
    foreach ($features as &$feature) {
        $feature['products'] = fn_my_extented_features_list_get_products_by_feature($feature['feature_id']);
    }
    Tygh::$app['view']->assign('features', $features);
}
