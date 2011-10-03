<?php

require 'lib/init.php';

$request = get_request();

$v = new View  ($request);
$m = new Model ($request);

$v->assign('is_single', $m->is_single());
$v->assign('is_page',   $m->is_page());
$v->assign('entries',   $m->entries);

header("Content-Type: {$m->response_mime_type}; charset=UTF-8"); 

$v->render( $m->template ); 
