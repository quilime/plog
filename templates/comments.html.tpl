
<div class="comments">
	<h2>comments</h2>

	<a name="c"></a>
	<div class="comment_list">
		
		<? foreach($entry['comments']->comments as $comment) : ?>
		<div class="comment">
			<?=Markdown($comment['comment']);?>
			<div class="name"><?=$comment['name'];?>, <?=approximate_time(date('U') - $comment['timestamp'])?> ago</div>
		</div>
		<? endforeach; ?>

	</div>
	
	<div class="comment_form">

    <form action="" method="post">
    <label for="name">name</label><br /><input type="text" name="name" />
    <br />
    comment<br />
    <textarea name="comment"></textarea>
    <br />
    
	<?php echo $entry['comments']->recaptcha_html(); ?>

    <br/>
    <input type="submit" value="submit" />

    </form>
	</div>
</div>
