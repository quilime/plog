<?php

require 'lib/init.php';

$request = get_request();
$template = 'default.html.tpl';

$v = new View  ( $request );
$m = new Model ( $request );

list($response_format, $response_mime_type) = parse_format($request['extension'], 'html');

echo '<pre>';
exit(print_r($request));

$content_request = join(array(LOCAL_ROOT, CONTENT_DIR, $request['dirname'], $request['filename']), DIRECTORY_SEPARATOR );
$page_request = join(array(LOCAL_ROOT, PAGE_DIR, $request['filename']), DIRECTORY_SEPARATOR );

# multiple entries
if (is_dir($content_request)) {
    # get config in folder, if exists
    if (is_file($content_request . '/' . CONFIG_FILE )) {
        $config = parse_entry(new SplFileInfo($content_request . '/' . CONFIG_FILE));
        $template = $config['config']['template'] . '.' . $response_format . '.tpl' ;
    }
    list($data, $total) = get_entries($request['dirname'] . '/' . $request['filename']);
    $v->assign('data', $data);
    $v->assign('page_title', preg_replace('{^/|/$}', '', $request['url']));
}

# single entry
else if (is_file($content_request)) {
    $v->assign('data', parse_entry(new SplFileInfo($content_request)));
    $v->assign('single', true);
    $template = 'single.'.$response_format.'.tpl';
}

# page
else if (is_file($page_request)) {
    $page = parse_entry(new SplFileInfo($page_request), 1);
    $v->assign('data', $page);
    $template = $page['config']['template'] ? $page['config']['template'] . '.' . $response_format . '.tpl' : 'page.' . $response_format . '.tpl';
}
else if ($request['filename'] == 'index')
{
    $template = 'index.html.tpl';
}
else {
    $template = '404.html.tpl';
}

$v->assign( 'total', isset($total) ? $total : 0 );

header("Content-Type: {$response_mime_type}; charset=UTF-8"); 
$v->render( $template ); 
