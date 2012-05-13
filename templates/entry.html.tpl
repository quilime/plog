<div class="entry">

	<h1>
		<a title="posted on <?=$entry['date']?>" href="/<?=$entry['url']?>">&mdash; <?=$entry['title']?></a>
	</h1>


	<div class="content">
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		<a href="/<?=$entry['url']?>">#</a>
		<br />
		<span title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></span> in
		<a href="/<?=$entry['cat']['url'];?>">/<?=$entry['cat']['url'];?></a><? if ($entry['tags']) echo '<br/>tags: ' . implode(', ', $entry['tags']); ?>
	</div>

	<? 
	if (isset($entry['is_single']) && $entry['is_single'] && $entry['comments_enabled'])
		$this->include_template('comments.html.tpl', array('entry' => $entry));
	?>	

</div>
