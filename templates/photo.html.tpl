<html>
<head>
    
    <?php $this->include_template('head-inc.html.tpl'); ?>
    
    <title><?=SITE_TITLE?>: photo</title>
    <style>
    	ul, li {
    		list-style-type:none;

    	}
    	ul {
    		margin:0;
    		padding:0;
    	}
    </style>
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
<div id="content">
	


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

	<!-- quilime:flickr -->
		<ul>
		<? 	$count = 16; $img = get_rss_feed('http://api.flickr.com/services/feeds/photos_public.gne?id=28394478@N00&lang=en-us&format=rss_200');  ?>
        <?php foreach($img->channel->item as $item) : if (!$count--) break; ?>
        <li style="float:left; height:280px;margin-right:20px;">
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
	<a class="rss" href="http://api.flickr.com/services/feeds/photos_public.gne?id=28394478@N00&lang=en-us&format=rss_200">rss</a>, <a class="more" href="http://flickr.com/photos/quilime/" title="via flickr">more &rarr;</a>            
	</p>




	
	
	

	
	
	

	</div>

	<? $this->include_template('footer.html.tpl'); ?>

</body>
</html>

