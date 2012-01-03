<ul class="nav">


    <li><a href="/"><?=SITE_TITLE?></a></li>

    <br />

	<small>categories</small>
	<? $dirs = get_dirs("", array('recursive' => 0)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>

	<small><br /></small>
    <li><a href="/projects/">projects</a></li>
	<li><a href="/photo/">photo</a></li>
	<li><a href="/agg/">aggregate</a></li>
	<li><a href="/links/">links</a></li>
    <li><a href="/about/">about</a></li>

    <br />

    <li><a class="rss" href="/.rss">rss</a></li>



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
