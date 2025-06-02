-- ========================
-- Creación de tablas
-- ========================

-- Tabla Roles
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    permissions JSONB NOT NULL,
	is_global BOOLEAN NOT NULL
);

-- Tabla Categorías
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Productos
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_alert_threshold INT DEFAULT 5,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Tabla Almacenes
CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Usuarios
CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role_id INT NOT NULL,
	warehouse_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id)
	FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
);

-- Tabla Inventario
CREATE TABLE inventory (
    id SERIAL PRIMARY KEY, 	
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
);

-- Tabla Transacciones
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    user_id INT NOT NULL,
    type VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabla Logs de auditoría
CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    action VARCHAR(50) NOT NULL,
    table_name VARCHAR(50) NOT NULL,
    record_id INT NOT NULL,
    user_id INT NOT NULL,
    details JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabla Alertas de Inventario
CREATE TABLE inventory_alerts (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
	warehouse_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ========================
-- Funciones y triggers
-- ========================

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers para users
CREATE TRIGGER set_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_column();

-- Triggers para products
CREATE TRIGGER set_products_updated_at
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_column();

-- Triggers para inventory
CREATE TRIGGER set_inventory_last_updated
BEFORE UPDATE ON inventory
FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_column();

-- ========================
-- Inserción de datos iniciales
-- ========================

-- Inserción de roles básicos
INSERT INTO roles (name, permissions) VALUES 
('admin', '["full_access"]'::jsonb),
('marketing', '["view_sales", "view_reports"]'::jsonb),
('reponedor', '["manage_inventory", "view_alerts"]'::jsonb),
('administracion', '["create_users", "assign_roles", "manage_system"]'::jsonb);
