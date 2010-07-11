<ul class="nav">	   

	<li><h2><a href="/"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<? $dirs = get_dirs("", array('recursive' => 0)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $page) : ?>
	<li><a href="<?=$page['url']?>"><?=$page['title']?></a></li>
	<? endforeach; ?>

</ul>	
