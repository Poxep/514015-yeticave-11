CREATE DATABASE yeticave;
USE yeticave;

CREATE TABLE category (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (128),
    code VARCHAR (128)
);
INSERT INTO category (name, code) VALUES
    ('Доски и лыжи', 'boards'),
    ('Крепления', 'attachment'),
    ('Ботинки', 'boots'),
    ('Одежда', 'clothing'),
    ('Инструменты', 'tools'),
    ('Разное', 'other');

CREATE INDEX i_name ON category (name);
CREATE INDEX i_code ON category (code);

CREATE TABLE lot (
    lot_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    user_id INT NOT NULL,
    date_start DATETIME,
    title VARCHAR (255),
    desc_lot VARCHAR (255),
    image_path VARCHAR (128),
    price_start INT NOT NULL,
    date_end DATETIME,
    price_step INT NOT NULL
);
CREATE INDEX i_title_lot ON lot (title);

CREATE TABLE rate ( 
    rate_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lot_id INT NOT NULL,
    user_id INT NOT NULL,
    date_add DATETIME,
    price INT NOT NULL
);

CREATE TABLE user (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    create_date DATETIME,
    email VARCHAR (128) NOT NULL,
    name VARCHAR (128) NOT NULL,
    password VARCHAR (64) NOT NULL,
    contact VARCHAR (255)
);
CREATE UNIQUE INDEX i_email ON user (email);

ALTER TABLE lot ADD FOREIGN KEY (category_id) REFERENCES category(category_id);
ALTER TABLE lot ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

ALTER TABLE rate ADD FOREIGN KEY (lot_id) REFERENCES lot(lot_id);
ALTER TABLE rate ADD FOREIGN KEY (user_id) REFERENCES user(user_id);