<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

fn_register_hooks(
    'pre_get_orders',
    'get_orders',
    'change_order_status_post'
);
