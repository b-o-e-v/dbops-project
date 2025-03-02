# dbops-project

```sql
-- создаем базу данных store
CREATE DATABASE store;
-- создаем пользователя
CREATE USER '${DB_USER}' WITH PASSWORD '${DB_PASSWORD}';
-- выдаём доступ ко всем привилегиям пользователю миграции
GRANT ALL PRIVILEGES ON DATABASE store TO '${DB_USER}';
-- выдача прав на все таблицы в схеме public
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO '${DB_USER}';
-- права на создание объектов, изменение и удаление объектов
GRANT ALL PRIVILEGES ON SCHEMA public TO '${DB_USER}';
```

## Запрос для получения количества проданных сосисок за каждый день предыдущей недели

```sql
-- суммируем количество проданных единиц товара за каждый день
SELECT o.date_created, SUM(op.quantity) AS total_sold
FROM orders AS o
-- объединяем таблицы orders и order_product по order_id, связывая заказы с их содержимым
JOIN order_product AS op ON o.id = op.order_id
-- фильтруем только доставленные заказы
WHERE o.status = 'shipped' 
-- выбираем только заказы, оформленные в последние 7 дней
  AND o.date_created > NOW() - INTERVAL '7 DAY'
-- руппируем данные по дате оформления заказа
GROUP BY o.date_created
-- сортируем результат по дате
ORDER BY o.date_created;
```
