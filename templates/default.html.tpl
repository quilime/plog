<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">

	<? foreach($entries as $entry): ?>
	<?  
    if (isset($entry['content_short'])) 
        $entry['content'] = $entry['content_short'] . '<br /><a class="more" href="'.$entry['url'].'">more &rarr;</a><br /><br />';
    $this->include_template('entry.html.tpl', array('entry' => $entry)); 
    ?>
	<? endforeach; ?>	
	
</div>

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
