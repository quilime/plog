<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?> <?=$entry['title'];?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
	<div id="content">
		<? $this->include_template('entry.html.tpl'); ?>	
	</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
