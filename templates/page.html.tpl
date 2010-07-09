<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->title();?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">
	
	<?=$data['content'];?>
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
