
<? if (isset($entry['prev_entry'])) : ?> 
	<a href="/<?=$entry['prev_entry']['url']?>">prev</a>
	<script>var PREV_ENTRY = '<?=$entry['prev_entry']['url']?>'</script>
<? endif; ?>

<? if (isset($entry['next_entry'])) : ?> 
	<a href="/<?=$entry['next_entry']['url']?>">next</a>
	<script>var NEXT_ENTRY = '<?=$entry['next_entry']['url']?>'</script>
<? endif; ?>
