<div id="nav">	   

	<ul class="archive">
	<? foreach(get_entries() as $entry): ?>
	<li>
	<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
	</li>
	<? endforeach; ?>	
	</ul>
	
	<br />	

	<a href="<?=WEB_ROOT?>?p=info">info</a>

</div>
