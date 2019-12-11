/* Добавление списка категорий */
INSERT INTO category (name, code) VALUES
    ('Доски и лыжи', 'boards'),
    ('Крепления', 'attachment'),
    ('Ботинки', 'boots'),
    ('Одежда', 'clothing'),
    ('Инструменты', 'tools'),
    ('Разное', 'other');

/* Добавление пользователей */
INSERT INTO user (create_date, email, name, password, contact) VALUES
    ('2019-07-25', 'gorky@gmail.com', 'Егор', 'fdr5nvxs', '89206809010'),
    ('2019-09-11', 'chernov@mail.ru', 'Антон', 'gtH0sfa', '89302001012'),
    ('2019-10-02', 'shampurov@yandex.ru', 'Дмитрий', 'vbNlpds', '89235651516');

/* Добавление списка объявлений */
INSERT INTO lot (category_id, user_id, date_start, title, desc_lot, image_path, price_start, date_end, price_step, winner) VALUES
    ('1', '1', '2019-11-10', '2014 Rossignol District Snowboard', 'Описание лота', 'img/lot-1.jpg', '10999', '2019-11-19', '500', NULL),
    ('1', '1', '2019-11-11', 'DC Ply Mens 2016/2017 Snowboard', 'Описание лота', 'img/lot-2.jpg', '159999', '2019-11-20', '2000', NULL),
    ('2', '1', '2019-11-13', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Описание лота', 'img/lot-3.jpg', '8000', '2019-11-26', '300', 'Антон'),
    ('3', '1', '2019-11-14', 'Ботинки для сноуборда DC Mutiny Charocal', 'Описание лота', 'img/lot-4.jpg', '10999', '2019-12-09', '500', NULL),
    ('4', '2', '2019-11-17', 'Куртка для сноуборда DC Mutiny Charocal', 'Описание лота', 'img/lot-5.jpg', '7500', '2019-12-16', '200', NULL),
    ('6', '2', '2019-11-19', 'Маска Oakley Canopy', 'Описание лота', 'img/lot-6.jpg', '5400', '2019-12-26', '200', NULL);

/* Добавление ставок */
INSERT INTO rate (lot_id, user_id, date_add, price_sum) VALUES
    ('3', '2', '2019-11-16', '8500'),
    ('5', '1', '2019-11-19', '7700'),
    ('5', '3', '2019-12-10', '7900');


/* Получить все категории */
SELECT name FROM category;

/* 
Получить самые новые, открытые лоты. Каждый лот должен включать название, 
стартовую цену, ссылку на изображение, текущую цену, название категории 
*/
SELECT l.title, l.price_start, l.image_path, MAX(r.price_sum), c.name
FROM lot l
JOIN category c ON l.category_id = c.category_id
JOIN rate r ON l.lot_id = r.lot_id
WHERE l.date_end >= '2019-12-12' AND l.winner IS NULL
GROUP BY l.lot_id;

/* Показать лот по его id. Получите также название категории, к которой принадлежит лот */
SELECT l.lot_id, c.name FROM lot l
JOIN category c
ON l.category_id = c.category_id

/* Обновить название лота по его идентификатору */
UPDATE lot
SET title = '_Крепления Union Contact Pro 2015 года размер L/XL'
WHERE lot_id = 3;

/* Получить список ставок для лота по его идентификатору с сортировкой по дате */
SELECT lot_id, date_add, price_sum FROM rate
WHERE lot_id = 3
ORDER BY date_add;