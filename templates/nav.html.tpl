<ul class="nav">	   

	<li><h2><a href="/"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<h3>categories</h3>
	
	<? $dirs = get_dirs(); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir?>"><?=$dir?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<h3>pages</h3>
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $page) : ?>
	<li><a href="<?=$page['url']?>"><?=$page['title']?></a></li>
	<? endforeach; ?>

</ul>	
