<div class="entry">

	<h1>
		<a title="posted on <?=$entry['date']?>" href="/<?=$entry['url']?>"><?=$entry['title']?></a>
	</h1>

	<div class="content">	
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		<a title="posted on <?=$entry['date']?>" href="<?=$entry['url']?>">#</a>
		<span title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></span> 
		in <a href="/<?=$entry['cat']['url'];?>"><?=$entry['cat']['name'];?></a><? if ($entry['tags']) echo ' as ' . implode(', ', $entry['tags']); ?>
	</div>

</div>
