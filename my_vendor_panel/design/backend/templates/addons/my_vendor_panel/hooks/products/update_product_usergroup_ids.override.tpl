{if $auth.user_type == "UserTypes::ADMIN"|enum}
{if !"ULTIMATE:FREE"|fn_allowed_for}
    <div class="control-group">
        <label class="control-label">{__("usergroups")}:</label>
        <div class="controls">
            {include file="common/select_usergroups.tpl" id="ug_id" name="product_data[usergroup_ids]" usergroups=["type"=>"C", "status"=>["A", "H"]]|fn_get_usergroups:$smarty.const.DESCR_SL usergroup_ids=$product_data.usergroup_ids input_extra="" list_mode=false}
        </div>
    </div>
{/if}
{else}
    <div hidden></div>
{/if}