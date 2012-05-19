<?php

/**
 *	template object (view)
 */
class View
{	
	var $template_dir = 'templates';
	// var $template_cache_dir = 'cache';
    var $default_template = 'default';
	var $response_format = 'html';
	var $response_mime_type = 'text/html';

	var $_tpl_vars = array();

	function __construct()
	{
    	$this->template_dir = join(DIRECTORY_SEPARATOR, array(dirname(__FILE__), '..', TEMPLATE_DIR));
    	$this->template_cache_dir = join(DIRECTORY_SEPARATOR, array(dirname(__FILE__), '..', TEMPLATE_DIR, 'cache'));		
	}
	
	
    function assign($tpl_var, $value = null)
    {
        if (is_array($tpl_var)) {
            foreach ($tpl_var as $key => $val)
                if ($key != '')
                    $this->_tpl_vars[$key] = $val;
        } else {
            if ($tpl_var != '')
                $this->_tpl_vars[$tpl_var] = $value;
        }
    }


	public function include_template ($template, $vars = array())
	{
		$this->_tpl_vars = array_merge($this->_tpl_vars, $vars);
		$this->render( $template );
	}
	

	public function render( $template ) 
	{
		extract( $this->_tpl_vars );
        if (!is_file($this->template_dir . DIRECTORY_SEPARATOR . $template))
            $template = $default_template . '.' . $response_format . '.tpl';
		include( $this->template_dir . DIRECTORY_SEPARATOR . $template );
	}
	
	
	public function page_title($delim)
	{
		return isset($this->_tpl_vars['page_title']) ? $delim . $this->_tpl_vars['page_title'] : "";
	}
}
