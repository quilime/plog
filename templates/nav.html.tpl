<ul class="nav">	   

	<li><h2><a href="<?=WEB_ROOT;?>"><?=SITE_TITLE;?></a></h2></li>
	
	<br />
	
	<h3>content</h3>
	
	<? $dirs = get_dirs(); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>
	
	<br />
	
	<h3>pages</h3>
	
	<? $pages = get_pages(); ?>
	<? foreach($pages as $page) : ?>
	<li><a href="<?=$page['url']?>"><?=$page['title']?></a></li>
	<? endforeach; ?>

<br />

<? /*
<ul class="index">
    <li><h3>index</h3></li>
	<? list($dirs, $total) = get_entries(""); ?>
	<?php foreach($dirs as $entry): ?>
    <li><a href="<?php echo $entry['url']; ?>"><?php echo $entry['title']; ?></a></li>
    <?php endforeach; ?>
</ul>
*/ ?>

</ul>
