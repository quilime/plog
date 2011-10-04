<?php

require 'lib/init.php';

$request = get_request();

$v = new View  ($request);
$m = new Model ($request);


if ($m->is_single())
	$v->assign('entry', $m->entry);

else if ($m->is_page())
	$v->assign('page', $m->page);

else if ($m->is_multiple())
	$v->assign('entries', $m->entries);

header("Content-Type: {$m->response_mime_type}; charset=UTF-8"); 
$v->render( $m->template );
