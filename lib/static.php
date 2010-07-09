<?php

	include 'init.php';
	
	list($entries, $total_entries) = get_inline_entries(array('log', 'code'));

	echo '<ol>';
	foreach ($entries as $e)
	{
		echo '<li><a href="'.$e['url'].'">'.$e['title'].' - '.$e['date'].'</a></li>';
	}
	echo '</ol>';
	
		



?>