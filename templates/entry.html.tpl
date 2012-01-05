<div class="entry">

	<h1>
		<a title="posted on <?=$data['date']?>" href="<?=$data['url']?>"><?=$data['title']?></a>
	</h1>

	<div class="content">	
		<?=$data['content']?>
	</div>

	<div class="metadata">
		posted <abbr title="<?=get_relative_time($data['timestamp']);?>"><?=date("F d, Y", $data['timestamp'])?></abbr> 
		in <a href="<?=$data['cat']['url'];?>"><?=$data['cat']['name'];?></a> filed as <? if ($data['tags']) echo implode(', ', $data['tags']); ?>
		
	</div>

</div>
