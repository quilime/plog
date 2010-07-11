<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?>: <?=$data['title'];?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
	<div id="content">
		<? $this->include_template('entry.html.tpl', array('data' => $data)); ?>	
	</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
