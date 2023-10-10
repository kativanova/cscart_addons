<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

if ($mode == 'view') {
    if (!empty($_REQUEST['company_id'])) {
        $navigation_tabs = Registry::get('navigation.tabs');
        $navigation_tabs['terms'] = array(
            'title' => __('my_vendor_block.vendor_terms'),
            'js' => true
        );

        Registry::set('navigation.tabs', $navigation_tabs);
    }
}
