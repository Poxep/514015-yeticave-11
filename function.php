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

/* Подсчитывает оставшееся время до закрытия лота
* принимает дату в формате ГГГГ-ММ-ДД
* возвращает массив, где первый элемент — целое количество часов до даты, 
  а второй — остаток в минутах;
*/
function count_time_remaining($init_date_str) {
    date_default_timezone_set('Europe/Moscow');

    is_date_valid($init_date_str);

    $date_end = new DateTime($init_date_str);
    $date_now = new DateTime();

    if ($date_end > $date_now) {
        $interval = $date_end->diff($date_now);
        $hours = str_pad(($interval->days * 24) + $interval->h, 2, '0', STR_PAD_LEFT);
        $minutes = str_pad($interval->i, 2, '0', STR_PAD_LEFT);
    } else {
        $hours = '00';
        $minutes = '00';
    }

    return [$hours, $minutes];
}