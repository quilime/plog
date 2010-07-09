<ul class="nav">	   

	<li><h2><a href="/"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<h2>content</h2>
	<? $dirs = get_dirs("/", array('recursive' => 0)); ?>
	<? foreach($dirs as $d) : ?>
	<li><a href="<?=get_base_dir();?>/<?=$d?>"><?=$d?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<h2>pages</h2>	
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $p) : ?>
	<li><a href="<?=$p['url']?>"><?=$p['title']?></a></li>
	<? endforeach; ?>

</ul>	
