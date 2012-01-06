<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
<!-- <<<<<<< HEAD
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?> <?=$data['title'];?></title>
======= -->
    <title><?=$entry['title'];?></title>
<!-- >>>>>>> 2ae0cd949c331f83dcb05116cffdca21b2ecb871 -->
    
</head>
<body>
    
	<div id="content">
		<? $this->include_template('entry.html.tpl'); ?>
	</div>

	<div id="nextprev">
		<? $this->include_template('nextprev.html.tpl'); ?>
	</div>

<!-- <<<<<<< HEAD -->
<!-- 

<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'quilime'; // required: replace example with your forum shortname

    // The following are highly recommended additional parameters. Remove the slashes in front to use.
    // var disqus_identifier = 'unique_dynamic_id_1234';
    // var disqus_url = 'http://example.com/permalink-to-page.html';

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
 -->

<!-- ======= -->
	<? $this->include_template('nav.html.tpl') ?>	
<!-- >>>>>>> 2ae0cd949c331f83dcb05116cffdca21b2ecb871 -->
	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
