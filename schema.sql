DROP TABLE IF EXISTS Delivery CASCADE;
DROP TABLE IF EXISTS Contains CASCADE;
DROP TABLE IF EXISTS Pay CASCADE;
DROP TABLE IF EXISTS Sale CASCADE;
DROP TABLE IF EXISTS Process CASCADE;
DROP TABLE IF EXISTS EANPRODUCT CASCADE;
DROP TABLE IF EXISTS SupplyContract CASCADE;
DROP TABLE IF EXISTS Supplier CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Warehouse CASCADE;
DROP TABLE IF EXISTS Office CASCADE;
DROP TABLE IF EXISTS Works CASCADE;
DROP TABLE IF EXISTS Workplace CASCADE;
DROP TABLE IF EXISTS Department CASCADE;
DROP TABLE IF EXISTS Employee CASCADE;

-- Now you can recreate the tables in the desired order
CREATE TABLE Department (
    name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Employee ( --Missing a constraint to ensure that every employee (ssn) participates in the Works association.
    ssn INT PRIMARY KEY,
    TIN VARCHAR(30) UNIQUE,
    bdate DATE,
    name VARCHAR(100)
);

CREATE TABLE Workplace (
    address VARCHAR(255) PRIMARY KEY,
    lat DECIMAL(8,6),
    lon DECIMAL(9,6),
    UNIQUE (lat, lon)
);

CREATE TABLE Works (
    ssn INT REFERENCES Employee(ssn),
    name VARCHAR(50) REFERENCES Department(name),
    address VARCHAR(255) REFERENCES Workplace(address),
    PRIMARY KEY (ssn, name, address)
);

CREATE TABLE Office (
    address VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (address) REFERENCES Workplace(address) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Warehouse (
    address VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (address) REFERENCES Workplace(address) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customer (
    cust_no INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Orders ( --Missing a constraint to ensure that every order (order_no) participates in the Contains association.
    order_no INT PRIMARY KEY,
    cust_no INT,
    date DATE,
    FOREIGN KEY (cust_no) REFERENCES Customer(cust_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Process (
    ssn INT,
    order_no INT,
    PRIMARY KEY (ssn, order_no),
    FOREIGN KEY (ssn) REFERENCES Employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_no) REFERENCES Orders(order_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sale (
    order_no INT PRIMARY KEY,
    FOREIGN KEY (order_no) REFERENCES Orders(order_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pay ( --Missing a constraint to enforce the rule that customers can only pay for the Sale of an Order they have placed themselves.
    order_no INT PRIMARY KEY,
    cust_no INT NOT NULL,
    FOREIGN KEY (order_no) REFERENCES Sale(order_no) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cust_no) REFERENCES Customer(cust_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Product (
    SKU INT PRIMARY KEY,
    description TEXT,
    price DECIMAL(8,2)
);

CREATE TABLE Supplier (
    TIN VARCHAR(30) PRIMARY KEY,
    SKU INT NOT NULL,
    name VARCHAR(100),
    address VARCHAR(255),
    date DATE,
    FOREIGN KEY (SKU) REFERENCES Product(SKU) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EANPRODUCT (
    SKU INT,
    ean VARCHAR(30),
    PRIMARY KEY (SKU, ean),
    FOREIGN KEY (SKU) REFERENCES Product(SKU) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SupplyContract (
    TIN VARCHAR(30),
    SKU INT,
    date DATE,
    PRIMARY KEY (TIN, SKU),
    FOREIGN KEY (TIN) REFERENCES Supplier(TIN) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SKU) REFERENCES Product(SKU) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Contains (
    order_no INT,
    SKU INT,
    qtd INT,
    PRIMARY KEY (order_no, SKU),
    FOREIGN KEY (order_no) REFERENCES Orders(order_no) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SKU) REFERENCES Product(SKU) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Delivery (
    address VARCHAR(255) REFERENCES Warehouse(address),
    TIN VARCHAR(30),
    SKU INT,
    PRIMARY KEY (address, TIN, SKU),
    FOREIGN KEY (TIN, SKU) REFERENCES SupplyContract(TIN, SKU) ON DELETE CASCADE ON UPDATE CASCADE
);