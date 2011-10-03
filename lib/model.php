<?php

class Model
{	
	var $content_request = null;
	var $page_request = null;
	
	var $response_format = 'html';
	var $response_mime_type = 'text/html';
	var $page_title = null;
	var $template = 'default.html.tpl';

	var $entries = null;
	var $config = null;
	var $total = 0; 

	function __construct( $request )
	{
		$this->request = $request;
		list($this->response_format, $this->response_mime_type) = parse_format($this->request['extension'], 'html');
		$this->parse_request( $this->request );
	}

	function parse_request( $request )
	{
		$this->content_request = join(array($this->request['dirname'], $this->request['filename']), DIRECTORY_SEPARATOR );
		$this->page_request    = $this->request['filename'];

	    # check if multiple entries (dir)
	    if ($this->is_multiple()) {
			# check if config file exists
		    if ($this->has_config()) {
		        $this->config = parse_config($this->content_request);
		        if (isset($this->config['config']['template'])) {
		        	$this->template = $this->config['config']['template'] . '.' . $this->response_format . '.tpl' ;
		        }
		    }
	    	list($this->entries, $this->total) = get_entries($this->content_request);
	    	$this->page_title = preg_replace('{^/|/$}', '', $this->request['path']);
		} 
		# check if single
		else if ($this->is_single())
		{
			$this->entries = parse_entry($this->content_request);
			$this->template = 'single.'.$this->response_format.'.tpl';
		}
		# check if page
		else if ($this->is_page()) {
    		$this->entries = parse_entry($this->page_request, 1);
    		$this->template = isset($page['config']['template']) ? 
    							$this->entries['config']['template'] . '.' . $response_format . '.tpl' : 
    							'page.' . $response_format . '.tpl';
		}
		// # check if index
		// else if ($this->request['filename'] == 'index')
		// {
		// 	$this->template = 'index.html.tpl';
		// }
		# poop 404
		else {
    		$this->template = '404.html.tpl';
		}
	}

	function has_config()
	{
		return is_file(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request, CONFIG_FILE ), DIRECTORY_SEPARATOR ));
	}

	function get_config()
	{

	}

	function is_multiple()
	{
		return is_dir(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request ), DIRECTORY_SEPARATOR ));
	}

	function is_single()
	{
		return is_file(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request ), DIRECTORY_SEPARATOR ));
	}

	function is_page()
	{
		return is_file(join(array( LOCAL_ROOT, PAGE_DIR, $this->page_request ), DIRECTORY_SEPARATOR ));
	}			
}