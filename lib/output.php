<?php


/**
 *	return new template instance
 */
function get_template_instance()
{
    $t = new Template();
    $t->template_dir = join(DIRECTORY_SEPARATOR, array(dirname(__FILE__), '..', TEMPLATE_DIR));
	$t->template_cache_dir = join(DIRECTORY_SEPARATOR, array(dirname(__FILE__), '..', TEMPLATE_DIR, 'cache'));
	
    return $t;
}

/**
 *	@param format 
 *  @param default format
 */
function parse_format($format, $default)
{
    $types = array('html' => 'text/html',
                   'text' => 'text/plain',
				   'rss'  => 'application/rss+xml',
                   'atom' => 'application/atom+xml',
                   'json' => 'text/json',
                   'js'   => 'application/x-javascript',
                   'xspf' => 'application/xspf+xml',
                   'xml'  => 'text/xml',
                   'jpg'  => 'image/jpeg',
                   'png'  => 'image/png',
                   'm3u'  => 'audio/x-mpegurl');
    $format = empty($format) ? $default : $format;
    return array($format, $types[$format]);
}


/**
 *	parse ini file
 */
if( !function_exists('parse_ini_string') ) {
    function parse_ini_string( $string ) {
        $array = Array();
        $lines = explode("\n", $string );
        foreach( $lines as $line ) {
            $statement = preg_match("/^(?!;)(?P<key>[\w+\.\-]+?)\s*=\s*(?P<value>.+?)\s*$/", $line, $match );
            if( $statement ) {
                $key    = $match[ 'key' ];
                $value    = $match[ 'value' ];
                # Remove quote
                if( preg_match( "/^\".*\"$/", $value ) || preg_match( "/^'.*'$/", $value ) ) {
                    $value = mb_substr( $value, 1, mb_strlen( $value ) - 2 );
                }
                $array[ $key ] = $value;
            }
        }
        return $array;
    }
}


/**
 * removes double slashes in path
 * @param path
 */
function clean_slashes($path)
{
	return preg_replace('/\/+/', '/', $path);	
}


/**
 *  makes sure path is valid
 */
function validate_path()
{

}


/**
* @param    int     $seconds    Number of seconds to convert into a human-readable timestamp
* @return   tring   Human-readable approximate timestamp like "2 hours"
*/
function approximate_time($seconds)
{
   switch(true)
   {
       case abs($seconds) <= 90:
           return 'moments';

       case abs($seconds) <= 90 * 60:
           return round(abs($seconds) / 60).' minutes';

       case abs($seconds) <= 36 * 60 * 60:
           return round(abs($seconds) / (60 * 60)).' hours';

       default:
           return round(abs($seconds) / (24 * 60 * 60)).' days';
   }
}
    

/**
* @param    int     $time   Unix timestamp
* @return   string  Relative time string like "2 hours earlier"
*/
function get_relative_time($time)
{
   $diff = $time - time();
   return approximate_time($diff) . ($diff < 0 ? ' ago' : ' from now');
}


function get_rss_feed( $url )
{
   $ch = curl_init();
   curl_setopt($ch, CURLOPT_URL, $url);
   curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
   $feed = curl_exec($ch);
   curl_close($ch);
   
   $xml = new SimpleXMLElement($feed);
   return $xml;        
}


function die_with_code($code, $message)
{
   header("HTTP/1.1 {$code}");
   die($message);
}   


function get_base_dir()
{
    if(php_sapi_name() == 'cli') return CLI_BASE_DIRECTORY;
    return rtrim(dirname($_SERVER['SCRIPT_NAME']), DIRECTORY_SEPARATOR);
}


function get_base_href()
{
    if(php_sapi_name() == 'cli')    return '';
    $query_pos = strpos($_SERVER['REQUEST_URI'], '?');
    return ($query_pos === false) ? $_SERVER['REQUEST_URI']
                                  : substr($_SERVER['REQUEST_URI'], 0, $query_pos);
}


function get_url_parts()
{        
	$parts = explode('/', substr($_SERVER['SCRIPT_URL'], strlen(get_base_dir() . '/')));        
	return $parts[0] ? $parts : 0;
}


function get_url()
{
    $path_info = pathinfo($_SERVER['SCRIPT_URL']);
    $path_info['url'] = preg_match("/\.\.\//", $_SERVER['SCRIPT_URL']) ? '/' : $_SERVER['SCRIPT_URL'];    
    return $path_info; //substr($_SERVER['SCRIPT_URL'], strlen(get_base_dir() . '/'));
}


function get_domain_name()
{
    if(php_sapi_name() == 'cli') return CLI_DOMAIN_NAME;
    return $_SERVER['SERVER_NAME'];
}


function get_url_domain($url)
{
    $parsed = parse_url($url);
    return $parsed['host'];
}


?>
