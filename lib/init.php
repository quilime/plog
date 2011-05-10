<?php

    putenv("TZ=America/Los_Angeles");

	ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . dirname(realpath(__FILE__)));

	define ('SITE_TITLE', 'quilime');
	define ('LOCAL_ROOT', '/home/quilime/quilime.com/');
	define ('WEB_ROOT', 'http://quilime.com/');

	define ('CONTENT_DIR', 'content');
	define ('TEMPLATE_DIR', 'templates');
	define ('PAGE_DIR', 'pages');
	define ('CONFIG_DELIMITER', '--');
    define ('MORE_DELIM', '<!--more-->');
	define ('TITLE_DELIMITER', ': ');
	define ('CONFIG_FILE', 'config');

    require_once 'data.php';
    require_once 'output.php';
    require_once 'markdown.php';
    require_once 'template.php';


	//error_reporting(E_ALL);
	//ini_set("display_errors", 1);

?>