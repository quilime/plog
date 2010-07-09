<ul class="nav">	   

	<li><h2><a href="/"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<h3>categories</h3>
	
	<? $categories = get_content_folders(); ?>
	<? foreach($categories as $cat) : ?>
	<li><a href="<?=$cat['url']?>"><?=$cat['title']?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<h3>pages</h3>
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $page) : ?>
	<li><a href="<?=$page['url']?>"><?=$page['title']?></a></li>
	<? endforeach; ?>

</ul>	
