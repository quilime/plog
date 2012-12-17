<html>
<head>
    <? $this->include_template('head-inc.html.tpl') ?>
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
</head>
<body>

<div id="content">

    <div class="entries">
	<? $limit = LIMIT; foreach($entries as $entry): if ($limit-- == 0) break; ?>
        
        <? if (isset($entry['content_short'])): ?>
            <? $entry['content'] = $entry['content_short'] . '<br /><a class="more" href="'.$entry['url'].'">more &rarr;</a><br /><br />'; ?>
        <? endif; ?>

        <? $this->include_template('entry.html.tpl', array('entry' => $entry)); ?>

	<? endforeach; ?>
    </div>

    <a href="/index">&uarr; index</a>
    <br />
    <br />
    <br />

</div>

<? $this->include_template('nav.html.tpl') ?>
<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
