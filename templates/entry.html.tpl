<div class="entry">

	<h2>
		<a title="posted on <?=$data['date']?>" href="<?=$data['url']?>"><?=$data['title']?></a>
	</h2>

	<div class="content">
		<?=$data['content']?>
	</div>

	<div class="metadata">
		posted <abbr title="<?=get_relative_time($data['timestamp']);?>"><?=date("F d, Y", $data['timestamp'])?></abbr> in <a href="<?=get_base_dir();?>/<?=$data['cat'];?>"><?=$data['cat'];?></a><br/>
		<ul class="tags">
		<? if (sizeof($data['tags']) > 0) foreach($data['tags'] as $tag) : ?>
		<li>#<?=$tag?></li>
		<? endforeach; ?>
		</ul>
	</div>

</div>

