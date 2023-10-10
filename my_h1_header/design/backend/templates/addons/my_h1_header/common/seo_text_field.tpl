{if !$hide_title}
    {include file="common/subheader.tpl" title=__("h1_header") target="#acc_addon_my_h1_header"}
{/if}
<div id="acc_addon_my_h1_header" class="collapsed in">
<div class="control-group {if $share_dont_hide}cm-no-hide-input{/if}">
    <label class="control-label" for="elm_h1_header">{__("h1_header")}:</label>
    <div class="controls">
            <input type="text"
                   name="{$object_name}[h1_header]"
                   id="elm_h1_header"
                   size="10"
                   value="{$object_data.h1_header}"
                   class="input-long"
            /></span>
        </div>
    </div>
</div>
</div>
