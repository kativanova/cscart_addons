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

$schema['vendor_terms'] = array(
    'templates' => 'addons/my_changes/blocks/vendor_terms.tpl',
    'wrappers' => 'blocks/wrappers',
    'content' => array(
        'vendor_info' => array(
            'type' => 'function',
            'function' => array('fn_blocks_get_vendor_info'),
        )
    ),
);


return $schema;
