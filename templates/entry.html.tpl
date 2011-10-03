<div class="entry">

	<h2>
		<a title="posted on <?=$entry['date']?>" href="<?=$entry['url']?>"><?=$entry['title']?></a>
	</h2>

	<div class="content">
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		posted <abbr title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></abbr> 
		in <a href="<?=$entry['cat']['url'];?>"><?=$entry['cat']['name'];?></a>
		<br/>
		<ul class="tags">
		<? if ($entry['tags']) foreach($entry['tags'] as $tag) : ?>
		<li>#<?=$tag?></li>
		<? endforeach; ?>
		</ul>
	</div>

</div>
