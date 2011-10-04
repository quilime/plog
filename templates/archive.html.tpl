<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">

	<ul class="archive"> 
	<? foreach($entries as $entry): ?>
	<li>
	<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=date("m-d-Y", $entry['timestamp'])?> <?=$entry['title']?></a>
	</li>
	<? endforeach; ?>	
	</ul>
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
