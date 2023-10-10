<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    return;
}

if ($mode == 'manage') {

    $selected_fields = Tygh::$app['view']->getTemplateVars('selected_fields');

    $selected_fields[] = array(
        'name' => '[data][product_google_name]',
        'text' => __('my_product_field.product_google_name')
    );

    Tygh::$app['view']->assign('selected_fields', $selected_fields);

} elseif ($mode == 'm_update') {

    $selected_fields = Tygh::$app['session']['selected_fields'];

    $field_groups = Tygh::$app['view']->getTemplateVars('field_groups');
    $filled_groups = Tygh::$app['view']->getTemplateVars('filled_groups');
    $field_names = Tygh::$app['view']->getTemplateVars('field_names');

    if (!empty($selected_fields['data']['product_google_name'])) {
        $field_groups['A']['product_google_name'] = 'products_data';
        $filled_groups['A']['product_google_name'] = __('my_product_field.product_google_name');
    }

    if (isset($field_names['product_google_name'])) {
        unset($field_names['product_google_name']);
    }

    Tygh::$app['view']->assign('field_groups', $field_groups);
    Tygh::$app['view']->assign('filled_groups', $filled_groups);
    Tygh::$app['view']->assign('field_names', $field_names);
}
