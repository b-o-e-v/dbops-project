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
