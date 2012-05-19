<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=$this->page_title(TITLE_DELIMITER);?></title>
    
</head>
<body>
    
<div id="content">

	<table cellspacing="0" cellpadding="0">

	<tr>

    <td valign="top" style="max-width:680px;">
        <h1><a href="/projects/">projects</a></h1>
        <ul class="projects">
        <? $c = 0;  ?>
        <? foreach(get_entries('projects/') as $entry): $c++; ?>
        <li class="project">
            <a href="<?=$entry['url']?>">
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
            <?=$entry['title']?></a>
        </li>
        <? endforeach; ?>   
        </ul>
    </td>        

	<td  style="padding-right:100px;"  valign="top">
		<h1><a href="/log/">log</a></h1>
		<ul class="archive">
		<? $c=15; foreach(get_entries('log/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
		</li>
		<? endforeach; ?>	
		</ul>	
	</td>
	
	<td  style="padding-right:100px;"  valign="top">
		<h1><a class="more" href="/code/">code</a></h1>
		<ul class="archive">
		<? $c=15; foreach(get_entries('code/') as $entry): if ($c--==0) break; ?>
		<li>
		<a href="<?=$entry['url']?>" title="<?=date("m d Y", $entry['timestamp'])?>"><?=$entry['title']?></a>
		</li>
		<? endforeach; ?>	
		</ul>
	</td>

	</tr>
	</table>	



</div>

<br />

    <? $this->include_template('nav.html.tpl') ?>
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
	
