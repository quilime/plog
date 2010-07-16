<ul class="nav">	   

	<li><h1><a href="/"><?=SITE_TITLE;?></a></h1></li>



	<? $dirs = get_dirs("", array('recursive' => 1)); ?>
	<? foreach($dirs as $dir) : ?>
	<li><a href="<?=$dir['url']?>"><?=$dir['name']?></a></li>
	<? endforeach; ?>

	<br />
	
	<li><a href="/projects/">projects</a></li>
	<li><a href="/agg/">aggregate</a></li>	
	<li><a href="/links/">links</a></li>			
	<li><a href="/about/">about</a></li>		


</ul>	
