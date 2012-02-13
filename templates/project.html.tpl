<div class="entry">

	<div class="content">	
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		<a title="posted on <?=$entry['date']?>" href="<?=$entry['url']?>"><?=$entry['title']?></a><br />
		<abbr title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></abbr> 
		in <a href="/<?=$entry['cat']['url'];?>"><?=$entry['cat']['name'];?></a><? if ($entry['tags']) echo ' filed as ' . implode(', ', $entry['tags']); ?>		
	</div>

</div>
