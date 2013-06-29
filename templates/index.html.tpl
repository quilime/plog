<html>
<head>

    <? $this->include_template('head-inc.html.tpl') ?>

    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>

</head>
<body>

<div id="content">

	<table cellspacing="0" cellpadding="0">

	<tr>

	<td  style="padding-right:100px;"  valign="top">
		<h1><a href="/log/">log</a></h1>
		<ul class="archive">
		<? $c=9999; foreach(get_entries('log/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=date("Y m d ", $entry['timestamp'])?><?=$entry['title']?></a>
		</li>
		<? endforeach; ?>
		</ul>
	</td>

	<td  style="padding-right:100px;"  valign="top">
		<h1><a class="more" href="/code/">code</a></h1>
		<ul class="archive">
		<? $c=9999; foreach(get_entries('code/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
		</li>
		<? endforeach; ?>
		</ul>
	</td>

	</tr>
	</table>



</div>

<br />

    <? $this->include_template('nav.html.tpl') ?>
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>

