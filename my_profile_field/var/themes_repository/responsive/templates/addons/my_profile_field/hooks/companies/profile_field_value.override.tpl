{hook name="companies:profile_field_value"}
<label class="ty-company-detail__control-label">{$field_data.description}:</label>
{if $field_data.field_type === "ProfileFieldTypes::EMAIL"|enum}
    <span><a href="mailto:{$field_value}">{$field_value}</a></span>
{elseif $field_data.field_type === "ProfileFieldTypes::CHECKBOX"|enum}
    <span>{if $field_value === "YesNo::YES"|enum}{__("yes")}{else}{__("no")}{/if}</span>
{elseif $field_data.field_type === "ProfileFieldTypes::DATE"|enum}
    <span>{$field_value|date_format:"`$settings.Appearance.date_format`"}</span>
{elseif $field_data.field_type === "ProfileFieldTypes::RADIO"|enum
    || $field_data.field_type === "ProfileFieldTypes::SELECT_BOX"|enum
}
    <span>{$field_data.values.$field_value}</span>
{elseif $field_data.field_type === "ProfileFieldTypes::FILE"|enum && $field_value.file_name}
    <span><a href="{$field_value.link|default:""}">{$field_value.file_name}</a></span>
{elseif $field_id === "url"} {* FIXME: URL display is hardcoded *}
    <span><a href="{$field_value|normalize_url}">{$field_value}</a></span>
{elseif $field_data.field_type === "ProfileFieldTypes::PHONE"|enum || ($field_data.autocomplete_type === "phone-full")}
    <span><bdi>{$field_value}</bdi></span>
{elseif $field_data.field_type === "ProfileFieldTypes::COUNTRY"|enum}
    <span><bdi>{$field_value|fn_get_country_name}</bdi></span>
{elseif $field_data.field_type === "ProfileFieldTypes::STATE"|enum}
    <span><bdi>{$field_value|fn_get_state_name:$company_data.country}</bdi></span>
{elseif $field_data.field_type === "L"}
    {$link = $field_data.social_media_link|cat:$field_value}
    <span><a href="{$link}">@{$field_value}</a></span>
{else}
    <span>{$field_value}</span>
{/if}
{/hook}