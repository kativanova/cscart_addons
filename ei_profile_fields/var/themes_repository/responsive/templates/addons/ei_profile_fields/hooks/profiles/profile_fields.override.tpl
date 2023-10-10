<div class="ty-control-group ty-profile-field__item ty-{$field.class}">
{if ($pref_field_name != $field.description || $required == "Y") && $field.field_type != "ProfileFieldTypes::VENDOR_TERMS"|enum}
    <label
        for={$element_id}
        class="ty-control-group__title cm-profile-field {if $field.autocomplete_type == "phone-full" || $field.field_type == "ProfileFieldTypes::PHONE"|enum}cm-mask-phone-label{/if} {if $required == "Y"}cm-required{/if}{if $field.field_type == "Z"} cm-zipcode{/if}{if $field.field_type == "E"} cm-email{/if} {if $field.field_type == "Z"}{if $section == "S"}cm-location-shipping{else}cm-location-billing{/if}{/if}"
    >{$field.description}</label>
{/if}

    {if $field.field_type == "ProfileFieldTypes::STATE"|enum}
        {$_country = $profile_data.s_country}
        {$_state = $value}

        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select-state cm-state {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} {if !$skip_field}{$_class}{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {if $required !== "Y"}
                <option value="">- {__("select_state")} -</option>
            {/if}
            {if $states && $states.$_country}
                {foreach from=$states.$_country item=state}
                    <option {if $_state == $state.code}selected="selected"{/if} value="{$state.code}">{$state.state}</option>
                {/foreach}
            {/if}
        </select>

        <input {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} type="text" id="elm_{$field.field_id}_d" name="{$data_name}[{$data_id}]" size="32" maxlength="64" value="{$_state}" disabled="disabled" class="cm-state {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} ty-input-text hidden {if $_class}disabled{/if}"/>

    {elseif $field.field_type == "ProfileFieldTypes::COUNTRY"|enum}
        {$_country = $value}

        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select-country cm-country {if $section == "S"}cm-location-shipping{else}cm-location-billing{/if} {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {hook name="profiles:country_selectbox_items"}
            {if $required !== "Y"}
                <option value="">- {__("select_country")} -</option>
            {/if}
            {foreach from=$countries item="country" key="code"}
            <option {if $_country == $code}selected="selected"{/if} value="{$code}">{$country}</option>
            {/foreach}
            {/hook}
        </select>

    {elseif $field.field_type == "ProfileFieldTypes::CHECKBOX"|enum}
        <input type="hidden" name="{$data_name}[{$data_id}]" value="N" {if !$skip_field}{$disabled_param nofilter}{/if} />
        <input type="checkbox" id={$element_id} name="{$data_name}[{$data_id}]" value="Y" {if $value == "Y"}checked="checked"{/if} class="checkbox {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" {if !$skip_field}{$disabled_param nofilter}{/if} />

    {elseif $field.field_type == "ProfileFieldTypes::TEXT_AREA"|enum}
        <textarea placeholder="{$field.field_placeholder}" {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} class="ty-input-textarea {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" id={$element_id} name="{$data_name}[{$data_id}]" cols="32" rows="3" {if !$skip_field}{$disabled_param nofilter}{/if}>{$value}</textarea>
        <span class="ty-muted">{$field.field_description}</span>
    {elseif $field.field_type == "ProfileFieldTypes::DATE"|enum}
        {if !$skip_field}
            {include file="common/calendar.tpl" date_id="`$id_prefix`elm_`$field.field_id`" date_name="`$data_name`[`$data_id`]" date_val=$value extra=$disabled_param}
        {else}
            {include file="common/calendar.tpl" date_id="`$id_prefix`elm_`$field.field_id`" date_name="`$data_name`[`$data_id`]" date_val=$value}
        {/if}

    {elseif $field.field_type == "ProfileFieldTypes::SELECT_BOX"|enum}
        <select {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if} id={$element_id} class="ty-profile-field__select {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if}" name="{$data_name}[{$data_id}]" {if !$skip_field}{$disabled_param nofilter}{/if}>
            {if $required != "Y"}
            <option value="">--</option>
            {/if}
            {foreach from=$field.values key=k item=v}
            <option {if $value == $k}selected="selected"{/if} value="{$k}">{$v}</option>
            {/foreach}
        </select>

    {elseif $field.field_type == "ProfileFieldTypes::RADIO"|enum}
        <div id={$element_id}>
            {foreach from=$field.values key=k item=v name="rfe"}
            <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_{$k}" name="{$data_name}[{$data_id}]" value="{$k}" {if (!$value && $smarty.foreach.rfe.first) || $value == $k}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{$v}</span>
            {/foreach}
        </div>

    {elseif $field.field_type == "ProfileFieldTypes::ADDRESS_TYPE"|enum}
        <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_residential" name="{$data_name}[{$data_id}]" value="residential" {if !$value || $value == "residential"}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{__("address_residential")}</span>
        <input class="radio {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {$id_prefix}elm_{$field.field_id}" type="radio" id="{$id_prefix}elm_{$field.field_id}_commercial" name="{$data_name}[{$data_id}]" value="commercial" {if $value == "commercial"}checked="checked"{/if} {if !$skip_field}{$disabled_param nofilter}{/if} /><span class="radio">{__("address_commercial")}</span>

    {elseif $field.field_type == "ProfileFieldTypes::VENDOR_TERMS"|enum}

        {include file="views/profiles/components/vendor_terms.tpl"}

    {elseif $field.field_type == "ProfileFieldTypes::FILE"|enum}
        {if isset($value.file_name)}
            <div class="text-type-value" data-file-id="{$hash_name}">
                {$additional_class = ($field.required === "YesNo::YES"|enum) ? "cm-file-required" : ""}
                {include_ext file="common/icon.tpl"
                    class="ty-icon-cancel-circle ty-fileuploader__icon cm-file-remove `$additional_class`"
                    id=$hash_name title=__("remove_this_item")
                }
                <span class="ty-fileuploader__filename ty-filename-link upload-filename">
                    <a href="{$value.link|default:""}">{$value.file_name}</a>
                </span>
            </div>
        {/if}
        {include file="common/fileuploader.tpl"
            var_name=$var_name
            label_id="elm_{$id_prefix}{$field.field_id}"
            hidden_name="{$data_name}[{$data_id}]"
            hidden_value=$value.file_name|default:""
            prefix=$id_prefix
            disabled_param=$disabled_param
            max_upload_filesize=$config.tweaks.profile_field_max_upload_filesize
        }

    {else}  {* Simple input *}
        <input
            {if $field.autocomplete_type}x-autocompletetype="{$field.autocomplete_type}"{/if}
            type="text"
            placeholder="{$field.field_placeholder}"
            id={$element_id}
            name="{$data_name}[{$data_id}]"
            size="32"
            value="{$value}"
            class="ty-input-text{if ($field.autocomplete_type == "phone-full") || ($field.field_type == "ProfileFieldTypes::PHONE"|enum)} cm-mask-phone{/if} {if !$skip_field}{$_class}{else}cm-skip-avail-switch{/if} {if $smarty.foreach.profile_fields.index == 0} cm-focus{/if}" {if !$skip_field}{$disabled_param nofilter}{/if}
        />
        <span class="ty-muted">{$field.field_description}</span>
    {/if}

{assign var="pref_field_name" value=$field.description}
</div>

{if $field.field_name == 'city'}

    <script  class="cm-ajax-force">
    //<![CDATA[

            Tygh.$("[name='company_data[city]']").autocomplete({$ldelim}
                source: function( request, response ) {$ldelim}

                    var check_country;
                    var check_state;
                    check_country = $("[name='company_data[country]']").length ? $("[name='company_data[country]']").val() : '';
                    check_state = $("[name='company_data[state]']").length ? $("[name='company_data[state]']").val() : '';

                    $.ceAjax('request', fn_url('city.autocomplete_city?q=' + request.term + '&check_state=' + check_state + '&check_country=' + check_country), {$ldelim}
                        callback: function(data) {$ldelim}
                            response(data.autocomplete);
                        {$rdelim}
                    {$rdelim});
                {$rdelim}
            {$rdelim});

    //]]>
    </script>

{/if}
