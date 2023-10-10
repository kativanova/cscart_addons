{if !$hide_title}
    {include file="common/subheader.tpl" title=__("h1_header") target="#acc_addon_my_h1_header"}
{/if}
<div id="acc_addon_my_h1_header" class="collapsed in">
    <div class="control-group {if $share_dont_hide}cm-no-hide-input{/if}">
        <label class="control-label" for="elm_h1_header">{__("h1_header")}:</label>
        <div class="controls">
            <input 
                type="text" 
                name="{$object_name}[h1_header]" 
                id="elm_h1_header" 
                size="10"
                value="{$object_data.h1_header}" 
                class="input-long" />
                </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="elm_seo_description">{__("seo_description")}:</label>
        <div class="controls">
            <textarea 
                name="{$object_name}[seo_description]" 
                id="elm_seo_description" 
                cols="55" 
                rows="4"
                class="cm-wysiwyg input-large">{$object_data.seo_description}</textarea>
        </div>
    </div>
</div>