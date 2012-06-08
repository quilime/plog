<?php
/**
 *		SETUP
 *
 *		update variables specific to your server
 *
 *		note: PHP short tags must be enabled
 */


# error reporting (turn this off for production)
error_reporting(E_ALL);
ini_set("display_errors", 1);

# timezone
putenv('TZ=America/Los Angeles');

# include path
ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . dirname(realpath(__FILE__)));

# settings
define ('LOCAL_ROOT', '/home/quilime/quilime.com/');
define ('WEB_ROOT', '/');



/*

Array
(
    [site_title] => quilime
    [clean_urls] => 1
    [limit] => 15
    [date_format] => M d Y, h:i:s A T
    [web_root] => /
    [content] => content/
    [comments] => comments/
    [template] => templates/
    [pages] => pages/
    [config_file] => config
    [config_delim] => --
    [more_delim] =>
    [title_delim] =>  —
    [file_ignores] => Array
        (
            [0] => config
            [1] => .DS_Store
        )
)
*/
$_cfg = parse_ini_file('lib/config.ini');
define ('CLEAN_URLS', $_cfg['clean_urls']);
define ('LIMIT', $_cfg['limit']);
define ('SITE_TITLE', $_cfg['site_title']);
define ('CONTENT_DIR', $_cfg['content']);
define ('COMMENTS_DIR', $_cfg['comments']);
define ('TEMPLATE_DIR', $_cfg['templates']);
define ('PAGE_DIR', $_cfg['pages']);
define ('CONFIG_DELIMITER', $_cfg['config_delim']);
define ('CONFIG_FILE', $_cfg['config_file']);
define ('MORE_DELIM', $_cfg['more_delim']);
define ('TITLE_DELIMITER', $_cfg['title_delim']);
define ('ENTRY_DATE_FORMAT', $_cfg['date_format']);
$_FILE_IGNORES = $_cfg['file_ignores'];




# recaptcha for comments
require_once 'recaptchalib.php';
// Get a key from https://www.google.com/recaptcha/admin/create
$captcha_publickey  = "6Lek-MkSAAAAAAZknQQGSx9DiCqm_wAiFGytc37d";
$captcha_privatekey = "6Lek-MkSAAAAAK4FAaPKO0Cwp-iHa0OcUaqipee4";



# includes
require_once 'data.php';
require_once 'output.php';
require_once 'markdown.php';
require_once 'model.php';
require_once 'view.php';
require_once 'comments.php';
