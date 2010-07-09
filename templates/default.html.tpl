<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->title();?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">

	<? if (sizeof($data) > 0) foreach($data as $entry): ?>
	<? $this->include_template('entry.html.tpl', array('data' => $entry)); ?>
	<? endforeach; ?>	
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
