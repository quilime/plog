<?php

    require_once '../lib/init.php';

    $url_parts = get_url();

	list($response_format, $response_mime_type) = parse_format($url_parts['extension'], 'html');	
	
	# setup template
	$t = get_template_instance();	
	$t->response_format = $response_format;
	$t->assign('view', $_GET['v']);
		
	# is folder
	if (is_dir(LOCAL_ROOT . CONTENT_DIR . $url_parts['url']) && $url_parts['url'] != "/") {
		list($data, $total) = get_entries($url_parts['url']);
		$t->assign('page_title', preg_replace('{^/|/$}', '', $url_parts['url']));		
		$t->assign('data', $data);		
	}
	# is file
	else if (is_file( LOCAL_ROOT . CONTENT_DIR . $url_parts['url'])) {
		$t->assign('single', true);		
		$t->assign('data', parse_entry(new SplFileInfo(LOCAL_ROOT . CONTENT_DIR . $url_parts['url'])));
		$template = 'single.'.$response_format.'.tpl';		
	}
	# is page
	else if (is_file( LOCAL_ROOT . PAGE_DIR . $url_parts['url'])) {
		$page = parse_entry(new SplFileInfo(LOCAL_ROOT . PAGE_DIR . $url_parts['url']), 1);
		$t->assign('data', $page);
		$template = $page['config']['template'] ? $page['config']['template'] . '.' . $response_format . '.tpl' : 'page.' . $response_format . '.tpl';
	}
	# default (all entries)
	else {
		list($data, $total) = get_entries();
		$t->assign('data', $data);		
	}
	
	# render
	$t->assign('total', $total);	
    header("Content-Type: {$response_mime_type}; charset=UTF-8");
	$t->render($template);
	
?>
