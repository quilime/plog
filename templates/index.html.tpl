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
	<td style="padding-right:100px;" valign="top">
	<h3>code</h3>
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

	<td  valign="top">
	<h3>(b)log</h3>
	<? foreach($data as $entry): 
		if ($entry['cat']['name'] == 'log') : ?>
		<div>&bull; <a href="<?=$entry['url'];?>"><?=date('Y m d', $entry['timestamp']);?> &mdash; <?=$entry['title'];?></a></div>
	<? 	endif;
	endforeach; ?>
	<p><small>
	<a class="rss" href="/log/.rss">rss</a>, <a class="more" href="/log/">more &rarr;</a>
	</small>
	</p>
	</td>

	</tr>
	</table>	

	<br />
	<br />
	<br />
	<br />			

	<div>
	<h3>projects</h3>

	<br />
	<br />

	<? foreach($data as $entry): 
		if ($entry['cat']['name'] == 'projects') : ?>
		<div class="thumb_elem">

			<a href="<?=$entry['url'];?>">
			<div class="thumb"></div>
			<?=$entry['title'];?>
			</a>

		</div>
	<? 	endif;
	endforeach; ?>

		<!--
		&bull; <a href="http://git.quilime.com/?p=plog.git">plog</a> - project+log CMS<br />
		&bull; <a href="https://github.com/quilime/clmpr">clmpr</a> - minimal bookmarking site<br />
			
		<br />

		&bull; <a href="http://portfolio.quilime.com/2008/?p=rattle">Rattles</a> - software<br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=sempernull">Sempernull</a> - projection<br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=synonymovement">Synonymovement</a> - projection<br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=cabspotting">Cabspotting</a> - data visualization<br />
		&bull; <a href="http://content.stamen.com/som_transbay_tower">Bay Area Transit</a> - data visualization<br />		
		&bull; <a href="http://portfolio.quilime.com/2008/?p=mask">Mask</a> - painting<br />
		&bull; <a href="http://portfolio.quilime.com/2008/?p=prism">Prism</a> - painting<br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=01_Dots">Dots</a> - software<br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=02_Jellyfish">Jelly</a> - software<br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=05_Swim_Tank">Swim Tank</a> - software<br />
		&bull; <a href="http://portfolio.quilime.com/new/port.php?p=06_Web">Web</a> - software<br />
		&bull; <a href="http://portfolio.quilime.com/content/daschtein/index.html">Dachstein</a> - installation<br />
		&bull; <a href="http://portfolio.quilime.com/content/cm/index.html">Celestial Mechanics</a> - dome-based animation<br />
		&bull; <a href="http://portfolio.quilime.com/content/valentine/index.html">Valentine</a> - software<br />	

		-->

	</div>

</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
