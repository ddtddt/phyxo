{combine_script id='core.switchbox' load='footer' require='jquery' path='themes/default/js/switchbox.js'}
{$MENUBAR}


{if isset($errors) or isset($infos)}
<div class="content messages{if isset($MENUBAR)} contentWithMenu{/if}">
{include file='infos_errors.tpl'}
</div>
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
<div class="titrePage">
  <ul class="categoryActions">
{if !empty($image_orders)}
    <li>{strip}<a id="sortOrderLink" title="{'Sort order'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
      <span class="pwg-icon pwg-icon-sort">&nbsp;</span><span class="pwg-button-text">{'Sort order'|@translate}</span>
    </a>
    <div id="sortOrderBox" class="switchBox">
      <div class="switchBoxTitle">{'Sort order'|@translate}</div>
      {foreach from=$image_orders item=image_order name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
      {if $image_order.SELECTED}
      <span>&#x2714; </span>{$image_order.DISPLAY}
      {else}
      <span style="visibility:hidden">&#x2714; </span><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a>
      {/if}
      {/foreach}
    </div>
    {footer_script require='core.switchbox'}switchBox("#sortOrderLink", "#sortOrderBox");{/footer_script}
    {/strip}</li>
{/if}
{if !empty($image_derivatives)}
    <li>{strip}<a id="derivativeSwitchLink" title="{'Photo sizes'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
      <span class="pwg-icon pwg-icon-sizes">&nbsp;</span><span class="pwg-button-text">{'Photo sizes'|@translate}</span>
    </a>
    <div id="derivativeSwitchBox" class="switchBox">
      <div class="switchBoxTitle">{'Photo sizes'|@translate}</div>
      {foreach from=$image_derivatives item=image_derivative name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
      {if $image_derivative.SELECTED}
      <span>&#x2714; </span>{$image_derivative.DISPLAY}
      {else}
      <span style="visibility:hidden">&#x2714; </span><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a>
      {/if}
      {/foreach}
    </div>
    {footer_script require='core.switchbox'}switchBox("#derivativeSwitchLink", "#derivativeSwitchBox");{/footer_script}
    {/strip}</li>
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
  </ul>

<h2>{$TITLE}</h2>
</div>{* <!-- titrePage --> *}

{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if !empty($CONTENT)}{$CONTENT}{/if}

{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>{* <!-- content --> *}
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
