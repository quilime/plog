<?php

    require_once 'lib/init.php';

    $url = get_url();

    list($response_format, $response_mime_type) = parse_format($url['extension'], 'html');

    # setup template
    $t = get_template_instance();
    $t->response_format = $response_format;
    $t->assign('view', isset($_GET['v']) ? $_GET['v'] : null);

    $content_request = LOCAL_ROOT . CONTENT_DIR . $url['dirname'] . '/' . $url['filename'];
    $page_request =  LOCAL_ROOT . PAGE_DIR . DIRECTORY_SEPARATOR . $url['filename'];
    $total = 0;

    # content exists, and is a folder

    if (is_dir($content_request)) {
        # get config in folder, if exists
        if (is_file($content_request . '/' . CONFIG_FILE )) {
            $config = parse_entry(new SplFileInfo($content_request . '/' . CONFIG_FILE));
            $template = $config['config']['template'] . '.' . $response_format . '.tpl' ;
        }
        list($data, $total) = get_entries($url['dirname'] . '/' . $url['filename']);

        if ($url['filename'] == '') {
            $template = 'index.html.tpl';
        }
            
        $t->assign('data', $data);
        $t->assign('page_title', preg_replace('{^/|/$}', '', $url['url']));
    }

    # content exists, and is a single entry
    else if (is_file($content_request)) {
        $t->assign('data', parse_entry(new SplFileInfo($content_request)));
        $t->assign('single', true);
        $template = 'single.'.$response_format.'.tpl';
    }

    # content exists, and is a page
    else if (is_file($page_request)) {
        $page = parse_entry(new SplFileInfo($page_request), 1);
        $t->assign('data', $page);
        $template = $page['config']['template'] ? $page['config']['template'] . '.' . $response_format . '.tpl' : 'page.' . $response_format . '.tpl';
    }

    # 404
    else {
        $template = '404.html.tpl';
    }

    # render
    $t->assign('total', $total);
    header("Content-Type: {$response_mime_type}; charset=UTF-8");
    $t->render($template);

?>
