<div id="nav">
<ul>

	<li><a href="/">home</a></li>
	<li><a href="/about">about</a></li>

	<br />

	<!-- <li><a href="/index">index</a></li> -->
	<? $dirs = get_dirs("", array('recursive' => 0)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="/<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>

    <li><a href="http://flickr.com/photos/quilime">flickr</a></li>
	<li><a href="http://media.quilime.com/aggregate/">aggregate</a></li>
    <li><a href="/.rss">rss</a></li>	




	<br />
	<br />

	<li id="nextprev">
		<? $this->include_template('nextprev.html.tpl'); ?>
	</li>




	<!--
	<li id="viewtoggle">
		<? $this->include_template('viewtoggle.html.tpl'); ?>
	</li>
	-->

</ul>
</div>

