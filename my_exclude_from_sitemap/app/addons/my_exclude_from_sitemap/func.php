<?php

defined('BOOTSTRAP') or die('Access denied');

function fn_my_exclude_from_sitemap_get_pages($params, $join, &$condition, $fields, $group_by, $sortings, $lang_code)
{
    //_logWrite([$params, $join, $condition, $fields, $group_by, $sortings, $lang_code]);
    if($_REQUEST['dispatch'] === "xmlsitemap.generate") {
        $condition .= " AND ?:pages.is_excluded = 'N'";
    }
}