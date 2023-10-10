{if $auth.user_type == "UserTypes::ADMIN"|enum}
    {include file="common/subheader.tpl" title=__("my_vendor_filter.featured_vendor_title")}
    <div class="control-group">
        <label class="control-label" for="elm_is_featured_vendor">{__("my_vendor_filter.is_featured_vendor")}:</label>
        <div class="controls">
            <label class="checkbox">
                <input type="hidden" name="company_data[is_featured_vendor]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox"
                    name="company_data[is_featured_vendor]" 
                    id="elm_is_featured_vendor"
                    value="{"YesNo::YES"|enum}"
                    {if $company_data['is_featured_vendor'] == 'Y'}
                        checked="checked" 
                    {/if}
                />
            </label>
        </div>
    </div>
{/if}