CREATE DATABASE banks_portal;
USE banks_portal;
CREATE TABLE accounts
(
accountId int not null unique primary key auto_increment,
ownerName varchar(45) not null,
owner_ssn int not null,
balance decimal(10,2) default 0.00,
account_status varchar(45)
);

CREATE TABLE Transactions 
(
transactionId int not null unique primary key auto_increment,
accountID int not null,
transactionType varchar(45) not null,
transactionAmount decimal(10,2) not null
);

INSERT INTO accounts
(ownerName, owner_ssn, balance, account_status)
values ("Maria Jozef", 123456789, 10000.00, "active"),
("Linda Jones", 987654321, 2600.00, "inactive"), 
("John McGrail",222222222, 100.50, "active"),
("Patty Luna", 111111111, 509.75, "inactive");

INSERT INTO Transactions
(accountID, transactionType, transactionAmount)
values (1, "deposit", 650.98),
(3, "withdraw", 899.87),
(3, "deposit", 350.00);

DELIMITER //
CREATE PROCEDURE accountTransactions(in accountID int)
BEGIN
	SELECT * FROM Transactions WHERE accountID = accountID;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deposit(
	in accountID int,
	in amount decimal(10,2) 
)
BEGIN
	INSERT INTO Transactions (accountID, transactionType, transactionAmount)
    VALUES(accountID, "deposit", amount);
    
    UPDATE accounts
    SET balance = balance + amount
    where accountId = accountID;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE withdraw(
	in accountID int,
	in amount decimal(10,2) 
)
BEGIN
	INSERT INTO Transactions (accountID, transactionType, transactionAmount)
    VALUES(accountID, "withdrawl", amount);
    
    UPDATE accounts
    SET balance = balance - amount
    where accountId = accountID;
END//
DELIMITER ;



 


