{if $auth.user_type == "UserTypes::ADMIN"|enum}
    {capture name="select_options_type"}
        {component
                name="product.overridable_field_input"
                type="SettingTypes::SELECTBOX"|enum
                value=$product_data.options_type_raw
                field_name="options_type"
                variants=[
                    "ProductOptionsApplyOrder::SIMULTANEOUS"|enum => __("simultaneous"),
                    "ProductOptionsApplyOrder::SEQUENTIAL"|enum   => __("sequential")
                ]
                disable_inputs=$disable_selectors
                company_id=$product_data.company_id|default:null
            }{/component}
    {/capture}
    {capture name="select_exceptions_type"}
        {component
                name="product.overridable_field_input"
                type="SettingTypes::SELECTBOX"|enum
                value=$product_data.exceptions_type_raw
                field_name="exceptions_type"
                variants=[
                    "ProductOptionsExceptionsTypes::FORBIDDEN"|enum => __("forbidden"),
                    "ProductOptionsExceptionsTypes::ALLOWED"|enum   => __("allowed")
                ]
                disable_inputs=$disable_selectors
                company_id=$product_data.company_id|default:null
            }{/component}
    {/capture}
    {if $smarty.capture.select_options_type|trim && $smarty.capture.select_exceptions_type|trim}
        <hr>
        {include file="common/subheader.tpl" title=__("options_settings") target="#acc_options"}

        <div id="acc_options" class="collapse in">
            {hook name="products:update_product_options_type"}
            {if $smarty.capture.select_options_type|trim}
                <div class="control-group {$promo_class}">
                    <label class="control-label" for="elm_options_type">{__("options_type")}:</label>
                    <div class="controls">
                        {$smarty.capture.select_options_type nofilter}
                    </div>
                </div>
            {/if}
            {/hook}
            {hook name="products:update_product_exceptions_type"}
            {if $smarty.capture.select_exceptions_type|trim}
                <div class="control-group {$promo_class}">
                    <label class="control-label" for="elm_exceptions_type">{__("exceptions_type")}:</label>
                    <div class="controls">
                        {$smarty.capture.select_exceptions_type nofilter}
                    </div>
                </div>
            {/if}
            {/hook}
        </div>
    {/if}
{else}
    <div hidden></div>
{/if}