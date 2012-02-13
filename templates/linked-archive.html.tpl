<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    
<div id="content">

    <ul class="archive">
    <? foreach($entries as $entry): ?>
    <li>
        <a class="more" href="#<?= $entry['url']; ?>"><?= $entry['title']; ?></a>
    </li>
    <? endforeach; ?>   
    </ul>

    <br />
    <br />
    <br />
    <br />


    <div class="inline">
	<? foreach($entries as $entry): ?>
	<?  
        if (isset($entry['content_short'])) 
            $entry['content'] = $entry['content_short'] . '<br /><a class="more" href="'.$entry['url'].'">more &rarr;</a><br /><br />';

        ?>
        <a name="<?= $entry['url'] ?>">
        <?

        $this->include_template('entry.html.tpl', array('entry' => $entry)); 
    ?>
	<? endforeach; ?>	
    </div>
	
</div>

	<? $this->include_template('footer.html.tpl') ?>
    <? $this->include_template('nav.html.tpl') ?>

</body>
</html>
