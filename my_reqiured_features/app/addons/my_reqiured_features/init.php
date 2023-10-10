<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

fn_register_hooks(
    'get_product_feature_data_before_select',
    'get_product_features'
);