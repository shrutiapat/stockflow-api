-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS warehouses;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_thresholds;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS supplier_products;

-- Create warehouses table
CREATE TABLE warehouses (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  company_id INTEGER NOT NULL
);

-- Create products table
CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  sku TEXT NOT NULL,
  product_type TEXT NOT NULL
);

-- Create inventory table
CREATE TABLE inventory (
  id INTEGER PRIMARY KEY,
  product_id INTEGER NOT NULL,
  warehouse_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL
);

-- Create product thresholds table
CREATE TABLE product_thresholds (
  product_id INTEGER PRIMARY KEY,
  threshold INTEGER NOT NULL
);

-- Create sales table
CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  product_id INTEGER NOT NULL,
  warehouse_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  sold_at TEXT NOT NULL
);

-- Create suppliers table
CREATE TABLE suppliers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  contact_email TEXT NOT NULL
);

-- Create supplier_products table
CREATE TABLE supplier_products (
  product_id INTEGER NOT NULL,
  supplier_id INTEGER NOT NULL
);

-- Insert sample data
-- INSERT INTO warehouses (id, name, company_id) VALUES (1, 'Main Warehouse', 1);

-- INSERT INTO products (id, name, sku, product_type) VALUES (1, 'Widget A', 'WID-001', 'single');

-- INSERT INTO inventory (id, product_id, warehouse_id, quantity) VALUES (1, 1, 1, 5);

-- INSERT INTO product_thresholds (product_id, threshold) VALUES (1, 20);

-- INSERT INTO sales (id, product_id, warehouse_id, quantity, sold_at)
-- VALUES (1, 1, 1, 30, datetime('now', '-5 days'));

-- INSERT INTO suppliers (id, name, contact_email) VALUES (1, 'Supplier Corp', 'orders@supplier.com');

-- INSERT INTO supplier_products (product_id, supplier_id) VALUES (1, 1);

-- 🏬 Warehouses
INSERT INTO warehouses (id, name, company_id) VALUES
(1, 'Main Warehouse', 1),
(2, 'Secondary Warehouse', 1),
(3, 'Delhi Hub', 2),
(4, 'Mumbai Storage', 2),
(5, 'Bangalore Depot', 3),
(6, 'Hyderabad Vault', 3),
(7, 'Chennai Stack', 4),
(8, 'Pune Unit', 4),
(9, 'Kolkata Store', 5),
(10, 'Ahmedabad Box', 5);

-- 📦 Products
INSERT INTO products (id, name, sku, product_type) VALUES
(1, 'Widget A', 'WID-001', 'single'),
(2, 'Widget B', 'WID-002', 'single'),
(3, 'Widget C', 'WID-003', 'bundle'),
(4, 'Gadget A', 'GAD-001', 'single'),
(5, 'Gadget B', 'GAD-002', 'bundle'),
(6, 'Device X', 'DEV-001', 'single'),
(7, 'Device Y', 'DEV-002', 'single'),
(8, 'Tool Alpha', 'TOO-001', 'single'),
(9, 'Tool Beta', 'TOO-002', 'single'),
(10, 'Combo Pack', 'COM-001', 'bundle');

-- 📦 Inventory
INSERT INTO inventory (id, product_id, warehouse_id, quantity) VALUES
(1, 1, 1, 5),
(2, 2, 2, 10),
(3, 3, 3, 2),
(4, 4, 4, 8),
(5, 5, 5, 12),
(6, 6, 6, 3),
(7, 7, 7, 15),
(8, 8, 8, 20),
(9, 9, 9, 1),
(10, 10, 10, 6);

-- 📊 Thresholds
INSERT INTO product_thresholds (product_id, threshold) VALUES
(1, 20),
(2, 15),
(3, 5),
(4, 10),
(5, 10),
(6, 7),
(7, 12),
(8, 25),
(9, 5),
(10, 8);

-- 🛒 Sales
INSERT INTO sales (id, product_id, warehouse_id, quantity, sold_at) VALUES
(1, 1, 1, 30, datetime('now', '-5 days')),
(2, 2, 2, 20, datetime('now', '-3 days')),
(3, 3, 3, 5, datetime('now', '-6 days')),
(4, 4, 4, 18, datetime('now', '-4 days')),
(5, 5, 5, 12, datetime('now', '-2 days')),
(6, 6, 6, 10, datetime('now', '-7 days')),
(7, 7, 7, 8, datetime('now', '-1 days')),
(8, 8, 8, 15, datetime('now', '-9 days')),
(9, 9, 9, 9, datetime('now', '-8 days')),
(10, 10, 10, 11, datetime('now', '-3 days'));

-- 🏭 Suppliers
INSERT INTO suppliers (id, name, contact_email) VALUES
(1, 'Supplier Corp', 'orders@supplier.com'),
(2, 'Tech Traders', 'contact@techtraders.com'),
(3, 'Gizmo Distributors', 'sales@gizmo.com'),
(4, 'Device House', 'info@devicehouse.com'),
(5, 'Tools & More', 'support@tools.com'),
(6, 'GearMart', 'hello@gearmart.com'),
(7, 'EastWest Supply', 'ew@supply.com'),
(8, 'NorthSouth Hub', 'nsh@hub.com'),
(9, 'ElectroFlow', 'orders@electroflow.com'),
(10, 'Nova Distributors', 'contact@nova.com');

-- 🔗 Supplier-Products
INSERT INTO supplier_products (product_id, supplier_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
