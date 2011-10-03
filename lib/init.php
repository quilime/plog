<?php

/**
 *		SETUP
 *
 *		update variables specific to your server
 *
 *		note: PHP short tags must be enabled
 */


# error reporting
error_reporting(E_ALL);
ini_set("display_errors", 1);

# timezone
putenv("TZ=America/Los_Angeles");

# include path
ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . dirname(realpath(__FILE__)));

# settings
define ('CLEAN_URLS', 		false);
define ('SITE_TITLE', 		'plog');
define ('LOCAL_ROOT', 		'/Users/gdunne/Sites/india/');
define ('WEB_ROOT', 		'/~gdunne/india/');
define ('CONTENT_DIR', 		'content/');
define ('TEMPLATE_DIR', 	'templates/');
define ('PAGE_DIR', 		'pages/');
define ('CONFIG_DELIMITER', '--');
define ('MORE_DELIM', 		'<!--more-->');
define ('TITLE_DELIMITER', 	': ');
define ('CONFIG_FILE', 		'config');

# ignores
$_FILE_IGNORES = array(CONFIG_FILE, '.DS_Store');

# includes
require_once 'data.php';
require_once 'output.php';
require_once 'markdown.php';
require_once 'model.php';
require_once 'view.php';
