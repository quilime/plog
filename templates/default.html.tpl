<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">

	<? foreach($data as $entry): ?>
	<? $this->include_template('entry.html.tpl', array('data' => $entry)); ?>
	<? endforeach; ?>	
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
