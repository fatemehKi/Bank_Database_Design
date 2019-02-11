--create database project
use project

drop table 
Login_account, 
User_Logins, 
UserSecurityAnswers,
UserSecurityQuestions,
Customer_Account,
Account,
OverDraftLog,
Customer,
TransactionLog,
AccountType,
SavingInterestRates,
AccountStatusType,
FailedTransctionLog,
TransctionType,
LoginErrorLog,
Employee,
FaieldTransactionsErrorType;

create table Login_account
(
UserLoginID smallint,
AccoutID int 
);

create table User_Logins
( 
UserLoginID smallint primary key,
UserLogin varchar(15),
UserPassword varchar(20)
);

create table UserSecurityAnswers
( 
UserLoginID smallint primary key,
UserSecuritynswer varchar(25)
);

create table UserSecurityQuestions
(
UserSecurityQuestionID tinyint primary key,
UserSecurityQuestion varchar(50)
);

create table Customer_Account
(
AccountID int,
CustomerID int
);

create table Account
( 
AccountID int,
CurrentBalance int,
AccountTypeID tinyint,
AccountSttusTypeID tinyint,
AccountSavingRateID tinyint
);

Create table OverDraftLog
( 
AccountID int,
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXml xml
);

Create table Customer
(
CustomerID int primary key,
AccountID int,
CustomerAddress1 varchar(30),
CustomerAddress2 varchar(30),
CustomerFirstName varchar(30),
CustomerMiddleInitail char(1),
CustomerLastName varchar(30),
City varchar(20),
State_ char(2),
ZipCode char(10),
EmailAddress varchar(40),
HomePhone char(10),
CellPhone char(10),
WorkPhoen char(10),
SSN char(9),
UserLoginID smallint
);

Create table TransactionLog
( 
TransactionID int primary key,
TransactionDate datetime,
TransactionAmount money,
NewBalance money,
AccountID int,
CustomerID int,
EmployeeID int,
UserLoginID smallint,
);

Create table AccountType
(
AccountTypeID tinyint primary key,
AccountTypeDescription varchar(30)
);

create table SavingInterestRates
(
InterestSavigRateID tinyint primary key,
InterestRateValue numeric(9,9),
InterestRateDescription varchar(20),
);

create table AccountStatusType
(
AccountStatusTypeID tinyint primary key,
AccountStatusDescription varchar(30)
);

Create table FailedTransctionLog
(
FailedTransactionID int primary key,
FailedTransactionErrorTypeID tinyint,
FailedTransactionErrorTime varchar(50),
FailedTransactionXML xml
);

Create table TransctionType
(
TransactionTypeID tinyint primary key,
TransactionTypeName char(10),
TransactionTypeDescription varchar(50),
TransactionFeemount smallmoney
);

create table LoginErrorLog
(
ErrorLogID int primary key,
ErrorTime datetime,
FailedTransactionXML xml
);

Create table Employee
(
EmployeeID int primary key,
EmployeeFirstName varchar(25),
EmployeeMiddleInitial char(1),
EmployeesManager bit
);

create table FaieldTransactionsErrorType
(
FailedTransactionErrorTypeID tinyint primary key,
FailedTransactionDescription varchar(50)
);
