USE bEJibun

--Sales Transaction
INSERT INTO Customer 
VALUES
    ('CU010', 'Wanda', 'Female', '082212399596', '1999-4-9')

INSERT INTO SalesHeader
VALUES
    ('SA015', 'ST005', 'CU010', '2021-12-12')

INSERT INTO SalesDetail
VALUES  
    ('SA015', 'IT012', 50),
    ('SA015', 'IT024', 60)

--Purchase Transaction
INSERT INTO PurchaseHeader
VALUES  
    ('PH015', 'ST003', 'VE005', '2021-10-20', 'NULL')

INSERT INTO PurchaseDetail
VALUES
    ('PH015', 'IT017', 40),
    ('PH015', 'IT007', 60)