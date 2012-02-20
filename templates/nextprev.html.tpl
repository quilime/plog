<span style="font-size=15px;">
<? if (isset($entry['cat'])) : ?>
<span style="font-family:arial">
<a href="/<?=$entry['cat']['url'];?>">&uarr;</a>
</span>

<br /><br />
<? endif; ?>

<span style="font-family:arial">
<? if (isset($entry['prev_entry'])) : ?> 
	<a href="/<?=$entry['prev_entry']['url']?>">&larr;</a>
	<script>var PREV_ENTRY = '<?=$entry['prev_entry']['url']?>'</script>
	<br /><br />
<? endif; ?>



<? if (isset($entry['next_entry'])) : ?> 
	<a href="/<?=$entry['next_entry']['url']?>">&rarr;</a>
	<script>var NEXT_ENTRY = '<?=$entry['next_entry']['url']?>'</script>
<? endif; ?>
</span>
</span>
