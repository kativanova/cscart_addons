{if $auth.user_type == "UserTypes::ADMIN"|enum}
{component
    name="product.overridable_field_input"
    type="SettingTypes::SELECTBOX"|enum
    value=$product_data.zero_price_action_raw
    field_name="zero_price_action"
    variants=[
        "ProductZeroPriceActions::NOT_ALLOW_ADD_TO_CART"|enum => __("zpa_refuse"),
        "ProductZeroPriceActions::ALLOW_ADD_TO_CART"|enum => __("zpa_permit"),
        "ProductZeroPriceActions::ASK_TO_ENTER_PRICE"|enum => __("zpa_ask_price")
    ]
    disable_inputs=$disable_selectors
    company_id=$product_data.company_id|default:null
}
    <div class="control-group">
        <label class="control-label" for="elm_zero_price_action">{__("zero_price_action")}:</label>
        <div class="controls">
            #INPUT#
        </div>
    </div>
{/component}
{else}
    <div hidden></div>
{/if}