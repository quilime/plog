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
		?>

	<div class="entry">

	<h1><?=$entry['title']?></h1>

	<div class="content">
		<?=$entry['content']?>
	</div>

	<div class="metadata">

		<a href="/<?=$entry['url']?>">#</a>

		<br />

		created: <span title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></span> in
		<a href="/<?=$entry['cat']['url'];?>">/<?=$entry['cat']['url'];?></a><? if ($entry['tags']) echo '<br/>tags: ' . implode(', ', $entry['tags']); ?>
	</div>

	</div>

	<? } ?>

	</div>

	<? $this->include_template('nav.html.tpl') ?>
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
