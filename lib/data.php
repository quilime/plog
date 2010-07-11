<?php

/**
 *	return entries of a folder
 * 	@param path: the path to search. defaults to the CONTENT_DIR
 * 	@param args array
 */
function get_entries( $path = "", $args = array())
{
	$recursive = isset($args['recursive']) ? $args['recursive'] : 1;
	$order_by = empty($args['order_by']) ? null : $args['order_by'];
	$order = empty($args['order']) ? SORT_DESC : $args['order'];
	
	$path = LOCAL_ROOT . CONTENT_DIR . $path;
	if ($recursive) {
		$iterator = new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::KEY_AS_PATHNAME);
		$dir_iterator = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
	}	
	else {
		$dir_iterator = new DirectoryIterator($path);
	}
	
	$entries = array();
	foreach ($dir_iterator as $file => $info) {
		if (!$info->isDir()) {
			$entries[] = parse_entry($info);
		}
	}
	
	switch ($order_by)
	{
		default :
			foreach ($entries as $key => $row)
		    	$time[$key] = $row['timestamp'];		
			if ($time)
				array_multisort($time, $order, $entries);			
	}
	
	return array($entries, sizeof($entries));
}


/**
 * get all pages
 */
function get_pages()
{
	$path = LOCAL_ROOT . PAGE_DIR;
	$dir_iterator = new DirectoryIterator($path);
	$pages = array();
	foreach($dir_iterator as $page) {
		if ($page->isDir()) continue;
		$arr = parse_entry($page, 1);
		$arr['is_page'] = 1;
		$pages[] = $arr;
	}
	return $pages;
}


/**
 * 	returns directories of a folder
 * 	@param path the path to search. defaults to the CONTENT_DIR
 * 	@param args array
 */
function get_dirs( $path = "", $args = array())
{
	$recursive = isset($args['recursive']) ? $args['recursive'] : 1;	
	$path = LOCAL_ROOT . CONTENT_DIR . $path;

	if ($recursive) {
		$iterator = new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::KEY_AS_PATHNAME);
		$dir_iterator = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
	}	
	else {
		$dir_iterator = new DirectoryIterator($path);
	}
	$dirs = array();
	foreach ($dir_iterator as $dir => $info) {
		if ($info->isDir() && $info->getFilename() != '.' && $info->getFilename() != '..') {
            $d = array();
            $d['url'] = str_replace($path, "",  $info->getRealPath()) . '/';
            $d['name'] = substr(str_replace($path, "",  $info->getRealPath()),1);
			$dirs[] = $d;
		}
	}
	return $dirs;		
}


/**
 * @param splFileInfo SPLFileInfo Object
 * @param page	default is false
 */
function parse_entry($fileInfo, $page = 0)
{
	$config = "";
	$content = "";
	$passed_config = false;
	$file_contents = file($fileInfo->getRealPath(), FILE_USE_INCLUDE_PATH);
	foreach ( $file_contents as $line ) {
		if (trim($line) == CONFIG_DELIMITER) {
			$passed_config = true;
			continue;
		}
		if (!$passed_config) {
			$config .= $line;
			continue;
		}
		$content .= $line;
	}

	$file = array();
	$file['config'] = parse_ini_string($config);
	$file['title'] = $file['config']['title'];
	$file['timestamp'] = $file['config']['date'] ? date('U', strtotime( $file['config']['date'])) : $fileInfo->getCTime();
	$file['tags'] = $file['config']['tags'] ? explode(" ", $file['config']['tags']) : null;
	$file['content'] = Markdown($content);
	$cat = clean_slashes(str_replace(LOCAL_ROOT . CONTENT_DIR, "", $fileInfo->getPath()));
	$file['cat'] = $page ? null : array('name' => substr($cat,1), 'url' => $cat.'/' );
	$file['path'] = $fileInfo->getRealPath();
	$file['url'] = WEB_ROOT . ($page ? '' : substr($file['cat']['url'],1)) . $fileInfo->getFilename() . '/';

	return $file;
}


?>
