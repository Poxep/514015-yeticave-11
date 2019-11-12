<?php
require_once('helpers.php');
require_once('function.php');
require_once('data.php');

$page_content = include_template('main.php', [
    'categories' => $categories,
    'goods' => $goods
]);
$layout_content = include_template('layout.php', [
    'content' => $page_content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'categories' => $categories,
    'title' => 'YetiCave - Главная страница'
]);

print($layout_content);
?>