<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_reqiured_features_get_product_feature_data_before_select(&$fields, $join, $condition, $feature_id, $get_variants, $get_variant_images, $lang_code) {
    $fields[] = '?:product_features.is_required';
}

function fn_my_reqiured_features_get_product_features(&$fields, $join, $condition, $params) {
    $fields[] = 'pf.is_required';
}