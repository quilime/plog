<?php
	header("content-type: text/xml");
?>
<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<rss version="2.00">
<channel>
<title>Aggregated Feed Demo</title>
<link>http://www.webmaster-source.com</link>
<description>
A demo of SimplePie’s feed-merging capabilities.
</description>
<language>en-us</language>

<?php

require_once '../lib/init.php';
include_once('simplepie.inc'); // Include SimplePie

$feed = new SimplePie(); // Create a new instance of SimplePie


// Load the feeds
$feed->set_feed_url(array(
'http://quilime.com/.rss',
'http://media.quilime.com/aggregate/?return=rss',
'http://feeds.delicious.com/v2/rss/quilime?count=15'
));

$feed->set_cache_duration (600); // Set the cache time

$feed->enable_xml_dump(isset($_GET['xmldump']) ? true : false);

$success = $feed->init(); // Initialize SimplePie

$feed->handle_content_type(); // Take care of the character encoding

?>

<?php if ($success) {
$itemlimit=0;
foreach($feed->get_items() as $item) {

print_r($item->get_title());

if ($itemlimit==100) { break; }
?>

<item>
<title><?php echo $item->get_title(); ?></title>
<link><?php echo $item->get_permalink(); ?></link>
<description>
<?php echo $item->get_description(); ?>
</description>
</item>

<?
$itemlimit = $itemlimit + 1;
}
}
?>

</channel>
</rss>