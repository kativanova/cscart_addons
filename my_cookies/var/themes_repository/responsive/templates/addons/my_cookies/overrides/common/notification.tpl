<div class="cm-notification-container notification-container">
{if !"AJAX_REQUEST"|defined}
{foreach from=""|fn_get_notifications item="message" key="key"}
{if $message.type == "I"}
    <div class="ui-widget-overlay" data-ca-notification-key="{$key}"></div>
    <div class="cm-notification-content cm-notification-content-extended notification-content-extended{if $message.message_state == "I"} cm-auto-hide{/if}" data-ca-notification-key="{$key}">
        <h1>{$message.title}<span class="cm-notification-close {if $message.message_state == "S"} cm-notification-close-ajax{/if}"></span></h1>
        <div class="notification-body-extended">
            {$message.message nofilter}
        </div>
    </div>
{elseif $message.type == "O"}
    <div class="cm-notification-content notification-content alert-error" data-ca-notification-key="{$key}">
        <button type="button" class="close cm-notification-close" {if $message.message_state != "S"}data-dismiss="alert"{/if}>&times;</button>
        {$message.message nofilter}
    </div>
{elseif $message.type == "W" && $message.extra == 'gdpr.uk_cookies_law'}
    <div class="cm-notification-content notification-content{if $message.type == "W"} alert-warning{/if} gdpr-cookies" data-ca-notification-key="{$key}">
        <button type="button" class="close cm-notification-close {if $message.message_state == "S"} cm-notification-close-ajax{/if}" {if $message.message_state != "S"}data-dismiss="alert"{/if}>&times;</button>
        <p><strong>{__("cookies_and_privacy")}</strong></p>
        <p>{$message.message nofilter}</p>
    </div>
{else}
    <div class="cm-notification-content notification-content{if $message.message_state == "I"} cm-auto-hide{/if} {if $message.type == "N"}alert-success{elseif $message.type == "W"}alert-warning{else}alert-error{/if}{if $message.extra == 'gdpr.uk_cookies_law'} gdpr-cookies {/if}" data-ca-notification-key="{$key}">
        <button type="button" class="close cm-notification-close {if $message.message_state == "S"} cm-notification-close-ajax{/if}" {if $message.message_state != "S"}data-dismiss="alert"{/if}>&times;</button>
        <strong>{$message.title}</strong>
        {$message.message nofilter}
    </div>
{/if}
{/foreach}
{/if}
</div>