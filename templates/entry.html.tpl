<div class="entry">

	<h1>
	<a title="posted on <?=$entry['date']?>" href="/<?=$entry['url']?>"><?=$entry['title']?></a>
	</h1>

	<div class="content">
		<?=$entry['content']?>
	</div>

	<div class="metadata">
		<a title="permalink" href="/<?=$entry['url']?>">#</a><br />
		<!-- <abbr title="<?=get_relative_time($entry['timestamp']);?>"><?=date("F d, Y", $entry['timestamp'])?></abbr>  -->
	</div>

</div>
