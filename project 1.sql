create database shop;
use shop;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT
);
INSERT INTO Products (product_id, name, description, price, stock_quantity)
VALUES 
(1, 'Laptop', 'A high-end laptop', 1200.99, 50),
(2, 'Smartphone', 'Latest model smartphone', 799.99, 100),
(3, 'Headphones', 'Noise-cancelling headphones', 199.99, 150),
(4, 'Smart Watch', 'Smartwatch with fitness tracking', 249.99, 75),
(5, 'Keyboard', 'Mechanical keyboard', 99.99, 200),
(6, 'Mouse', 'Wireless ergonomic mouse', 29.99, 300),
(7, 'Monitor', '27-inch 4K display', 399.99, 40),
(8, 'External Hard Drive', '1TB external storage', 89.99, 180),
(9, 'Webcam', 'HD webcam for video calls', 59.99, 250),
(10, 'Bluetooth Speaker', 'Portable speaker with great sound', 49.99, 120),
(11, 'Tablet', '10-inch Android tablet', 299.99, 60),
(12, 'Charger', 'Fast charging cable for devices', 19.99, 500),
(13, 'Smart Light Bulb', 'Wi-Fi enabled LED light bulb', 15.99, 150),
(14, 'Coffee Maker', '12-cup programmable coffee maker', 79.99, 80),
(15, 'Robot Vacuum', 'Automatic vacuum cleaner', 249.99, 40);
select * from products;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    shipping_address TEXT
);
INSERT INTO Users (user_id, username, email, password_hash, shipping_address)
VALUES
(1, 'john_doe', 'john.doe@example.com', 'hashed_password_123', '123 Main St, City, Country'),
(2, 'jane_smith', 'jane.smith@example.com', 'hashed_password_456', '456 Oak Rd, City, Country'),
(3, 'alice_williams', 'alice.williams@example.com', 'hashed_password_789', '789 Pine Ave, City, Country'),
(4, 'bob_johnson', 'bob.johnson@example.com', 'hashed_password_101', '101 Maple St, City, Country'),
(5, 'carol_lee', 'carol.lee@example.com', 'hashed_password_112', '112 Birch Ln, City, Country'),
(6, 'david_martin', 'david.martin@example.com', 'hashed_password_131', '131 Cedar Blvd, City, Country'),
(7, 'emma_davis', 'emma.davis@example.com', 'hashed_password_415', '415 Walnut Dr, City, Country'),
(8, 'frank_brown', 'frank.brown@example.com', 'hashed_password_161', '161 Cherry Ave, City, Country'),
(9, 'grace_miller', 'grace.miller@example.com', 'hashed_password_718', '718 Maple Ct, City, Country'),
(10, 'hannah_wilson', 'hannah.wilson@example.com', 'hashed_password_192', '192 Elm St, City, Country'),
(11, 'ian_moore', 'ian.moore@example.com', 'hashed_password_202', '202 Pine St, City, Country'),
(12, 'jackson_taylor', 'jackson.taylor@example.com', 'hashed_password_303', '303 Oak Dr, City, Country'),
(13, 'karen_thompson', 'karen.thompson@example.com', 'hashed_password_404', '404 Birch Rd, City, Country'),
(14, 'lily_jackson', 'lily.jackson@example.com', 'hashed_password_505', '505 Cedar St, City, Country'),
(15, 'michael_white', 'michael.white@example.com', 'hashed_password_606', '606 Willow Ave, City, Country');
select * from users;
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Cart (cart_id, user_id, product_id, quantity)
VALUES
(1, 1, 2, 1),
(2, 1, 3, 2),
(3, 2, 1, 1),
(4, 2, 5, 1),
(5, 3, 4, 2),
(6, 3, 6, 3),
(7, 4, 7, 1),
(8, 4, 8, 1),
(9, 5, 9, 2),
(10, 5, 10, 3),
(11, 6, 11, 1),
(12, 6, 12, 4),
(13, 7, 13, 5),
(14, 8, 14, 1),
(15, 9, 15, 2);
select * from cart;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Orders (order_id, user_id, order_date, total_amount, status)
VALUES
(1, 1, '2025-02-11 10:30:00', 2399.98, 'Completed'),
(2, 2, '2025-02-11 11:00:00', 899.98, 'Pending'),
(3, 3, '2025-02-11 12:15:00', 599.99, 'Completed'),
(4, 4, '2025-02-11 12:45:00', 349.99, 'Shipped'),
(5, 5, '2025-02-11 13:20:00', 1199.97, 'Pending'),
(6, 6, '2025-02-11 13:55:00', 499.95, 'Completed'),
(7, 7, '2025-02-11 14:25:00', 899.99, 'Cancelled'),
(8, 8, '2025-02-11 14:50:00', 499.95, 'Shipped'),
(9, 9, '2025-02-11 15:15:00', 1499.98, 'Completed'),
(10, 10, '2025-02-11 15:45:00', 799.98, 'Pending'),
(11, 11, '2025-02-11 16:10:00', 299.99, 'Completed'),
(12, 12, '2025-02-11 16:40:00', 1199.95, 'Shipped'),
(13, 13, '2025-02-11 17:00:00', 599.98, 'Pending'),
(14, 14, '2025-02-11 17:30:00', 999.97, 'Completed'),
(15, 15, '2025-02-11 18:00:00', 799.99, 'Shipped');
select * from orders;
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price)
VALUES
(1, 1, 2, 1, 799.99),
(2, 1, 3, 2, 199.99),
(3, 2, 1, 1, 1200.99),
(4, 2, 5, 1, 99.99),
(5, 3, 4, 2, 249.99),
(6, 4, 7, 1, 399.99),
(7, 5, 9, 2, 59.99),
(8, 6, 11, 1, 299.99),
(9, 7, 13, 5, 15.99),
(10, 8, 14, 1, 79.99),
(11, 9, 1, 2, 1200.99),
(12, 10, 12, 4, 19.99),
(13, 11, 10, 3, 49.99),
(14, 12, 6, 1, 29.99),
(15, 13, 8, 2, 89.99);
select * from order_items;
SELECT * FROM Products WHERE product_id = 1;
SELECT * FROM Products WHERE price > 100;
SELECT * FROM Products WHERE stock_quantity > 0;
UPDATE Products
SET stock_quantity = 45
WHERE product_id = 1;
SELECT COUNT(*) FROM Products;
SELECT * FROM Products ORDER BY price DESC;
SELECT * FROM Products ORDER BY name ASC;
SELECT * FROM Users WHERE user_id = 1;
UPDATE Users
SET email = 'john.doe@newdomain.com'
WHERE user_id = 2;
SELECT COUNT(*) FROM Users;
SELECT * FROM Users ORDER BY username ASC;
SELECT * FROM Users ORDER BY email DESC;
SELECT * FROM Users WHERE username LIKE '%john%';
SELECT * FROM Users WHERE email LIKE '%@example.com';
SELECT * FROM Cart WHERE user_id = 1;
SELECT SUM(quantity) AS total_quantity
FROM Cart
WHERE product_id = 2; 
UPDATE Cart
SET quantity = 3
WHERE cart_id = 1; 
SELECT COUNT(*) FROM Cart WHERE user_id = 1;
SELECT COUNT(DISTINCT product_id) FROM Cart;
SELECT * FROM Orders WHERE user_id = 1;
SELECT * FROM Orders WHERE status = 'Shipped';
SELECT * FROM Orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-02-01';
UPDATE Orders
SET status = 'Delivered'
WHERE order_id = 2;
SELECT COUNT(*) FROM Orders;
SELECT * FROM Orders
ORDER BY order_date DESC;
SELECT * FROM Orders
ORDER BY total_amount ASC;
SELECT SUM(quantity) AS total_quantity
FROM Order_Items
WHERE product_id = 2;  
UPDATE Order_Items
SET quantity = 3
WHERE order_item_id = 1;  
SELECT COUNT(*) FROM Order_Items;
SELECT * FROM Order_Items WHERE quantity > 2 AND price < 100.00;
SELECT * FROM Order_Items WHERE order_id IN (1, 2, 3);
SELECT DISTINCT price FROM Order_Items;
create view name
 as
select*from products
where name = "laptop";
DELIMITER //
create procedure GetTotalproducts(OUT total int)
BEGIN
 select count(*) into total from products;
 END //
 DELIMITER ;
select product_id, name, price
from products
left join users ON products.product_id=users.user_id;
select*from cart cross join order_items;
select product_id from products
UNION
select cart_id from cart;
select order_id from orders
UNION ALL
select product_id from products;
create view name
 as
select*from products
where name = "laptop";
DELIMITER //
create procedure GetTotalproducts(OUT total int)
BEGIN
 select count(*) into total from products;
 END //
 DELIMITER ;
 CALL GetTotalproducts(@product_id);
 











































