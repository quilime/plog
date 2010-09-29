<?php 

    putenv("TZ=America/Los_Angeles");
    
	ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . dirname(realpath(__FILE__)));
	define ('LOCAL_ROOT', join(array_slice(split( "/", dirname(realpath(__FILE__))),0,-1),"/").'/');
	
	define ('SITE_TITLE', 'plog');	
	define ('WEB_ROOT', 'http://dev.quilime.com/');
	
	define ('CONTENT_DIR', 'content');
	define ('TEMPLATE_DIR', 'templates');
	define ('PAGE_DIR', 'pages');	
	define ('CONFIG_DELIMITER', '--');	
	define ('TITLE_DELIMITER', ': ');
	define ('CONFIG_FILE', 'config');	
	
    require_once 'data.php';
    require_once 'output.php';
    require_once 'markdown.php';	
    require_once 'template.php';	

?>