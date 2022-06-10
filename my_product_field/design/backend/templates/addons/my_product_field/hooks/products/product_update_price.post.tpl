{component name="configurable_page.field" entity="products" tab="detailed" section="information" field="pricing_option"}
<div class="control-group {$no_hide_input_if_shared_product}">
    <label for="elm_pricing_option" class="control-label cm-required">{__("my_product_field.pricing_option")}:</label>
    <div class="controls">
        <select class="span3" name="product_data[pricing_option]" id="elm_pricing_option">
        <option value="" disabled selected>{__("my_product_field.please_select_one")}</option>
            <option value="H" {if $product_data.pricing_option == "H"}selected="selected"{/if}>{__("my_product_field.per_hour")}</option>
            <option value="P" {if $product_data.pricing_option == "P"}selected="selected"{/if}>{__("my_product_field.per_project")}</option>
        </select>
        <p class="muted description">{__("tt_views_products_update_out_of_stock_actions")}</p>     
    </div>
</div>
{/component}