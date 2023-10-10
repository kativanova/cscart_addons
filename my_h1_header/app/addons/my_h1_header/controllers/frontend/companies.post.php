<?php

use Tygh\Tygh;

defined('BOOTSTRAP') or die('Access denied');

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $mode === 'products'){
    $company_id = Tygh::$app['view']->getTemplateVars('company_id');
    Tygh::$app['view']->assign('company_data', fn_get_company_data($company_id));
}