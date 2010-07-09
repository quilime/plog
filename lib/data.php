<?php

/**
 * get data
 */
function get_data( $sources = array(),  $params  = array())
{
	// if no set sources, grab everything in the content folder
	if (sizeof($sources) == 0)
		$sources = get_content_folders();

	$result = array();
	$result_total = 0;
	foreach ($sources as $dir) {

		if (is_array($dir) && isset($dir['basename']))
			$dir = $dir['basename'];

		$contents = glob(LOCAL_ROOT . CONTENT_DIR . DIRECTORY_SEPARATOR . $dir . '/*');

		if (sizeof($contents) <= 0) continue;

		foreach ($contents as $f) {
			if (is_file($f)) {

				if ($params['name']) {
					if (basename($f) != $params['name'])
						continue;
				}

				$parsed = parse_file($f);

				if ($parsed['draft'])
					continue;

				$result[] = $parsed;
				$result_total++;
			}
		}
	}

	// order by date
	foreach ($result as $key => $row) {
	    $time[$key] = $row['timestamp'];
	}
	if ($time)
		array_multisort($time, SORT_DESC, $result);

	return array($result, $result_total);
}


/**
 * parse data file
 */
function parse_file($f)
{
	$pathparts = explode("/", dirname($f));

	$file_contents = explode("\n", file_get_contents($f, FILE_USE_INCLUDE_PATH));
	$cc = "";
	$content = "";
	$conf = true;
	foreach ( $file_contents as $fc ) {
		if ($fc == CONFIG_DELIMITER) {
			$conf = false;
			continue;
		}
		if ($conf) $cc .= $fc . "\n";
		else $content .= $fc . "\n";
	}

	$config = parse_ini_string($cc);

	$res = $config;

	$res['url'] = $res['is_page'] == 1 ? get_base_dir() . '/' . basename($f) . '/' : get_base_dir() . '/' . $pathparts[sizeof($pathparts)-1] . '/' . basename($f);
	$res['timestamp'] = date('U', strtotime( $config['date'] ? $config['date'] : filemtime($f)));
	$res['cat'] = $pathparts[sizeof($pathparts)-1];
	$res['content'] = Markdown($content);
	$res['tags'] = explode(' ', $config['tags']);

	return $res;
}


/**
 * get content folders
 */
function get_content_folders()
{
	$folders = glob(LOCAL_ROOT . CONTENT_DIR . DIRECTORY_SEPARATOR . '/*', GLOB_ONLYDIR);
	$content_folders = array();
	foreach($folders as $folder)
		$content_folders[] = array(
			'basename' => basename($folder),
			'title' => basename($folder),
			'url' => get_base_dir() . '/' . basename($folder) . '/'
			);
	return $content_folders;
}


/**
 * get pages
 */
function get_pages()
{
	$page_files = glob(LOCAL_ROOT . PAGE_DIR . DIRECTORY_SEPARATOR . '/*');
	$pages = array();
	foreach($page_files as $page) {
		$arr = parse_file($page);
		$arr['is_page'] = 1;
		$pages[] = $arr;
	}
	return $pages;
}

?>
