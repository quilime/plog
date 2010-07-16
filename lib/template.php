<?php

class Template
{
	
	var $template_dir = 'templates';
	var $template_cache_dir = 'cache';
	var $cachr_file = null;
	var $response_format = 'html';
	var $caching = 1;
	
	var $_tpl_vars = array();

	function __construct()
	{
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
		$this->render($template);
	}
	

	public function render( $template )
	{
		extract( $this->_tpl_vars );

		if (is_file( $this->template_dir . DIRECTORY_SEPARATOR . $template ))
			include( $this->template_dir . DIRECTORY_SEPARATOR . $template );
		else
			include( $this->template_dir . DIRECTORY_SEPARATOR . 'default.' . $this->response_format . '.tpl');
	}
	
	
	public function page_title($delim)
	{
		return $this->_tpl_vars['page_title'] ? $delim . $this->_tpl_vars['page_title'] : "";
	}
}

?>