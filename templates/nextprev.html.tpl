
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
	$('#content').fadeIn();
</script>
 -->

<span style="font-size=15px;">
<?
	// surely this is in the template somewhere??
	$cur_request = get_request();
	if (isset($entries)) {
		$entry = null;
	}
?>


<? if (isset($cur_request['dirname']) && $cur_request['dirname'] != '/' ) : ?>
	<a href="/<?=$cur_request['dirname']?>">&uarr;</a>
	<script>var PARENT_CAT = '/<?=$cur_request['dirname']?>'</script>
<? endif; ?>

<br /><br />

<? if(isset($entry['is_single'])) : ?>

<? if (isset($entry['next_entry'])) : ?>
	<a href="/<?=$entry['next_entry']['url']?>">&rarr;</a>
	<script>var NEXT_ENTRY = '/<?=$entry['next_entry']['url']?>'</script>
<? endif; ?>

<br /><br />

<? if (isset($entry['prev_entry'])) : ?>
	<a href="/<?=$entry['prev_entry']['url']?>">&larr;</a>
	<script>var PREV_ENTRY = '/<?=$entry['prev_entry']['url']?>'</script>
<? endif; ?>

<? endif; ?>

</span>


