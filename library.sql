CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address varchar(50) NOT NULL
);

INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpestown', '1468 Butternut Lane'),
	('Central', '4329 River Road'),
	('Westside', '3039 Austin Secret Road'),
	('Eastside', '3840 Rebecca Street')
;

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone varchar(50) NOT NULL
);

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Sunshine Books', 'Flordia', '555-555-5555'),
	('Surely Publishers', 'Mexico', '34-432-5675'),
	('Great Books', 'New Hampshire', '888-888-8888'),
	('Red Block', 'China', '123-32-324')
;

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(75) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL 
);

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('Stand By Me', 'Great Books'),
	('IT', 'Great Books'),
	('The Lost Tribe', 'Surely Publishers'),
	('Cry of Iron', 'Red Block'),
	('The Spell and the Ode', 'Great Books'),
	('The Translucent Pickle', 'Great Books'),
	('Alpha Retaliating', 'Red Block'),
	('The Face of the Titan', 'Red Block'),
	('Iron Point', 'Red Block'),
	('Branded for Evil', 'Red Block'),
	('Taste of Fury', 'Sunshine Books'),
	('Branded for Death', 'Surely Publishers'),
	('Call of Dawn', 'Great Books'),
	('Paragon Crying', 'Surely Publishers'),
	('Twilight of Jupiter', 'Sunshine Books'),
	('The Killer in the Village', 'Great Books'),
	('The Man in the Lake', 'Surely Publishers'),
	('Clue of the Devil', 'Great Books'),
	('The Unnatural Maple', 'Surely Publishers'),
	('Death of the Horned Pygmy', 'Red Block'),
	('Oath of Glass', 'Surely Publishers'),
	('Case of the Shrieking Ferret', 'Sunshine Books'),
	('Drown the Shadow', 'Great Books'),
	('Clue of the Bloody Pendant', 'Good Books'),
	('Tapped for Error', 'Surely Publishers'),
	('Saturn Dawning', 'Sunshine Books'),
	('The Copper Wolf', 'Surely Publishers'),
	('Crime of the Hairless Schoolboys', 'Sunshine Books'),
	('The Ember in the Mist', 'Good Books'),
	('Cursed Tribunal', 'Surely Publishers'),
	('Point of Death', 'Red Block'),
	('Trap the Mirage', 'Sunshine Books'),
	('The Shattered Wedding', 'Surely Publishers'),
	('Jilted', 'Great Books'),
	('Mercury Rise', 'Great Books'),
	('Sign', 'Great Books'),
	('The Counterfeit Dahlia', 'Surely Publishers'),
	('Apocalypse Forging', 'Red Block'),
	('The Throne', 'Surely Publishers'),
	('Death of the Corgi', 'Surely Publishers')
