<ul class="nav">	   

	<li><h1><a href="/"><?=SITE_TITLE;?></a></h1></li>
	
	
	<? $dirs = get_dirs("/", array('recursive' => 0)); ?>
	<? foreach($dirs as $d) : ?>
	<li><a href="<?=get_base_dir();?>/<?=$d?>"><?=$d?></a></li>
	<? endforeach; ?>
	
	<br />
	
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $p) : ?>
	<li><a href="<?=$p['url']?>"><?=$p['title']?></a></li>
	<? endforeach; ?>

</ul>	
