<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?> <?=$data['title']?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">

	<?=$page['content'];?>
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
