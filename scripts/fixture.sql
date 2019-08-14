DROP DATABASE IF EXISTS codeigniter_goods;
DROP USER IF EXISTS codeigniter_goods_user;

CREATE DATABASE codeigniter_goods;

CREATE USER 'codeigniter_goods_user'@'%' IDENTIFIED WITH caching_sha2_password BY 'Sheidohngoa6ibae';
GRANT ALL PRIVILEGES ON *.* TO 'codeigniter_goods_user'@'%';

USE codeigniter_goods;
CREATE TABLE section
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) collate = utf8_unicode_ci;

CREATE TABLE product
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image JSON,
    section_id INT NOT NULL,
    FOREIGN KEY fk_section(section_id)
    REFERENCES section(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) collate = utf8_unicode_ci;

CREATE table price
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    value VARCHAR(20) NOT NULL,
    type VARCHAR(255) NOT NULL DEFAULT 'default',
    product_id INT NOT NULL,
    FOREIGN KEY fk_product(product_id)
    REFERENCES product(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) collate = utf8_unicode_ci;

INSERT INTO section (name) VALUES ('Мебель');
INSERT INTO section (name) VALUES ('Посуда');
INSERT INTO section (name) VALUES ('Интерьер');
INSERT INTO product (name, description, section_id, image) VALUES ('Кресло', 'Удобное кресло из натуральной кожи', 1, '["armchair1.jpg", "armchair2.jpg"]');
INSERT INTO product (name, description, section_id, image) VALUES ('Стол', 'Большой обеденный стол из цельного дуба', 1, '["armchair1.jpg", "armchair2.jpg"]');
INSERT INTO product (name, description, section_id, image) VALUES ('Набор тарелки', 'Настоящий китайский фарфор X века до нащей эры', 2, '["armchair1.jpg", "armchair2.jpg"]');
INSERT INTO product (name, description, section_id, image) VALUES ('Часы', 'Стильные часы в стиле хай-тек', 3, '["armchair1.jpg", "armchair2.jpg"]');
INSERT INTO price (value, type, product_id) VALUES ('9999.99', 'default', 1);
INSERT INTO price (value, type, product_id) VALUES ('19999.99', 'old', 1);
INSERT INTO price (value, type, product_id) VALUES ('5599', 'default', 2);
INSERT INTO price (value, type, product_id) VALUES ('8999.50', 'old', 2);
INSERT INTO price (value, type, product_id) VALUES ('1500', 'default', 3);
INSERT INTO price (value, type, product_id) VALUES ('2100', 'old', 3);
INSERT INTO price (value, type, product_id) VALUES ('799', 'default', 4);
INSERT INTO price (value, type, product_id) VALUES ('1250.8', 'old', 4);
