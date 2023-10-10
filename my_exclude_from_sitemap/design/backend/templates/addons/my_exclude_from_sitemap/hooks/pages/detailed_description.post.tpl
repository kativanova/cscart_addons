<div class="control-group">
<label class="control-label" for="elm_page_is_excluded">{__("is_excluded")}:</label>
<div class="controls">
    <input type="hidden" name="page_data[is_excluded]" value="N">
    <input type="checkbox" name="page_data[is_excluded]" id="elm_page_is_excluded" {if $page_data.is_excluded == "Y"}checked="checked"{/if} value="Y">
</div>
</div>