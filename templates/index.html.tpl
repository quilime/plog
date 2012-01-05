<html>
<head>

    <? $this->include_template('head-inc.html.tpl') ?>

    <title><?=SITE_TITLE?></title>

</head>
<body>

    <? $this->include_template('nav.html.tpl') ?>

<div id="content">

	<table>
	<tr>
	<td class="column" valign="top">
	<h3><a href="/code/">code</a></h3>
	<? foreach($data as $entry): 
		if ($entry['cat']['name'] == 'code') : ?>
		<div>&bull; <a href="<?=$entry['url'];?>"><?=$entry['title'];?></a></div>
	<? 	endif;
	endforeach; ?>
	<p><small>
	<a class="rss" href="/code/.rss">rss</a>, <a class="more" href="/code/">more &rarr;</a>
	</small>
	</p>
	</td>

	<td class="column" valign="top">
	<h3><a href="/log/">'blog</a></h3>
	<? foreach($data as $entry): 
		if ($entry['cat']['name'] == 'log') : ?>
		<div>&bull; <a href="<?=$entry['url'];?>"><?=date('Y m d', $entry['timestamp']);?> &mdash; <?=$entry['title'];?></a></div>
	<? 	endif;
	endforeach; ?>
	<br />
	<p><small>
	<a class="rss" href="/log/.rss">rss</a>, <a class="more" href="/log/">more &rarr;</a>
	</small>
	</p>
	</td>


	<td class="column" valign="top">
	<h3><a href="/projects/">projects</a></h3>
		&bull; <a href="http://git.quilime.com/?p=plog.git">plog</a> - project+log CMS<br />
		&bull; <a href="https://github.com/quilime/clmpr">clmpr</a> - minimal bookmarking site<br />
			
		<br />

		&bull; <a href="http://portfolio.quilime.com/2008/?p=rattle">Rattles</a><br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=sempernull">Sempernull</a><br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=synonymovement">Synonymovement</a><br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=cabspotting">Cabspotting</a><br />
		&bull; <a href="http://content.stamen.com/som_transbay_tower">Bay Area Transit</a><br />		
		&bull; <a href="http://portfolio.quilime.com/2008/?p=mask">Mask</a><br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=prism">Prism</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=01_Dots">Dots</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=02_Jellyfish">Jelly</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=05_Swim_Tank">Swim Tank</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=06_Web">Web</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=04_Stars">Sempernull</a><br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=03_Rattles">Rattles</a><br />
		&bull; <a href="http://portfolio.quilime.com/content/daschtein/index.html">Dachstein</a><br />
		&bull; <a href="http://portfolio.quilime.com/content/cm/index.html">Celestial Mechanics</a><br />
		&bull; <a href="http://portfolio.quilime.com/content/valentine/index.html">Valentine</a><br />



	</td>
	</tr>
	</table>	

</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
