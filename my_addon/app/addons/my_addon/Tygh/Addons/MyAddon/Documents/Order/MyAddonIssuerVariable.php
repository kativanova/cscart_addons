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

namespace Tygh\Addons\MyAddon\Documents\Order;


use Tygh\Template\Document\Order\Context;
use Tygh\Template\IActiveVariable;
use Tygh\Template\IVariable;
use Tygh\Tools\Formatter;

/**
 * Class MyAddonIssuerVariable
 * @package Tygh\Addons\MyAddon\Documents\Order
 */
class MyAddonIssuerVariable implements IVariable, IActiveVariable
{
    private $issuer_id;
    private $issuer;
    public $name;
    public $lastname;
    public $phone;

    public function __construct(Context $context, Formatter $formatter)
    {
        $order = $context->getOrder();
        
        if(!empty($order->data['issuer_id'])) {
            $this->issuer_id = $order->data['issuer_id'];
            $this->issuer = fn_get_user_info($this->issuer_id);
            $this->name = $this->issuer['firstname'];
            $this->lastname = $this->issuer['lastname'];
            $this->phone = $this->issuer['phone'];
        }
    }

    /**
     * @inheritDoc
     */
    public static function attributes()
    {
        return array(
            'name', 'lastname', 'phone'
        );
    }
}