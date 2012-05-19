<? echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<rss version="2.0">
	
	<channel>
		
	<atom:link rel="hub" href="<?=WEB_ROOT?>" xmlns:atom="http://www.w3.org/2005/Atom"/>

	<title><?=SITE_TITLE?></title>
	<link><?=$_SERVER['SCRIPT_URI'];?></link>
	<description></description>

	<? foreach($entries as $entry): ?>
	<item>
		<title><?=$entry['title']?></title>
		<description><?=htmlentities($entry['content']);?></description>
		<link>http://<?=get_domain_name() . '/' . $entry['url']?></link>
		<guid>http://<?=get_domain_name() . '/' . $entry['url']?></guid>
		<pubDate><?=date('r', $entry['timestamp'])?></pubDate>		
	</item>
	<? endforeach; ?>		

	</channel>
	
</rss>
