<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

if ($mode == 'list') {
    $params = [
        'active'     => true,
        /*'zone' => 'catalog',*/
        'get_hidden' => false,
        'mode'       => 'list',
        'extend'     => ['get_images'],
        'sort_by' => 'position',
        'sort_order' => 'desc',
    ];

    list($promotions, $search) = fn_get_promotions($params);

    Tygh::$app['view']->assign('promotions', $promotions);
    Tygh::$app['view']->assign('search', $search);

}
