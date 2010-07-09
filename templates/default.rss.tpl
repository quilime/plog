<? echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<rss version="2.0">
	
	<channel>
		
	<atom:link rel="hub" href="<?=WEB_ROOT?>" xmlns:atom="http://www.w3.org/2005/Atom"/>

	<title><?=SITE_TITLE?></title>
	<link><?=WEB_ROOT?></link>
	<description></description>

	<? foreach($data as $entry): ?>
	<item>
		<title><?=$entry['title']?></title>
		<description><?=htmlentities($entry['content']);?></description>
		<link><?=$entry['url']?></link>
		<guid><?=$entry['url']?></guid>
		<pubDate><?=date('r', $entry['timestamp'])?></pubDate>		
	</item>
	<? endforeach; ?>		

	</channel>
	
</rss>
