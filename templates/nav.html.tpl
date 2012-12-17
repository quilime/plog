<ul id="nav">

    <li><a href="/"><?=SITE_TITLE?></a></li>

    <br />

	<? $dirs = get_dirs("", array('recursive' => 0)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="/<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>

	<!-- <li><a href="/agg">aggregate</a></li> -->
	<li><a href="/photo">photo</a></li>
	<li><a href="/links">links</a></li>

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

