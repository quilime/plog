<div class="entry">

	<div class="content">
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		"<a href="<?=$entry['url']?>"><?=$entry['title']?></a>", 
		<span title="<?=get_relative_time($entry['timestamp']);?>"><?=date(ENTRY_DATE_FORMAT, $entry['timestamp'])?></span> 
		<? if (!empty($entry['cat']['name'])): ?>
		in <a href="<?=$entry['cat']['url'];?>"><?=$entry['cat']['name'];?></a>
		<br/>
		<? endif; ?>
		<ul class="tags">
		<? if ($entry['tags']) foreach($entry['tags'] as $tag) : ?>
		<li>#<?=$tag?></li>
		<? endforeach; ?>
		</ul>
	</div>	

</div>
