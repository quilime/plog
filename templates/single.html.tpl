<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=$entry['title'];?></title>
    
</head>
<body>
    
    
	<div id="content">
		<? $this->include_template('entry.html.tpl'); ?>	
	</div>

	<? $this->include_template('nav.html.tpl') ?>	

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
