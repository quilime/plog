<ul class="nav">


    <li><a href="/">home</a></li>

	<? $dirs = get_dirs("", array('recursive' => 0)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>

	<li><a href="/photo/">photo</a></li>
	<li><a href="/agg/">aggregate</a></li>
	<li><a href="/links/">links</a></li>



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
