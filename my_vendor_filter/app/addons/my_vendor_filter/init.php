<?php

defined('BOOTSTRAP') or die('Access denied');

fn_register_hooks(
    'get_product_filter_fields',
    'get_current_filters_after_variants_select_query'
);