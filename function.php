<?php

// Форматирует цену
function price_formatting($num) {
    $num = ceil($num);

    if($num >= 1000) {
        $num = number_format($num, 0, '', ' ');
    };

    $num = $num . " " . "₽";

    return $num;
}