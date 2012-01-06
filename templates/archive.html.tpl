<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    
<div id="content">

    <ul class="archive">
	<? foreach($entries as $entry): ?>
    <li>
        &mdash; <a class="more" href="<?= $entry['url']; ?>"><?= $entry['title']; ?></a>
    </li>
	<? endforeach; ?>	
    </ul>
	
</div>

	<? $this->include_template('footer.html.tpl') ?>
    <? $this->include_template('nav.html.tpl') ?>

</body>
</html>
