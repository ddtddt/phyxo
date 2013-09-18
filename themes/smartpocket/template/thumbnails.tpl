{if !empty($thumbnails)}
{combine_script id='klass' path='themes/smartpocket/js/klass.min.js'}
{combine_script id='photoswipe' path='themes/smartpocket/js/code.photoswipe.jquery.min.js' require='klass,jquery.mobile'}
{combine_script id='smartpocket' path='themes/smartpocket/js/smartpocket.js' require='photoswipe'}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{footer_script}
  var var_loop = {if $smartpocket.loop}true{else}false{/if}, var_autohide = {$smartpocket.autohide}, var_trad = "{'More Information'|@translate}", var_thumb_width={$thumbnail_derivative_params->max_width()};
{/footer_script}

<ul class="thumbnails">
{foreach from=$thumbnails item=thumbnail}{strip}
{assign var=derivative value=$pwg->derivative($thumbnail_derivative_params, $thumbnail.src_image)}
{if isset($page_selection[$thumbnail.id]) and !isset($thumbnail.representative_ext)}
  <li>
    <a href="{$pwg->derivative_url($picture_derivative_params, $thumbnail.src_image)}" data-picture-url="{$thumbnail.URL}" rel="external">
     <img {if !$derivative->is_cached()}data-{/if}src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}">
    </a>
  </li>
{elseif isset($thumbnail.representative_ext)}
  <li>
    <a href="{$thumbnail.URL}" target="_blank" onClick="window.location='{$thumbnail.URL}'">
     <img {if !$derivative->is_cached()}data-{/if}src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}">
    </a>
  </li>
{else}
  <li style="display:none;">
    <a href="{$pwg->derivative_url($picture_derivative_params, $thumbnail.src_image)}" rel="external"></a>
  </li>
{/if}
{/strip}{/foreach}
</ul>
{/if}
