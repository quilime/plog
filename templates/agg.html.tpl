<html>
<head>
    
    <?php $this->include_template('head-inc.html.tpl'); ?>
    
    <title><?=SITE_TITLE?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">
	
	<table border="0" id="agg"><tr>

	<!-- quilime:aggregate -->
	<td valign="top" class="column">

<?
	$agg = get_rss_feed('http://media.quilime.com/aggregate/index.php?return=rss'); 
?>
	<h2><a class="mute" href="http://media.quilime.com/aggregate/">aggregate</a></h2>
	<ul class="image">

<?
	$count = 10;
	foreach($agg->channel->item as $item) :  
	if (!$count--) break;
	?>    
	<li title="<?=$item->title?>">
		<a href="<?=$item->link?>"><img src="<?=$item->thumb?>"></a>
	</li>
	<? endforeach; ?>
	</ul>
	
	<p>
	<a class="ext" href="http://media.quilime.com/aggregate/index.php?return=rss">rss</a>, <a class="more" href="http://media.quilime.com/aggregate" title="via quilime.com/aggregate">more &rarr;</a>            
	</p>

	</td>

<? /*
	        <td valign="top" class="column">
	        <?php $tube = get_rss_feed('http://gdata.youtube.com/feeds/base/users/quilime/favorites?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'); ?>
	        <h2><a href="http://www.youtube.com/profile?user=kabr&view=favorites">video </a></h2>
	        <ul class="video">
	        <?php 
	        $count = 11;
	        foreach($tube->channel->item as $tube) :  
	        if ($count-- == 0) break;
	        ?>    
	        <li title="<?php echo str_replace('"', '\'', $tube->title); ?>">
	            <? 
	            $url = $tube->link;
	            $pattern = '/v=(.+?)&/';
	            preg_match($pattern, $url, $matches);
	            $id = $matches[1];
	            ?>
	            <a href="<?php echo $tube->link; ?>">

	            <img src="http://i3.ytimg.com/vi/<?=$id?>/default.jpg" />
	            </a>
	        </li>
	        <? endforeach; ?>  
	        </ul>
	        <p>
	            <a class="more" href="http://www.youtube.com/profile?user=quilime&view=favorites" title="via youtube">more &rarr;</a>            
	        </p>
	        </td>
*/ ?>
<? /*
	<!-- quilime:flickr -->
	<td valign="top" class="column">
		<h3><a class="mute" href="http://flickr.com/photos/quilime/">flickr</a></h3>		
		<ul>
		<? 	$count = 8; $img = get_rss_feed('http://api.flickr.com/services/feeds/photos_public.gne?id=28394478@N00&lang=en-us&format=rss_200');  ?>
        <?php foreach($img->channel->item as $item) : if (!$count--) break; ?>
        <li>
            <?
                $subject = $item->description;
               $pattern = '/<a href="http:\/\/www\.flickr\.com\/photos\/quilime\/(.*) \/><\/a><\/p>/';
                preg_match($pattern, substr($subject, 3), $matches, PREG_OFFSET_CAPTURE);
                echo $matches[0][0];
            ?>
        </li>
<?endforeach;?>
	</ul>
	<p>
	<a class="ext" href="http://api.flickr.com/services/feeds/photos_public.gne?id=28394478@N00&lang=en-us&format=rss_200">rss</a>, <a class="more" href="http://flickr.com/photos/quilime/" title="via flickr">more &rarr;</a>            
	</p>
	</td>
*/ ?>


	<!-- quilime:delicious -->
	<td valign="top" class="column">
		
<?
	$url = 'https://<username>:<password>@api.del.icio.us/v1/posts/recent';
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
	curl_setopt($ch, CURLOPT_TIMEOUT, 5);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
	$data = curl_exec($ch);
	curl_close($ch);     
	$del = new SimpleXMLElement($data);   
?>

	<h3><a class="mute" href="http://delicious.com/quilime/">bookmarks</a></h3>
	
	<ul class="bookmarks">
	<?php foreach($del->post as $d) : ?>
		<li>
			<a href="<?=$d['href']?>"><?=$d['description'];?></a><br/>
			<span class="desc"><?=$d['extended'];?></span>
		</li>
	<? endforeach; ?>       
	</ul>
	
	<p>
	<a class="ext" href="http://feeds.delicious.com/v2/rss/quilime?count=15">rss</a>, <a class="more" href="http://delicious.com/quilime/" title="via delicious">more &rarr;</a>            
	</p>
	
	</td>
	
	
	

	
	
	
	

	</tr></table>	

	</div>

	<? $this->include_template('footer.html.tpl'); ?>

</body>
</html>

<? exit; ?>

<?
	$page = "aggregate";
?>

<html>

<head>
    
    <?php include_template('header-src.html'); ?>
    
    <title><?php echo SITE_TITLE; ?> - aggregate</title>
    
    <link rel="alternate" type="application/rss+xml" title="aggregate" href="http://media.quilime.com/aggregate/?return=rss" />    
    
</head>

<body>
    
    <?php include('nav.html'); ?>
    
    <div id="content">
   
        
    </div>

    
</body>

</html>