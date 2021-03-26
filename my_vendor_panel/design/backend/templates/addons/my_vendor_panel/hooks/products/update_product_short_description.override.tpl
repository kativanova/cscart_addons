{if $auth.user_type == "UserTypes::ADMIN"|enum}
    <div class="control-group {$no_hide_input_if_shared_product}">
        <label class="control-label" for="elm_product_short_descr">{__("short_description")}:</label>
        <div class="controls">
            <textarea id="elm_product_short_descr" name="product_data[short_description]" cols="55" rows="2"
                class="cm-wysiwyg input-large">{$product_data.short_description}</textarea>
            {include file="buttons/update_for_all.tpl" display=$show_update_for_all object_id="short_description" name="update_all_vendors[short_description]"}
        </div>
    </div>
{else}
    <div hidden></div>
{/if}