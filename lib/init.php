<?php 

    putenv("TZ=America/Los_Angeles");
    
	ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . dirname(realpath(__FILE__)));

	define ('SITE_TITLE', 'plog');
	define ('LOCAL_ROOT', '/local/root/to/plog/');
	define ('WEB_ROOT', 'http://www.webroot.com/');
	
	define ('CONTENT_DIR', 'content');
	define ('TEMPLATE_DIR', 'templates');
	define ('PAGE_DIR', 'pages');	
	define ('CONFIG_DELIMITER', '--');	
	
    require_once 'data.php';
    require_once 'output.php';
    require_once 'markdown.php';	
    require_once 'template.php';	

?>