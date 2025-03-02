-- Заполнение таблицы product
INSERT INTO product (id, name, picture_url, price) VALUES 
(1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
(2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
(3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
(4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00),
(5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00),
(6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

-- Заполнение таблицы orders (100 случайных записей)
INSERT INTO orders (status, date_created)
SELECT 
    (array['pending', 'shipped', 'cancelled'])[floor(random() * 3 + 1)], 
    NOW() - (random() * INTERVAL '90 days')
FROM generate_series(1, 100);

-- Заполнение таблицы order_product (связь товаров с заказами)
INSERT INTO order_product (quantity, order_id, product_id)
SELECT 
    floor(1 + random() * 10)::int,  -- Количество от 1 до 10
    (SELECT id FROM orders ORDER BY random() LIMIT 1), 
    (SELECT id FROM product ORDER BY random() LIMIT 1)
FROM generate_series(1, 200); -- 200 случайных связей