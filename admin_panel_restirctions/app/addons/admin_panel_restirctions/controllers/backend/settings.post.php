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

use Tygh\Enum\YesNo;
use Tygh\Providers\StorefrontProvider;
use Tygh\Registry;
use Tygh\Helpdesk;

defined('BOOTSTRAP') or die('Access denied');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    return [CONTROLLER_STATUS_OK];
}

/** @var string $mode Controller mode */
if ($mode === 'manage' && (Tygh::$app['session']['auth']['is_root'] != 'Y' || Tygh::$app['session']['auth']['company_id'])) {
    $view = Tygh::$app['view'];
    $options = $view->getTemplateVars('options');
    foreach ($options['main'] as &$option) {
        if ($option['name'] === 'license_number') {
            $option['value'] = Helpdesk::masqueLicenseNumber($option['value'], true);
        }
    }
    $view->assign('options', $options);
}

return [CONTROLLER_STATUS_OK];
