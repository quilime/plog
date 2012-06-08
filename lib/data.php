<?php

/**
 *	return entries of a folder
 * 	@param path: the path to search. defaults to the CONTENT_DIR
 * 	@param args array
 */
function get_entries( $path = "", $args = array())
{
	global $_FILE_IGNORES;

	$recursive = isset($args['recursive']) ? $args['recursive'] : 1;
	$order_by = empty($args['order_by']) ? null : $args['order_by'];
	$order = empty($args['order']) ? SORT_DESC : $args['order'];

	$path = join(array( LOCAL_ROOT, CONTENT_DIR, $path ), DIRECTORY_SEPARATOR);

	try {
		if (!is_dir($path)) {
			throw new Exception("no such file or directory", 1);
		}
		if ($recursive) {
			$iterator = new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::KEY_AS_PATHNAME);
			$dir_iterator = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
		}
		else {
			$dir_iterator = new DirectoryIterator($path);
		}
	} catch (Exception $e) {
		echo 'Caught exception: ',  $e->getMessage(), "\n";
	}

	$entries = array();
	foreach ($dir_iterator as $file => $info) {

		# don't list hidden files
		if (substr($info->getFilename(), 0, 1) == '.') continue;

		// $finfo = finfo_open(FILEINFO_MIME_TYPE);
		// $ftype = finfo_file($finfo, join(array($info->getPath(), $info->getFilename()), DIRECTORY_SEPARATOR));
		// finfo_close($finfo);

		if (
//			$ftype == 'text/plain' &&
			!$info->isDir() &&
			!in_array( $info->getFilename(), $_FILE_IGNORES )) {
			$entries[] = parse_entry( $info );
		}
	}


	switch ($order_by)
	{
		default :
			foreach ($entries as $key => $row)
		    	$time[$key] = $row['timestamp'];
			if ($time)
				array_multisort( $time, $order, $entries );
	}

	return $entries;
}


/**
 * 	returns directories of a folder
 * 	@param path the path to search. defaults to the CONTENT_DIR
 * 	@param args array
 */
function get_dirs( $path = "", $args = array())
{
	$recursive = isset($args['recursive']) ? $args['recursive'] : 1;

	$local_content = join(array(LOCAL_ROOT, CONTENT_DIR), DIRECTORY_SEPARATOR);

	$path = $local_content . $path;
	$path = str_replace("//", "/", $path);


	try {
		if (!is_dir($path)) {
			throw new Exception("no such file or directory: $path", 1);
		}
		if ($recursive) {
			$iterator = new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::KEY_AS_PATHNAME);
			$dir_iterator = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
		}
		else {
			$dir_iterator = new DirectoryIterator($path);
		}
	} catch (Exception $e) {
		echo 'Caught exception: ',  $e->getMessage(), "\n";
	}
	$dirs = array();
	foreach ($dir_iterator as $dir => $info) {
		if ($info->isDir() && $info->getFilename() != '.' && $info->getFilename() != '..') {
            $d = array();
            $d['url'] = str_replace($path, "",  $info->getRealPath());

            if (!CLEAN_URLS) {
            	$d['url'] = WEB_ROOT . '?p=' . $d['url'];
            }

            $d['name'] = str_replace($path, "",  $info->getRealPath());
			$dirs[] = $d;
		}
	}
	return $dirs;
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
 * @param splFileInfo SPLFileInfo Object
 * @param page	default is false
 */
function parse_entry($fileInfo, $page = false)
{
	$config = "";
	$content = "";
    $content_short = "";
    $passed_more = false;
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
		if (trim($line) == MORE_DELIM)
          $passed_more = true;
        if (!$passed_more)
          $content_short .= $line;
		$content .= $line;
	}

	$f = array();
	try {
		$f['config'] = parse_ini_string($config);
		if (!parse_ini_string($config)) {
			echo $config;
   			throw new Exception('bad ini format');
		}
	}
	catch (Exception $e) {
		echo 'Caught exception: ',  $e->getMessage(), "\n";
		exit;
	}

	$f['title'] = isset($f['config']['title']) ? $f['config']['title'] : $fileInfo->getFilename() ;
	$f['config']['date'] = isset($f['config']['date']) ? $f['config']['date'] : null;
	$f['timestamp'] = $f['config']['date'] ? date('U', strtotime( $f['config']['date'])) : $fileInfo->getCTime();
	$f['tags'] = isset($f['config']['tags']) ? explode(" ", $f['config']['tags']) : null;
	$f['content'] = Markdown($content);

	$f['comments_enabled'] = isset($f['config']['comments']) && $f['config']['comments'];
	$f['comments'] = new Comments($fileInfo);

    if ($passed_more)
      $f['content_short'] = Markdown($content_short);

	$cat = clean_slashes(str_replace(LOCAL_ROOT . CONTENT_DIR, "", $fileInfo->getPath()));
	$clean_path = str_replace(LOCAL_ROOT . CONTENT_DIR, "", clean_slashes($fileInfo->getPath()));

	$f['cat'] = $page ? null : array('name' => $clean_path, 'url' => $clean_path );
	$f['path'] = $fileInfo->getRealPath();
	$f['url'] = ($page ? '' : $f['cat']['url'] . '/' ) . $fileInfo->getFilename();

    if (!CLEAN_URLS) {
    	$f['cat']['url'] = WEB_ROOT . '?p=' . $f['cat']['url'];
    	$f['url'] = WEB_ROOT . '?p=' . $f['url'];
    }

	return $f;
}

function get_comments_location ( &$fileInfo ) {
	return LOCAL_ROOT . COMMENTS_DIR . get_clean_path($fileInfo) . DIRECTORY_SEPARATOR . $fileInfo->getFilename() . DIRECTORY_SEPARATOR;
}

function get_clean_path ( &$fileInfo, $page = false ) {
	if (!$page) {
		return str_replace(LOCAL_ROOT . CONTENT_DIR, "", clean_slashes($fileInfo->getPath()));
	} else {
		return str_replace(LOCAL_ROOT . PAGE_DIR, "", clean_slashes($fileInfo->getPath()));
	}
}

function get_entry ( $relative_path )
{
	return parse_entry(new SplFileInfo(join(array(LOCAL_ROOT, CONTENT_DIR, $relative_path), DIRECTORY_SEPARATOR)));
}

function get_page ( $relative_path )
{
	return parse_entry(new SplFileInfo(join(array(LOCAL_ROOT, PAGE_DIR, $relative_path), DIRECTORY_SEPARATOR)), 1);
}

function parse_config ( $relative_path )
{
	return parse_entry(new SplFileInfo(join(array(LOCAL_ROOT, CONTENT_DIR, $relative_path, CONFIG_FILE), DIRECTORY_SEPARATOR)));
}