;

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	Name VARCHAR(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

INSERT INTO Borrower 
	(Name, Address, Phone)
	VALUES
	('John Smith', '123 Fake Street', '111-111-1111'),
	('Susan Washington', '234 Not Real Drive', '111-222-2222'),
	('Charlie Burns', '345 Dead End Road', '111-333-3333'),
	('Diego Valeri', '456 Wrong Way Way', '222-444-4444'),
	('Diego Chara', '567 Golden Street', '111-555-5555'),
	('Zarek Valentin', '678 Bronze Street', '111-666-6666'),
	('Sebastian Blanco', '789 Silver Street', '111-777-7777'),
	('Alvas Powell', '890 Main Street', '111-888-8888')
;

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Samuel Armenteros', '102 Frontage Road', '111-234-4567'),
	('Jeff Attinella', '107 Jeff St', '111-345-6789')
;

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(100,2, 2),
	(101, 2, 2),
	(102, 2, 2),
	(103, 2, 2),
	(104, 1, 2),
	(105, 1, 2),
	(106, 3, 2),
	(107, 3, 2),
	(108, 4, 2),
	(109, 4, 2),
	(110, 2, 2),
	(111, 2, 2),
	(112, 1, 2),
	(113, 1, 2),
	(114, 3, 2),
	(115, 3, 2),
	(116, 3, 2),
	(117, 4, 2),
	(118, 4, 2),
	(119, 4, 2),
	(120, 2, 2),
	(121, 2, 2),
	(122, 1, 2),
	(123, 1, 2),
	(124, 1, 2),
	(125, 3, 2),
	(126, 3, 2),
	(127, 3, 2),
	(128, 4, 2),
	(129, 4, 2),
	(130, 2, 2),
	(131, 2, 2),
	(132, 1, 2),
	(133, 1, 2),
	(134, 1, 2),
	(135, 3, 2),
	(136, 3, 2),
	(137, 4, 2),
	(138, 4, 2),
	(139, 4, 2)
;

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookIDL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL CONSTRAINT fk_BranchIDL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 2, 500, '2018-09-25', '2018-10-02'),
	(101, 2, 500, '2018-09-25', '2018-10-02'),
	(103, 2, 500, '2018-09-25', '2018-10-02'),
	(104, 2, 500, '2018-09-25', '2018-10-02'),
	(110, 2, 500, '2018-09-25', '2018-10-02'),
	(111, 2, 500, '2018-09-25', '2018-10-02'),
	(120, 2, 500, '2018-09-25', '2018-10-02'),
	(121, 2, 501, '2018-09-24', '2018-10-01'),
	(130, 2, 501, '2018-09-24', '2018-10-01'),
	(131, 2, 501, '2018-09-24', '2018-10-01'),
	(100, 2, 501, '2018-09-24', '2018-10-01'),
	(103, 2, 501, '2018-09-24', '2018-10-01'),
	(102, 1, 501, '2018-09-24', '2018-10-01'),
	(105, 1, 501, '2018-09-24', '2018-09-26'),
	(112, 1, 502, '2018-09-23', '2018-09-26'),
	(113, 1, 502, '2018-09-23', '2018-09-30'),
	(122, 1, 502, '2018-09-23', '2018-09-30'),
	(123, 1, 502, '2018-09-23', '2018-09-30'),
	(124, 1, 502, '2018-09-23', '2018-09-30'),
	(132, 1, 502, '2018-09-23', '2018-09-30'),
	(133, 1, 503, '2018-09-22', '2018-09-29'),
	(134, 1, 503, '2018-09-22', '2018-09-29'),
	(122, 1, 503, '2018-09-22', '2018-09-29'),
	(105, 1, 503, '2018-09-22', '2018-09-29'),
	(106, 3, 503, '2018-09-22', '2018-09-29'),
	(107, 3, 503, '2018-09-22', '2018-09-29'),
	(114, 3, 504, '2018-09-21', '2018-09-28'),
	(115, 3, 504, '2018-09-21', '2018-09-28'),
	(116, 3, 504, '2018-09-21', '2018-09-28'),
	(125, 3, 504, '2018-09-21', '2018-09-28'),
	(126, 3, 504, '2018-09-21', '2018-09-28'),
	(127, 3, 504, '2018-09-21', '2018-09-28'),
	(135, 3, 505, '2018-09-20', '2018-09-27'),
	(136, 3, 505, '2018-09-20', '2018-09-27'),
	(114, 3, 505, '2018-09-20', '2018-09-27'),
	(107, 3, 505, '2018-09-20', '2018-09-27'),
	(108, 4, 505, '2018-09-20', '2018-09-27'),
	(109, 4, 505, '2018-09-20', '2018-09-27'),
	(117, 4, 506, '2018-09-19', '2018-09-26'),
	(118, 4, 506, '2018-09-19', '2018-09-26'),
	(119, 4, 506, '2018-09-19', '2018-09-26'),
	(128, 4, 506, '2018-09-19', '2018-09-26'),
	(129, 4, 506, '2018-09-19', '2018-09-26'),
	(137, 4, 506, '2018-09-19', '2018-09-26'),
	(138, 4, 507, '2018-09-18', '2018-09-25'),
	(139, 4, 507, '2018-09-18', '2018-09-25'),
	(117, 4, 507, '2018-09-18', '2018-09-25'),
	(118, 4, 507, '2018-09-18', '2018-09-25'),
	(108, 4, 507, '2018-09-18', '2018-09-25'),
	(109, 4, 507, '2018-09-18', '2018-09-25')
