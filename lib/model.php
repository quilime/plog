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


	    # if entries (dir in CONTENT dir)
	    if ($this->is_multiple()) {
			# check if config file exists in dir
		    if ($this->has_config()) {
		        $this->config = parse_config( $this->content_request );
		        if (isset($this->config['config']['template'])) {
		        	$this->template = $this->config['config']['template'] . '.' . $this->response_format . '.tpl' ;
		        }
		    }
	    	$this->entries = get_entries( $this->content_request );
	    	$this->page_title = preg_replace('{^/|/$}', '', $this->request['path']);
		} 


		# if entry (file in CONTENT dir)
		else if ($this->is_single())
		{
			$this->entry = get_entry( $this->content_request );
			$this->template = 'single.' . $this->response_format . '.tpl';
		}


		# if page (file in PAGES dir)
		else if ($this->is_page()) {
    		$this->page = get_page( $this->page_request );
    		$this->template = isset($this->page['config']['template']) ? 
    							$this->page['config']['template'] . '.' . $this->response_format . '.tpl' : 
    							'page.' . $this->response_format . '.tpl';
		}


		# not found
		else {
    		$this->template = '404.html.tpl';
		}
	}

	function has_config()
	{
		return is_file(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request, CONFIG_FILE ), DIRECTORY_SEPARATOR )) ? 1 : 0;
	}

	function is_multiple()
	{
		return is_dir(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request ), DIRECTORY_SEPARATOR )) ? 1 : 0;
	}

	function is_single()
	{
		return is_file(join(array( LOCAL_ROOT, CONTENT_DIR, $this->content_request ), DIRECTORY_SEPARATOR )) ? 1 : 0;
	}

	function is_page()
	{
		return is_file(join(array( LOCAL_ROOT, PAGE_DIR, $this->page_request ), DIRECTORY_SEPARATOR )) ? 1 : 0;
	}			
}
