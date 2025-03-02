-- Удаляем лишние таблицы
DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;

-- Добавляем поле price в таблицу product
ALTER TABLE product ADD COLUMN price DOUBLE PRECISION NOT NULL DEFAULT 0;

-- Добавляем поле date_created в таблицу orders
ALTER TABLE orders ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;
