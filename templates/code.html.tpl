<?php

    if (!isset($entries)) {
        $entries = get_entries();
    }

?>
<html>
<head>
    <? $this->include_template('head-inc.html.tpl') ?>
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
</head>
<body>

<div id="content">

    <div class="entries">
	<? foreach($entries as $entry): 

        if (isset($entry['content_short'])) {
            $entry['content'] = $entry['content_short'] . '<br /><a class="more" href="'.$entry['url'].'">more &rarr;</a><br /><br />';
        } ?>
        
        <h1><a href="/<?=$entry['url']; ?>">&mdash; <?=$entry['title']; ?></a></h1>

        <div class="hidden_entry" style="display:none">
        <? $this->include_template('entry.html.tpl', array('entry' => $entry)); ?>
        </div>

	<? endforeach; ?>
    </div>

    <a href="/index">index &rarr;</a>
    <br />
    <br />
    <br />

</div>

<? $this->include_template('nav.html.tpl') ?>
<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
