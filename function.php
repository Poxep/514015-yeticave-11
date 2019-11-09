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
function count_time_remaining($date_end) {
    date_default_timezone_set('Europe/Moscow');

    $date1 = new DateTime($date_end);
    $date2 = new DateTime();

    $interval = $date1->diff($date2);

    $hours = str_pad(($interval->days * 24) + $interval->h, 2, '0', STR_PAD_LEFT);
    $minutes = str_pad($interval->i, 2, '0', STR_PAD_LEFT);

    $time_difference = [$hours, $minutes];

    return $time_difference;
}