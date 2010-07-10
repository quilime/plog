title : <?=SITE_TITLE?>, <?=$page_title . "\n"; ?>
author : gabriel dunne
email : gdunne at quilime dot com
copyright : 1997 - <?=date('Y');?>


== entries ==

<? foreach($data as $entry): ?>

<?=$entry['title'];?> - <?=get_relative_time($entry['timestamp']);?>

================================================================================
<?=trim(wordwrap(strip_tags($entry['content'], '<img>'), 80, "\n"));?>

----------
posted <?=get_relative_time($entry['timestamp']);?> (<?=date("Y-m-d", $entry['timestamp']);?>) in <?=$entry['cat'];?>

<? foreach($entry['tags'] as $tag) : ?>#<?=$tag?> <? endforeach; ?>






<? endforeach; ?>