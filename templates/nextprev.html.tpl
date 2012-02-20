
<span style="font-size=15px;">
<?

	// surely this is in the template somewhere??
	$cur_request = get_request();
	if (isset($entries)) {
		$entry = null;
	}
?>

<? if (isset($cur_request['dirname']) && $cur_request['dirname'] != '/' ) : ?>
<span style="font-family:arial">
<a href="/<?=$cur_request['dirname']?>">&uarr;</a>
</span>
<br /><br />
<? endif; ?>

<? if(isset($entry['is_single'])) : ?>
<span style="font-family:arial">

	<? if (isset($entry['next_entry'])) : ?>
		<a href="/<?=$entry['next_entry']['url']?>">&rarr;</a>
		<script>var NEXT_ENTRY = '<?=$entry['next_entry']['url']?>'</script>
	<? endif; ?>

	<br /><br />

	<? if (isset($entry['prev_entry'])) : ?>
		<a href="/<?=$entry['prev_entry']['url']?>">&larr;</a>
		<script>var PREV_ENTRY = '<?=$entry['prev_entry']['url']?>'</script>
	<? endif; ?>

<? endif; ?>

</span>



