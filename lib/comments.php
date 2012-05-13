<?php

class Comments
{	
	var $comments = array();
	var $comments_loc = '';
	var $fileInfo = null;


	function __construct( &$fileInfo ) {
		$this->fileInfo = $fileInfo;
		$this->comments = $this->get_comments( $fileInfo );
		$this->comments_loc = get_comments_location($fileInfo);
	}


	/**
	 *	get comments
	 * @param fileInfo 	the fileinfo object
	 * @return array() 	comments
	 */
	function get_comments(&$fileInfo)
	{
		$comments_location = get_comments_location($fileInfo);
		$comments = array();
		if (is_dir($comments_location)) {
			$dir_iterator = new DirectoryIterator($comments_location);
			foreach ($dir_iterator as $file => $info) {
				if (!$info->isDir() && !$info->isDot()) {
					$contents = file_get_contents($info->getPath() . DIRECTORY_SEPARATOR . $info->getFilename());
					$comments[] = json_decode($contents, true);
				}
			}
		}
		return $comments;
	}


	function create_comments_dir( &$dir )
	{
		try {
			if (!mkdir($dir, 0777, true)) {
				throw new Exception('Error creating comments directory');
			}
		} catch (Exception $e) {
			echo 'Caught exception', $e->getMessage(), "\n";
		}
	}


	function process_post_request() 
	{
		$this->_recaptcha_post_request();
	}


	# the response from reCAPTCHA
	var $_recaptcha_resp = null;
	# the error code from reCAPTCHA, if any
	var $_recaptcha_error = null;
	#error making comments
	var $_comment_error = null;


	function recaptcha_html()
	{		
		global $captcha_publickey, $captcha_privatekey;
		if ($this->_comment_error)
			echo '<div class="error">', $this->_comment_error, '</div>';
		echo recaptcha_get_html($captcha_publickey, $this->_recaptcha_error);
	}


	function _recaptcha_post_request() {

		global $captcha_publickey, $captcha_privatekey;

		# was there a reCAPTCHA response?
		if (isset($_POST["recaptcha_response_field"])) {

			$this->_recaptcha_resp = recaptcha_check_answer ($captcha_privatekey,
											$_SERVER["REMOTE_ADDR"],
		                                    $_POST["recaptcha_challenge_field"],
		                                    $_POST["recaptcha_response_field"]);
			if ($this->_recaptcha_resp->is_valid) {

				$new_comment = array();
				$new_comment['name']    = !empty($_POST['name'])    ? $_POST['name']    : 'anon';
				$new_comment['www']     = !empty($_POST['www'])     ? $_POST['www']     : null;
				$new_comment['comment'] = !empty($_POST['comment']) ? $_POST['comment'] : null;
				$new_comment['timestamp'] = date('U');

				if (!$new_comment['comment']) {

					$this->_comment_error = 'You must enter a comment.';

				} else {

					if (!is_dir($this->comments_loc)) {
						$this->create_comments_dir($this->comments_loc);
					}

					# put new comment
					if (!file_put_contents($this->comments_loc . date('U') . '.json', json_encode($new_comment))) {
						$_comment_error = 'error creating comment';
					}

					# all comments once new one is created
					$this->comments = $this->get_comments( $this->fileInfo );
				}

			} else {
				# set the error code so that we can display it
				$this->_recaptcha_error = $this->_recaptcha_resp->error;
			}
		}
	}
}
