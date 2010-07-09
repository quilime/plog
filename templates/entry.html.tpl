<div class="entry">

	<h2>
		<a title="posted on <?=$data['date']?>" href="<?=$data['url']?>"><?=$data['title']?></a>
		<span class="title-date" title="<?=date("F d, Y", $data['timestamp'])?>"><?=get_relative_time($data['timestamp']);?></span>		
	</h2>

	<div class="content">
		<?=$data['content']?>
	</div>

	<? if ($single) :?>
	<div class="metadata">
		posted <?=date("F d, Y", $data['timestamp'])?> in <a href="/<?=$data['cat'];?>/"><?=$data['cat'];?></a><br/>
		<ul class="tags">
		<? foreach($data['tags'] as $tag) : ?>
		<li>#<?=$tag?></li>
		<? endforeach; ?>
		</ul>
	</div>
	<? endif; ?>

</div>
