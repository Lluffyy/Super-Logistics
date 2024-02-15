-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_address VARCHAR(255),
    customer_contact_info VARCHAR(255)
);

-- Packages Table
CREATE TABLE Packages (
    package_id INT PRIMARY KEY,
    customer_id INT,
    package_weight DECIMAL(10, 2),
    package_contents VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Shipments Table
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    origin_address VARCHAR(255),
    destination_address VARCHAR(255),
    shipment_date DATE,
    estimated_delivery_date DATE
);

-- Shipment_Items Table
CREATE TABLE Shipment_Items (
    shipment_item_id INT PRIMARY KEY,
    shipment_id INT,
    package_id INT,
    quantity INT,
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id),
    FOREIGN KEY (package_id) REFERENCES Packages(package_id)
);

-- Tracking Table
CREATE TABLE Tracking (
    tracking_id INT PRIMARY KEY,
    shipment_id INT,
    location VARCHAR(255),
    status VARCHAR(50),
    timestamp TIMESTAMP,
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id)
);