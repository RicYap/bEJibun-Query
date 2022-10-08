USE bEJibun
GO

INSERT INTO Customer 
VALUES
	('CU000', 'Andi'	, 'Male'	, '081212399596', '1991-04-02'),
	('CU001', 'Budi'	, 'Male'	, '081312399596', '1998-06-14'),
	('CU002', 'Deni'	, 'Male'	, '081412399596', '1994-11-22'),
	('CU003', 'Joko'	, 'Male'	, '081512399596', '2002-08-17'),
	('CU004', 'Angel'	, 'Female'	, '081612399596', '2004-07-18'),
	('CU005', 'Jessica'	, 'Female'	, '081712399596', '1995-02-02'),
	('CU006', 'Charlie'	, 'Male'	, '081812399596', '2003-09-15'),
	('CU007', 'Natalia'	, 'Female'	, '081912399596', '2001-12-01'),
	('CU008', 'Ricky'	, 'Male'	, '082012399596', '2001-03-21'),
	('CU009', 'Jovan'	, 'Male'	, '082112399596', '1996-10-27')

INSERT INTO Staff
VALUES
	('ST000', 'Bayu'	, 'Male'	, '082212399596', '400000'),
	('ST001', 'Putri'	, 'Female'	, '082312399596', '450000'),
	('ST002', 'Putra'	, 'Male'	, '082412399596', '500000'),
	('ST003', 'Ari'		, 'Male'	, '082512399596', '550000'),
	('ST004', 'Amel'	, 'Female'	, '082612399596', '600000'),
	('ST005', 'Citra'	, 'Female'	, '082712399596', '650000'),
	('ST006', 'Dimas'	, 'Male'	, '082812399596', '700000'),
	('ST007', 'Elsa'	, 'Female'	, '082912399596', '750000'),
	('ST008', 'Gading'	, 'Male'	, '083012399596', '800000'),
	('ST009', 'Haikal'	, 'Male'	, '083112399596', '850000')

INSERT INTO ItemType
VALUES
	('IP000', 'Food'		),
	('IP001', 'Drink'		),
	('IP002', 'Sport'		),
	('IP003', 'Electronic'	),
	('IP004', 'Cutlery'		),
	('IP005', 'Snack'		),
	('IP006', 'Medicine'	),
	('IP007', 'Toiletry'	),
	('IP008', 'Vegetable'	),
	('IP009', 'Fruit'		)

INSERT INTO Item
VALUES
	('IT000', 'IP009', 'Apple'		, '5000', '20'),
	('IT001', 'IP008', 'Broccoli'	, '1000', '10'),
	('IT002', 'IP007', 'Soap'		, '3000', '15'),
	('IT003', 'IP006', 'Panadol'	, '2000', '20'),
	('IT004', 'IP005', 'Chitato'	, '4000', '30'),
	('IT005', 'IP004', 'Spoon'		, '3000', '50'),
	('IT006', 'IP003', 'TV'			, '25000', '10'),
	('IT007', 'IP002', 'Ball'		, '6000', '25'),
	('IT008', 'IP001', 'Sprite'		, '2000', '30'),
	('IT009', 'IP000', 'Tofu'		, '1000', '20'),
	('IT010', 'IP009', 'Grape'		, '6000', '25'),
	('IT011', 'IP008', 'Spinach'	, '1500', '15'),
	('IT012', 'IP007', 'Shampoo'	, '3500', '20'),
	('IT013', 'IP006', 'Bodrex'		, '2500', '35'),
	('IT014', 'IP005', 'Taro'		, '4500', '40'),
	('IT015', 'IP004', 'Fork'		, '3500', '70'),
	('IT016', 'IP003', 'Speaker'	, '20000', '15'),
	('IT017', 'IP002', 'Racket'		, '6500', '30'),
	('IT018', 'IP001', 'Fanta'		, '4000', '40'),
	('IT019', 'IP000', 'Egg'		, '1500', '60'),
	('IT020', 'IP004', 'Knife'		, '2500', '50'),
	('IT021', 'IP003', 'Remote'		, '10000', '10'),
	('IT022', 'IP005', 'Cheetos'	, '6000', '25'),
	('IT023', 'IP001', 'Pepsi'		, '3500', '40'),
	('IT024', 'IP008', 'Cabbage'	, '2000', '30')

INSERT INTO Vendor
VALUES
	('VE000', 'Go Drink'		, '087812336719', 'Food Street'		, 'godrink@email.com'),
	('VE001', 'Best Electronic'	, '087912336719', 'Rock Street'		, 'electronic@gmail.com'),
	('VE002', 'Fresh Fruit'		, '088012336719', 'Bottom Street'	, 'freshfruit@kmail.com'),
	('VE003', 'Green Vegie'		, '088112336719', 'Top Street'		, 'greenvegie@email.com'),
	('VE004', 'All Chips'		, '088212336719', 'Left Street'		, 'allchip@gmail.com'),
	('VE005', 'Sport Station'	, '088312336719', 'Right Street'	, 'sportion@email.com'),
	('VE006', 'IKEA'			, '088412336719', 'Middle Street'	, 'ikea@gmail.com'),
	('VE007', 'Bath Thing'		, '088512336719', 'Side Street'		, 'bathing@email.com'),
	('VE008', 'Kalbe'			, '088612336719', 'Cross Street'	, 'kalbe@gmail.com'),
	('VE009', 'Go Food'			, '088712336719', 'Nangka Street'	, 'gofood@email.com')

