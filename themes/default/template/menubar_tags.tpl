<dt>{'Related tags'|@translate}</dt>
<dd>
	<div id="menuTagCloud">
		{foreach from=$block->data item=tag}
		<span style="margin-right:5px;">
			<a class="tagLevel{$tag.level}" href="{$tag.U_ADD}"
				title="{$pwg->l10n_dec('%d image is also linked to current tags', '%d images are also linked to current tags', $tag.counter)}"
				rel="nofollow">
				+{$tag.name}
			</a>
                </span>
		{/foreach}
	</div>
</dd>

