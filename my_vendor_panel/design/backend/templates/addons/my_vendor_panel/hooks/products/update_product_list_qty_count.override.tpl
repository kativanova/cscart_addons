{if $auth.user_type == "UserTypes::ADMIN"|enum}
    {component
        name="product.overridable_field_input"
        type="SettingTypes::INPUT"|enum
        value=$product_data.list_qty_count_raw
        field_name="list_qty_count"
        disable_inputs=$disable_selectors
        company_id=$product_data.company_id|default:null
        custom_input_styles="cm-numeric"
    }
    <div class="control-group">
        <label class="control-label" for="elm_list_qty_count">{__("list_quantity_count")}:</label>
        <div class="controls">
            #INPUT#
        </div>
    </div>
    {/component}
{else}
    <div hidden></div>
{/if}