INSERT INTO PurchaseHeader
VALUES
	('PH000', 'ST000', 'VE000', '2020-01-20', '2020-01-25'),
	('PH001', 'ST000', 'VE000', '2020-02-15', '2020-02-20'),
	('PH002', 'ST000', 'VE000', '2020-03-10', NULL),
	('PH003', 'ST000', 'VE001', '2020-03-15', NULL),
	('PH004', 'ST000', 'VE001', '2020-04-12', NULL),
	('PH005', 'ST001', 'VE001', '2020-04-14', '2020-04-20'),
	('PH006', 'ST001', 'VE002', '2020-05-01', '2020-05-05'),
	('PH007', 'ST001', 'VE002', '2020-05-05', NULL),
	('PH008', 'ST001', 'VE002', '2020-06-04', '2020-06-15'),
	('PH009', 'ST001', 'VE003', '2020-06-10', '2020-06-12'),
	('PH010', 'ST002', 'VE003', '2020-07-12', NULL),
	('PH011', 'ST002', 'VE004', '2020-07-15', NULL),
	('PH012', 'ST002', 'VE004', '2020-08-21', '2020-08-29'),
	('PH013', 'ST002', 'VE005', '2020-08-26', '2020-08-29'),
	('PH014', 'ST002', 'VE005', '2020-09-25', '2020-09-30')

INSERT INTO PurchaseDetail
VALUES
	('PH000', 'IT008', '70'),
	('PH000', 'IT018', '50'),
	('PH001', 'IT008', '80'),
	('PH001', 'IT023', '100'),
	('PH002', 'IT018', '150'),
	('PH002', 'IT023', '75'),
	('PH003', 'IT006', '20'),
	('PH003', 'IT021', '20'),
	('PH004', 'IT016', '30'),
	('PH005', 'IT016', '35'),
	('PH006', 'IT000', '120'),
	('PH006', 'IT010', '75'),
	('PH007', 'IT000', '50'),
	('PH008', 'IT010', '50'),
	('PH009', 'IT001', '80'),
	('PH009', 'IT011', '110'),
	('PH010', 'IT001', '120'),
	('PH010', 'IT024', '100'),
	('PH011', 'IT004', '105'),
	('PH012', 'IT004', '110'),
	('PH012', 'IT014', '140'),
	('PH012', 'IT022', '150'),
	('PH013', 'IT007', '70'),
	('PH014', 'IT007', '40'),
	('PH014', 'IT017', '100')

INSERT INTO SalesHeader
VALUES
	('SA000', 'ST000', 'CU000', '2017-02-05'),
	('SA001', 'ST000', 'CU000', '2017-04-11'),
	('SA002', 'ST000', 'CU001', '2018-06-15'),
	('SA003', 'ST001', 'CU001', '2018-02-14'),
	('SA004', 'ST001', 'CU002', '2019-08-01'),
	('SA005', 'ST002', 'CU002', '2019-08-12'),
	('SA006', 'ST002', 'CU003', '2019-07-22'),
	('SA007', 'ST002', 'CU003', '2019-05-18'),
	('SA008', 'ST003', 'CU004', '2020-01-30'),
	('SA009', 'ST004', 'CU005', '2020-06-23'),
	('SA010', 'ST005', 'CU006', '2020-03-27'),
	('SA011', 'ST006', 'CU007', '2021-08-12'),
	('SA012', 'ST007', 'CU008', '2021-08-12'),
	('SA013', 'ST008', 'CU009', '2021-02-24'),
	('SA014', 'ST009', 'CU009', '2021-08-12')

INSERT INTO SalesDetail
VALUES
	('SA000', 'IT000', '40'),
	('SA000', 'IT001', '30'),
	('SA001', 'IT002', '50'),
	('SA001', 'IT003', '25'),
	('SA002', 'IT004', '35'),
	('SA003', 'IT005', '60'),
	('SA003', 'IT006', '15'),
	('SA003', 'IT007', '30'),
	('SA004', 'IT008', '100'),
	('SA004', 'IT009', '70'),
	('SA005', 'IT010', '45'),
	('SA005', 'IT011', '15'),
	('SA006', 'IT012', '35'),
	('SA007', 'IT013', '40'),
	('SA007', 'IT014', '50'),
	('SA008', 'IT015', '100'),
	('SA008', 'IT016', '20'),
	('SA008', 'IT017', '35'),
	('SA009', 'IT018', '40'),
	('SA010', 'IT019', '70'),
	('SA011', 'IT020', '60'),
	('SA012', 'IT021', '15'),
	('SA013', 'IT022', '25'),
	('SA013', 'IT023', '40'),
	('SA014', 'IT024', '50')
