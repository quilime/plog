<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?> <?=$data['title']?></title>
    
</head>
<body>
    
    
    
<div id="content">

<!-- <<<<<<< HEAD
	<div class="page">
	<?=$data['content'];?>
	</div>
======= -->
	<?=$page['content'];?>
<!-- >>>>>>> 2ae0cd949c331f83dcb05116cffdca21b2ecb871 -->
	
</div>

	<? $this->include_template('nav.html.tpl') ?>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
