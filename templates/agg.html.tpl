<html>
<head>

    <?php $this->include_template('head-inc.html.tpl'); ?>

    <title><?=SITE_TITLE?>: aggregate</title>

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
	<h2><a href="http://media.quilime.com/aggregate/">image</a></h2>
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
	<a class="rss" href="http://media.quilime.com/aggregate/index.php?return=rss">rss</a>, <a class="more" href="http://media.quilime.com/aggregate" title="via quilime.com/aggregate">more &rarr;</a>
	</p>

	</td>

	        <td valign="top" class="column">
	        <?php $vid = get_rss_feed('http://quilime.tumblr.com/rss'); ?>
	        <h2><a href="http://quilime.tumblr.com/">video</a></h2>
	        <script>
                function vtog(count) {
                    $('.vid').hide();
                    $('#vid_' + count).show();                    
                }    
	        </script>
	        <ul class="video">
	        <?php

	        $count = 11;
	        
	        foreach($vid->channel->item as $v) :
	        if ($count-- == 0) break;
	        ?>
	        <li title="<?php echo str_replace('"', '\'', $v->title); ?>">
	            <?
                $desc = $v->description;
                $patterns = array('/player.vimeo.com/', '/youtube.com/');
                foreach($patterns as $p) {
    	            preg_match($p, $desc, $matches);
                    echo '<a onClick="vtog('.$count.');" href="#">';    	            
    	            if (sizeof($matches) > 0) {
	                    // vimeo
    	                if ('/'.$matches[0].'/' == $patterns[0]) {
                            // get video thumbnail for vimeo    	                    
                            $pattern = '/http:\/\/player.vimeo.com\/video\/(\\d+)/';    	                    
    	                    preg_match($pattern, $desc, $m);
                            $video_url = "http://vimeo.com/". $m[1]  ;
                            $file = fopen($video_url, "r");
                            $filedata = stream_get_contents($file);
                            $html_content = strpos($filedata,"<meta property=\"og:image\"");
                            $link_string = substr($filedata, $html_content + 35, 128);
                            $video_id_array = explode("\"", $link_string);
                            $thumbnail_url = $video_id_array[0];
                            echo '<img style="width:120px; height:90px;" src="'.$thumbnail_url.'">';
	                    }
	                    // youtube
    	                if ('/'.$matches[0].'/' == $patterns[1]) {
                            $pattern = '/http:\/\/www.youtube.com\/v\/(.+?)&/';
    	                    preg_match($pattern, $desc, $m);
                            echo '<img src="http://i3.ytimg.com/vi/'.$m[1].'/default.jpg" />';
	                    }
                    }
                    echo '</a>';                    
                }
	            ?>
                <div class="vid" id="vid_<?=$count?>" style="display:none;">
                <?=$v->description ?>
                </div>
	        </li>
	        <? 
	        endforeach;
	        
	        
	        
/*
// get video thumbnail for vimeo
$video_url = "http://vimeo.com/15592943"  ;
$file = fopen($video_url, "r");
$filedata = stream_get_contents($file);
$html_content = strpos($filedata,"<meta property=\"og:image\"");
$link_string = substr($filedata, $html_content + 35, 49);
$video_id_array = explode("\"", $link_string);
echo("LINK: " . $link_string);
$thumbnail_url = $filedata[3];
//               echo $thumbnail_url;
echo '<img src="'.$link_string.'">';

	        */


	        ?>
	        </ul>
	        <p>
	            <a class="rss" href="http://quilime.tumblr.com/rss">rss</a>, 
	            <a class="more" href="http://quilime.tumblr.com" title="via tumblr">more &rarr;</a>
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
		<h3><a  href="http://flickr.com/photos/quilime/">flickr</a></h3>
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
	$url = 'https://<login>:<pass>@api.del.icio.us/v1/posts/recent';
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

	<h2><a  href="http://delicious.com/quilime/">link</a></h2>

	<ul class="bookmarks">
	<?php foreach($del->post as $d) : ?>
		<li>
			<a href="<?=$d['href']?>"><?=$d['description'];?></a>

<? /* <em><? echo get_relative_time(strtotime($d['time'])); ?> </em> */ ?>

			<div class="desc"><?=$d['extended'];?></div>
            <small style="color:#aaa;" class="tags"><em><? $t = explode(" ", $d['tag']); echo implode(", ", $t); ;?></em></small>
		</li>
	<? endforeach; ?>
	</ul>

	<p>
	<a class="rss" href="http://feeds.delicious.com/v2/rss/quilime?count=15">rss</a>, <a class="more" href="http://delicious.com/quilime/" title="via delicious">more &rarr;</a>
	</p>

	</td>




	</tr></table>

	</div>

	<? $this->include_template('footer.html.tpl'); ?>

</body>
</html>