-- Shopping cart database schema (MySQL)
-- Five relations: COMPANY, ITEM, SHOPPING_CART, `ORDER`, CUSTOMER.
-- `ORDER` is quoted because ORDER is a reserved word in MySQL.
--
-- Note on the sample data: the source data references cart 5 (Chair item)
-- and order 19 (Jane Smith's order), although the cart list shows only
-- 6, 7, 9 and the order list shows only 11, 15, 18. Both rows are included
-- below so the foreign keys hold; order 19's number is not given in the
-- source data, so it is NULL.

CREATE TABLE COMPANY (
    company_id INT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL
);

CREATE TABLE SHOPPING_CART (
    cart_id INT PRIMARY KEY
);

CREATE TABLE `ORDER` (
    order_id     INT PRIMARY KEY,
    order_number INT
);

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    address     VARCHAR(200),
    email       VARCHAR(100),
    order_id    INT,
    item_id     INT,
    FOREIGN KEY (order_id) REFERENCES `ORDER` (order_id)
);

CREATE TABLE ITEM (
    item_id     INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    company_id  INT,
    cart_id     INT,
    order_id    INT,
    customer_id INT,
    FOREIGN KEY (company_id)  REFERENCES COMPANY (company_id),
    FOREIGN KEY (cart_id)     REFERENCES SHOPPING_CART (cart_id),
    FOREIGN KEY (order_id)    REFERENCES `ORDER` (order_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
);

-- Sample data

INSERT INTO COMPANY (company_id, name) VALUES
    (1, 'Intel'),
    (2, 'IBM'),
    (3, 'Tesla');

INSERT INTO SHOPPING_CART (cart_id) VALUES
    (5), (6), (7), (9);

INSERT INTO `ORDER` (order_id, order_number) VALUES
    (11, 245),
    (15, 478),
    (18, 211),
    (19, NULL);

INSERT INTO CUSTOMER (customer_id, name, address, email, order_id, item_id) VALUES
    (6, 'John Smith', 'Brownsville, TX', 'j.smith@gmail.com',  11, 2),
    (4, 'Jane Doe',   'McAllen, TX',     'j.doe@gmail.com',    15, 3),
    (1, 'Jane Smith', 'Mission, TX',     'j.smith2@gmail.com', 19, 4);

INSERT INTO ITEM (item_id, name, price, company_id, cart_id, order_id, customer_id) VALUES
    (2, 'Chair', 50.50,  2, 5, 11, 6),
    (3, 'Table', 155.60, 2, 7, 15, 4),
    (4, 'Sofa',  225.20, 3, 9, 19, 1);
