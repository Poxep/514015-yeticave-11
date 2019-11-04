<?php
require_once('function.php');
require_once('date.php');

$page_content = include_template('main.php', [
    'categories' => $categories,
    'goods' => $goods
]);
$layput_content = include_template('layout.php', [
    'content' => $page_content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'categories' => $categories,
    'title' => 'YetiCave - Главная страница'
]);

print($layput_content);
?>