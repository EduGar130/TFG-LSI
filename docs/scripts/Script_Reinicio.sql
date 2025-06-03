-- Reinicio de datos y secuencias de la base de datos de inventario

-- Eliminar datos respetando las dependencias
DELETE FROM audit_logs;
DELETE FROM inventory_alerts;
DELETE FROM transactions;
DELETE FROM users;
DELETE FROM roles;
DELETE FROM inventory;
DELETE FROM products;
DELETE FROM categories;
DELETE FROM warehouses;

-- Reiniciar secuencias asociadas a las tablas con SERIAL
ALTER SEQUENCE audit_logs_id_seq RESTART WITH 1;
ALTER SEQUENCE inventory_alerts_id_seq RESTART WITH 1;
ALTER SEQUENCE transactions_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE roles_id_seq RESTART WITH 1;
ALTER SEQUENCE inventory_id_seq RESTART WITH 1;
ALTER SEQUENCE products_id_seq RESTART WITH 1;
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE warehouses_id_seq RESTART WITH 1;