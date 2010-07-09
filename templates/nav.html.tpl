<ul class="nav">	   

	<li><h2><a href="/"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<? $categories = get_content_folders(); ?>
	<? foreach($categories as $cat) : ?>
	<li><a href="<?=$cat['url']?>"><?=$cat['title']?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<li><a href="/agg/">aggregate</a></li>
	<li><a href="/links/">links</a></li>	
	<li><a href="/about/">about</a></li>

</ul>	
