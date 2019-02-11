--create database project
use project

drop table 
Login_account, 
UserLogins, 
UserSecurityAnswers,
UserSecurityQuestions,
Customer_Account,
Account,
OverDraftLog,
Customer,
TransactionLog,
AccountType,
SavingsInterestRates,
AccountStatusType,
FailedTransctionLog,
TransactionType,
LoginErrorLog,
Employee,
FaieldTransactionsErrorType;

create table Login_account
(
UserLoginID smallint,
AccountID int 
);

create table UserLogins
( 
UserLoginID smallint primary key,
UserLogin varchar(15),
UserPassword varchar(20)
);

create table UserSecurityAnswers
( 
UserLoginID smallint primary key,
UserSecurityanswer varchar(25),
UserSecurityQuestionID tinyint
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
AccountID int primary key,
CurrentBalance int,
AccountTypeID tinyint,
AccountSttusTypeID tinyint,
InterestSavingsRateID tinyint
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
TransactionTypeID tinyint,
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

create table SavingsInterestRates
(
InterestSavingsRateID tinyint primary key,
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

Create table TransactionType
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


/*the name faculty_dept_fk is just for naming and used for the joint
**************Alter table child add constraint constrain_name 
foreign key (name in the child table) references parent(name in prent tale)*************/
/* 
Alter table Login_Account
drop constraint FK1_login_account, FK2_login_account

alter table UserSecurityAnswers
drop constraint FK2_UserSecurityAnswers, FK4_UserSecurityAnswers
*/ 

alter table Login_Account add constraint FK1_login_account 
foreign key (UserLoginID) references UserLogins(UserLoginID); 

alter table Login_Account add constraint FK2_login_account 
foreign key (AccountID) references Account(AccountID); 


alter table UserSecurityAnswers add constraint FK2_UserSecurityAnswers 
foreign key (UserLoginID) references UserLogins(UserLoginID);

alter table UserSecurityAnswers add constraint FK4_UserSecurityAnswers 
foreign key (UserSecurityQuestionID) references UserSecurityQuestions(UserSecurityQuestionID);

alter table Customer_Account add constraint FK1_Customer_Account 
foreign key (AccountID) references Account(AccountID);

alter table Customer_Account add constraint FK2_Customer_Account 
foreign key (CustomerID) references Customer(CustomerID);

alter table Account add constraint FK4_Account 
foreign key (AccountTypeID) references AccountType(AccountTypeID);

alter table Account add constraint FK5_Account 
foreign key (AccountStatusTypeID) references AccountStatusType(AccountStatusTypeID);

alter table Account add constraint FK6_Account 
foreign key (InterestSavingsRateID) references SavingsInterestRates(InterestSavingsRateID);

alter table OverDraftLog add constraint FK1_OverDraftLog 
foreign key (AccountID) references Account(AccountID);

alter table TransactionLog add constraint FK7_TransactionLog 
foreign key (TransactionTypeID) references TransactionType(TransactionTypeID);
