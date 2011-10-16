<div id="nav">	   

	<ul class="archive">
	<? foreach(get_entries() as $entry): ?>
	<li>
	<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
	</li>
	<? endforeach; ?>	
	</ul>
	
	<br />	

	<a class="mute" href="<?=WEB_ROOT?>?p=about">about</a>

</div>
