<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    return;
}

if ($mode == 'view') {
    $product = Tygh::$app['view']->getTemplateVars('product');

    $params = array(
        'period' => 'LW',
        'status' => fn_get_order_paid_statuses(),
    );
    list($orders,,) = fn_get_orders($params);
    $weekly_sales_amount = 0;
    foreach($orders as $order) {
        $amount = db_get_field(
            "SELECT amount FROM ?:order_details "
            . "WHERE order_id = ?i AND  product_id = ?i",
            $order['order_id'], $product['product_id']
        );
        $weekly_sales_amount += (int)$amount;
    }

    Tygh::$app['view']->assign('weekly_sales_amount', $weekly_sales_amount);
}
