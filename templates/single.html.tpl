<html>
<head>

    <? $this->include_template('head-inc.html.tpl') ?>

    <title><?=$entry['title'];?></title>

</head>
<body>

	<div id="content" class="single">
		<?
	        if (isset($entry['config']['template'])) {
	        	$this->include_template($entry['config']['template'] . '.' . $this->response_format . '.tpl');
	        }
	        else {
	        	$this->include_template('entry.' . $this->response_format . '.tpl');
			} 
		?>

	</div>

	<? $this->include_template('nav.html.tpl') ?>
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
