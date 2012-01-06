<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    
<div id="content">

    <? foreach($entries as $entry): ?>
    <?  if (isset($entry['content_short'])) ?>
            
            <div class="project">
            <a href="<?= $entry['url']?>">
            <div class="thumb">
            <? if (isset($entry['config']['thumb'])): ?>
            <img src="<?= $entry['config']['thumb']?>">
            <? endif; ?>
            </div>
            <?= $entry['title']; ?>
            </a>
            </div>

    <? endforeach; ?>   
    
</div>

    <? $this->include_template('footer.html.tpl') ?>
    <? $this->include_template('nav.html.tpl') ?>

</body>
</html>
