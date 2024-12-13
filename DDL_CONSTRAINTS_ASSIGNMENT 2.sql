-- Create the Sales database
CREATE DATABASE Sales;

USE Sales;

-- Create the Orders table
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY UNIQUE NOT NULL,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(100) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL
);
-- Add a new column named order_quantity to the Orders table
ALTER TABLE Orders
ADD order_quantity INT NOT NULL;

-- Rename the Orders table to sales_orders
ALTER TABLE Orders
RENAME TO sales_orders;

-- Insert 10 rows into the sales_orders table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Will Smith', 'Electronics', 'Smartphone', '123-456-7890', 2),
(2, 'Bob Marly', 'Books', 'Fiction Novel', '234-567-8901', 1),
(3, 'Charlie Puth', 'Clothing', 'T-shirt', '345-678-9012', 3),
(4, 'Diana Prince', 'Electronics', 'Laptop', '456-789-0123', 1),
(5, 'Ethan Hunt', 'Home Appliances', 'Blender', '567-890-1234', 2),
(6, 'Fiona Apple', 'Books', 'Cookbook', '678-901-2345', 1),
(7, 'George Clooney', 'Clothing', 'Jeans', '789-012-3456', 2),
(8, 'Hannah Montana', 'Electronics', 'Headphones', '890-123-4567', 4),
(9, 'Ian Malcolm', 'Home Appliances', 'Microwave', '901-234-5678', 1),
(10, 'Jane Doe', 'Books', 'Mystery Novel', '012-345-6789', 2);

-- Retrieve customer_name and Ordered_Item from the sales_orders table
SELECT Customer_name, Ordered_item FROM sales_orders;
-- Update the name of the product for any row (for example, changing 'Smartphone' to 'Smartwatch')
-- Update the name of the product for a specific row using Order_Id
UPDATE sales_orders
SET Ordered_item = 'Smartwatch'
WHERE Order_Id = 1; 

-- Delete the sales_orders table from the database
DROP TABLE sales_orders;

