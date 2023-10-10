<?php

use Tygh\Enum\YesNo;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_my_vendor_block_get_products_before_select(&$params, $join, $condition, $u_condition, $inventory_join_cond, $sortings, $total, $items_per_page, $lang_code, $having)
{
    if (!empty($params['by_the_same_vendor'])) {
        if (!empty($params['main_product_id'])) {
            $params['exclude_pid'] = $params['main_product_id'];
        }

        $product = Tygh::$app['view']->getTemplateVars('product');
        $company_id = fn_get_company_id('products', 'product_id', $product['product_id']);
        $params['company_id'] = $company_id;

        if (!empty($params['similar_category']) && $params['similar_category'] == 'Y') {
            $params['cid'] = $product['main_category'];

            if (!empty($params['similar_subcats']) && $params['similar_subcats'] == 'Y') {
                $params['subcats'] = 'Y';
            }
        }

    }

    if (!empty($params['similar_in_stock']) && $params['similar_in_stock'] === YesNo::YES) {
        $params['hide_out_of_stock_products'] = true;
    }
}