<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_extented_features_list_get_products_by_feature($feature_id) {
    
    $company_id = Registry::get('runtime.company_id');
    $company_condition = '';
    
    if ($company_id !== 0) { //admin panel
        $company_condition = db_quote(' AND a.company_id=?s', $company_id);
    }

    $number_of_products = db_get_field('
        SELECT COUNT(DISTINCT(a.product_id)) 
        FROM ?:products a 
        INNER JOIN ?:product_features_values b ON a.product_id = b.product_id 
        WHERE feature_id=?i' . $company_condition, $feature_id);
    return $number_of_products;
}

function fn_my_extented_features_list_get_products_before_select(&$params, $fields, $sortings, &$condition, $join, $sorting, $group_by, $lang_code, $having) {
    if (!empty($params['feature_id'])) {
        $params['extend'][] = 'features';
        $params['extend'][] = 'feature_values';
        $condition = db_quote(' AND ?:product_features_values.feature_id=?i', $params['feature_id']);
    }
}