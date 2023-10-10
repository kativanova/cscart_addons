<?php

namespace Tygh\Addons\MyDocumentVariable\Documents\Order;

use Tygh\Registry;
use Tygh\Template\Document\Order\Context;
use Tygh\Template\IVariable;

class VendorTermsVariable implements IVariable
{
    public $terms;

    public function __construct(Context $context)
    {
        $order = $context->getOrder();

        $vendor_terms = fn_get_vendor_terms($order->getCompanyId());
        $this->terms = $vendor_terms[0]['terms'];
    }
}