;

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookIDT FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(100,'Stephen King'),
	(101,'Stephen King'),
	(102,'Ellanher Dickenson'),
	(103,'Ellanher Dickenson'),
	(104,'Ellanher Dickenson'),
	(105,'Ellanher Dickenson'),
	(106,'Ellanher Dickenson'),
	(107,'Ellanher Dickenson'),
	(108,'Ellanher Dickenson'),
	(109,'Ellanher Dickenson'),
	(110,'Sinisa Pugh'),
	(111,'Sinisa Pugh'),
	(112,'Sinisa Pugh'),
	(113,'Sinisa Pugh'),
	(114,'Sinisa Pugh'),
	(115,'Sinisa Pugh'),
	(116,'Sinisa Pugh'),
	(117,'Sinisa Pugh'),
	(118,'Sinisa Pugh'),
	(119,'Sinisa Pugh'),
	(120,'Chrysanthos Weaver'),
	(121,'Chrysanthos Weaver'),
	(122,'Chrysanthos Weaver'),
	(123,'Chrysanthos Weaver'),
	(124,'Chrysanthos Weaver'),
	(125,'Chrysanthos Weaver'),
	(126,'Chrysanthos Weaver'),
	(127,'Chrysanthos Weaver'),
	(128,'Chrysanthos Weaver'),
	(129,'Chrysanthos Weaver'),
	(130,'Delicia Laar'),
	(131,'Delicia Laar'),
	(132,'Delicia Laar'),
	(133,'Delicia Laar'),
	(134,'Delicia Laar'),
	(135,'Rowena Syd'),
	(136,'Rowland Laurinda'),
	(137,'Kelda Deon'),
	(138,'Amelia Orval'),
	(139,'Merit Rod')
;

SELECT * FROM Library_Branch
GO

/*********************
	PROCEDURE 1
 *********************/
CREATE PROC getTribe
AS
SELECT Number_Of_Copies FROM Book_Copies 
	WHERE 
	BookID = 102 
	AND 
	BranchID = 1
GO

getTribe

/*********************
	PROCEDURE 2
 *********************/
 CREATE PROC copiesLT
 AS
 SELECT Number_Of_Copies, BranchID 
 FROM Book_Copies
WHERE BookID = 102

copiesLT

 /*********************
	PROCEDURE 3
 *********************/
CREATE PROC getNotRenting
AS
SELECT Name
FROM Borrower
WHERE CardNo NOT IN (SELECT CardNo FROM Book_loans)
GO

getNotRenting

 /*********************
	PROCEDURE 4
 *********************/
CREATE PROC sharpesDueToday
 AS
SELECT a1.Title, a2.Name, a2.Address
FROM Books a1, Borrower a2, Book_Loans a3, Library_Branch a4
WHERE a4.BranchName='Sharpestown' AND a4.BranchId=a3.BranchId AND
a3.DateDue='2018-09-26' AND a3.CardNo=a2.CardNo AND a3.BookId=a1.BookId
sharpesDueToday

 /*********************
	PROCEDURE 5
 *********************/
CREATE PROC branchLoan
AS
SELECT L.BranchName, COUNT(*)
FROM LIBRARY_BRANCH L, BOOK_LOANS BL
WHERE BL.BranchId = L.BranchId
GROUP BY L.BranchName;
branchLoan

 /*********************
	PROCEDURE 6
 *********************/
CREATE PROC moreThanFive
AS
SELECT a1.Name, a1.Address, COUNT(*)
FROM BORROWER a1, BOOK_LOANS a2
WHERE a1.CardNo = a2.CardNo
GROUP BY a1.CardNo, a1.Name, a1.Address
HAVING COUNT(*) > 5;

moreThanFive

 /*********************
	PROCEDURE 7
 *********************/
CREATE PROC kingAtCentral
AS
SELECT DISTINCT a1.Title, a2.Number_Of_Copies
FROM Books a1
INNER JOIN Book_Copies a2 ON a1.BookID = a2.BookID
INNER JOIN Book_Authors a3 ON a1.BookID = a3.BookID
INNER JOIN Book_Loans a4 ON a1.BookID = a4.BookID
INNER JOIN Library_Branch a5 ON a4.BranchID = a5.BranchID
WHERE
a3.AuthorName = 'Stephen King'
AND
a4.BranchID = 2

kingAtCentral

/*****************************
   Selects and Procedures
 *****************************/
SELECT * FROM Library_Branch
SELECT * FROM Book_Copies
SELECT * FROM Book_Loans
SELECT * FROM Borrower
SELECT * FROM Publisher
SELECT * FROM Books
SELECT * FROM Book_Authors

getTribe
copiesLT
getNotRenting
sharpesDueToday
branchLoan
moreThanFive
kingAtCentral