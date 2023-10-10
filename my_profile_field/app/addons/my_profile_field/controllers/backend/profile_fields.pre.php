<?php

defined('BOOTSTRAP') or die('Access denied');

if (($_SERVER['REQUEST_METHOD'] == 'POST') 
        && $mode === 'update' 
        && $_REQUEST['field_data']['field_type'] === 'L') { //updating social links
    
    $social_url_link = preg_replace('/(\w)(\/)*$/', '$1/', $_REQUEST['field_data']['social_media_link']);
    $_REQUEST['field_data']['social_media_link'] = $social_url_link;
}