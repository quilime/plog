<html>
<head>
    
    <? $this->include_template('head-inc.html.tpl') ?>
    
    <title><?=SITE_TITLE?><?=TITLE_DELIMITER?> <?=$data['title'];?></title>
    
</head>
<body>
    
    <? $this->include_template('nav.html.tpl') ?>
    
	<div id="content">
		<? $this->include_template('entry.html.tpl', array('data' => $data)); ?>	
	</div>

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

	<? $this->include_template('footer.html.tpl') ?>

</body>
</html>
