{if $auth.user_type == "UserTypes::ADMIN"|enum}
    {component
        name="product.overridable_field_input"
        type="SettingTypes::INPUT"|enum
        value=$product_data.qty_step_raw
        field_name="qty_step"
        disable_inputs=$disable_selectors
        company_id=$product_data.company_id|default:null
        custom_input_styles="cm-numeric"
    }
    <div class="control-group">
        <label class="control-label" for="elm_qty_step">{__("quantity_step")}:</label>
        <div class="controls">
            #INPUT#
        </div>
    </div>
    {/component}
{else}
    <div hidden></div>
{/if}