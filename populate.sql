-- Insert dummy data into Department table
INSERT INTO Department (name) VALUES
    ('Department A'),
    ('Department B'),
    ('Department C');

-- Insert dummy data into Employee table
INSERT INTO Employee (ssn, TIN, bdate, name) VALUES
    (123456789, 'TIN123', '1990-01-01', 'John Doe'),
    (987654321, 'TIN456', '1995-02-15', 'Jane Smith'),
    (555555555, 'TIN789', '1988-07-10', 'Michael Johnson'),
    (666666666, 'TIN666', '1999-12-25', 'Santa Claus'); --to check office and warehouse 2nd query

-- Insert dummy data into Workplace table
INSERT INTO Workplace (address, lat, lon) VALUES
    ('Workplace A', 12.345678, -98.765432),
    ('Workplace B', 54.321987, -76.543210);

-- Insert dummy data into Works table
INSERT INTO Works (ssn, name, address) VALUES
    (123456789, 'Department A', 'Workplace A'),
    (987654321, 'Department B', 'Workplace A'),
    (555555555, 'Department C', 'Workplace B'),
    (666666666, 'Department C', 'Workplace B'), --to check office and warehouse 2nd query
    (666666666, 'Department A', 'Workplace A'); --to check office and warehouse 2nd query

-- Insert dummy data into Office table
INSERT INTO Office (address) VALUES
    ('Workplace A');

-- Insert dummy data into Warehouse table
INSERT INTO Warehouse (address) VALUES
    ('Workplace B');

-- Insert dummy data into Customer table
INSERT INTO Customer (cust_no, name, email, phone, address) VALUES
    (1, 'Customer A', 'customerA@example.com', '123456789', 'Address A'),
    (2, 'Customer B', 'customerB@example.com', '987654321', 'Address B'),
    (3, 'Customer C', 'customerC@example.com', '555555555', 'Address C');

-- Insert dummy data into Orders table
INSERT INTO Orders (order_no, cust_no, date) VALUES
    (1001, 1, '2023-05-10'),
    (1002, 2, '2023-03-15'),
    (1003, 3, '2023-01-20'),
    (1004, 3, '2023-01-29');

-- Insert dummy data into Process table
INSERT INTO Process (ssn, order_no) VALUES
    (123456789, 1001),
    (987654321, 1002),
    (555555555, 1003),
    (666666666, 1004); --to check office and warehouse 2nd query

-- Insert dummy data into Sale table
INSERT INTO Sale (order_no) VALUES
    (1001),
    (1002),
    (1003),
    (1004);

-- Insert dummy data into Pay table
INSERT INTO Pay (order_no, cust_no) VALUES
    (1001, 1),
    (1002, 2),
    (1003, 3),
    (1004, 3);

-- Insert dummy data into Product table
INSERT INTO Product (SKU, description, price) VALUES
    (1, 'Product A', 49.99),
    (2, 'Product B', 59.99),
    (3, 'Product C', 99.99);

-- Insert dummy data into Supplier table
INSERT INTO Supplier (TIN, SKU, name, address, date) VALUES
    ('TIN001', 1, 'Supplier A', 'Address X', '2022-01-01'),
    ('TIN002', 2, 'Supplier B', 'Address Y', '2021-05-15'),
    ('TIN003', 3, 'Supplier C', 'Address Z', '2023-02-28');

-- Insert dummy data into EANPRODUCT table
INSERT INTO EANPRODUCT (SKU, ean) VALUES
    (1, 'EAN001'),
    (2, 'EAN002'),
    (3, 'EAN003');

-- Insert dummy data into SupplyContract table
INSERT INTO SupplyContract (TIN, SKU, date) VALUES
    ('TIN001', 1, '2022-01-01'),
    ('TIN002', 2, '2021-05-15'),
    ('TIN003', 3, '2023-02-28');

-- Insert dummy data into Contains table
INSERT INTO Contains (order_no, SKU, qtd) VALUES
    (1001, 1, 2),
    (1002, 2, 1),
    (1003, 3, 3),
    (1004, 3, 2);

-- Insert dummy data into Delivery table
INSERT INTO Delivery (address, TIN, SKU) VALUES
    ('Workplace B', 'TIN003', 3);

