<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?><?=$page['title']?></title>
    
</head>
<body>
    
    
    
<div id="content">

	<?=$page['content'];?>
	
</div>

	<? $this->include_template('nav.html.tpl') ?>
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
