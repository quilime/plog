<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
<div id="content">

	<table>
	<tr>
	<td style="padding-right:100px;" valign="top">
		<h3><a class="more" href="/code/">code</a></h3>
		<ul class="archive">
		<? $c=15; foreach(get_entries('code/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
		</li>
		<? endforeach; ?>	
		</ul>
		<p><a class="more" href="/code/">more &rarr;</a></p>
	</td>

	<td  valign="top">
		<h3><a href="/journal/">log</a></h3>
		<ul class="archive">
		<? $c=15; foreach(get_entries('journal/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=date('Y m d', $entry['timestamp']);?> &mdash; <?=$entry['title']?></a>
		</li>
		<? endforeach; ?>	
		</ul>	
		<p><a class="more" href="/log/">more &rarr;</a></p>
	</td>

	</tr>
	</table>	

	<br />
	<br />
	<br />
	<br />			

	<div>
	<h3><a href="/projects/">projects</a></h3>
		
	<ul class="projects">
	<? foreach(get_entries('projects/') as $entry): ?>
	<li class="project">
		<a href="<?=$entry['url']?>">
            <div class="thumb">
            <? if (isset($entry['config']['thumb'])): ?>
            <img src="<?= $entry['config']['thumb']?>">
            <? endif; ?>
            </div>
		<?=$entry['title']?></a>
	</li>
	<? endforeach; ?>	
	</ul>	

		&bull; <a href="http://content.stamen.com/som_transbay_tower">Bay Area Transit</a> - data visualization<br />		
		&bull; <a href="http://portfolio.quilime.com/content/daschtein/index.html">Dachstein</a> - installation<br />
		&bull; <a href="http://portfolio.quilime.com/content/cm/index.html">Celestial Mechanics</a> - dome-based animation<br />
		&bull; <a href="http://portfolio.quilime.com/content/valentine/index.html">Valentine</a><br />	

	<br />
	<br />
	<br />

	<h3><a href="/software/">software</a></h3>
		
		&bull; <a href="http://git.quilime.com/?p=plog.git">plog</a> - project+log CMS<br />
		&bull; <a href="https://github.com/quilime/clmpr">clmpr</a> - minimal bookmarking site<br />


	</div>

</div>


    <? $this->include_template('nav.html.tpl') ?>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
	
