<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
    
<div id="content">

    <h1>projects</h1>

    <? $c = 0; foreach($entries as $entry): $c++;?>
    <?  if (isset($entry['content_short'])) ?>
            
            <div class="project">
            <a href="/<?= $entry['url']?>">
            <div class="thumb">

            <? if (isset($entry['config']['thumb'])): ?>
            <img src="<?= $entry['config']['thumb']?>">
            <? else : ?>

                <canvas id="thumb_<?=$c?>" width="100" height="100"></canvas>
                <script>
                    var canvas = document.getElementById('thumb_<?=$c?>');
                    if(canvas && canvas.getContext) {
                        var ctx = canvas.getContext('2d');
                        ctx.strokeStyle = "rgba(42, 128, 235, .25)";
                        ctx.fillStyle   = "#121212";
                        ctx.fillRect (0, 0, 100, 100);
                        ctx.fill();
                        ctx.beginPath();
                        ctx.moveTo(10, 10);
                        ctx.lineTo(90, 90);
                        ctx.moveTo(90, 10);
                        ctx.lineTo(10, 90);                        
                        ctx.closePath();
                        ctx.stroke();
                        ctx.fill();
                    }
                </script>


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
