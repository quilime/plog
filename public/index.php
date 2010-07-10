<?php

    require_once '../lib/init.php';

    $url_parts = get_url();

	list($response_format, $response_mime_type) = parse_format($url_parts['extension'], 'html');	
	
	$t = get_template_instance();	
	$t->response_format = $response_format;
	$t->assign('view', $_GET['v']);
		
	# content folder
	if (is_dir(LOCAL_ROOT . CONTENT_DIR . DIRECTORY_SEPARATOR . $url_parts['url']) && $url_parts['url'] != "/") {
		list($data, $total) = get_data(array($url_parts['url']));
		$t->assign('page_title', preg_replace('{^/|/$}', '', $url_parts['url']));
		$t->assign('data', $data);		
	}
	# single file
	else if (is_file( LOCAL_ROOT . CONTENT_DIR . $url_parts['dirname'] . DIRECTORY_SEPARATOR . $url_parts['filename'])) {
		$t->assign('single', true);
		$t->assign('data', parse_file(LOCAL_ROOT . CONTENT_DIR . $url_parts['dirname'] . DIRECTORY_SEPARATOR . $url_parts['filename']));
		$template = 'single.'.$response_format.'.tpl';		
	}
	# page
	else if (is_file( LOCAL_ROOT . PAGE_DIR . DIRECTORY_SEPARATOR . $url_parts['filename'] )) {
		$t->assign('data', parse_file(LOCAL_ROOT . PAGE_DIR . DIRECTORY_SEPARATOR . $url_parts['filename']));
		$template = 'page.' . $response_format . '.tpl';
	}
	# direct template
	else if (is_file( LOCAL_ROOT . TEMPLATE_DIR . DIRECTORY_SEPARATOR . $url_parts['filename'] .'.'. $response_format . '.tpl')) {
		$template = $url_parts['filename'] . '.' . $response_format . '.tpl';		
	}
	# default (index)
	else {
		list($data, $total) = get_data();
		$t->assign('data', $data);		
	}
	
	
	# render template
	$t->assign('total', $total);	
    header("Content-Type: {$response_mime_type}; charset=UTF-8");
	$t->render($template);
?>
