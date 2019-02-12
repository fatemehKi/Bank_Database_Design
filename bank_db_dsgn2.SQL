--create database project
use project

drop table FailedTransactionLog
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
FailedTransactionLog,
TransactionType,
LoginErrorLog,
Employee,
FailedTransactionsErrorType;

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
AccountStatusTypeID tinyint,
InterestSavingsRateID tinyint
);

Create table OverDraftLog
( 
AccountID int,
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXml varchar(20)
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

Create table FailedTransactionLog
(
FailedTransactionID int primary key,
FailedTransactionErrorTypeID tinyint,
FailedTransactionErrorTime varchar(50),
FailedTransactionXML varchar(20)
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
FailedTransactionXML varchar(20)
);

Create table Employee
(
EmployeeID int primary key,
EmployeeFirstName varchar(25),
EmployeeMiddleInitial char(1),
EmployeesManager bit
);

create table FailedTransactionErrorType
(
FailedTransactionErrorTypeID tinyint primary key,
FailedTransactionDescription varchar(50)
);


/*the name faculty_dept_fk is just for naming and used for the joint
**************Alter table child add constraint constrain_name 
foreign key (name in the child table) references parent(name in prent tale)*************/


/**dropping FKs */
Alter table Login_Account
drop constraint FK1_login_account, FK2_login_account

alter table UserSecurityAnswers
drop constraint FK2_UserSecurityAnswers, FK4_UserSecurityAnswers

Alter table Customer_Account
drop constraint FK1_Customer_Account, FK2_Customer_Account

Alter table Account
drop constraint FK4_Account, FK5_Account, FK6_Account


/*foreign keys*/
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

alter table TransactionLog add constraint FK6_TransactionLog 
foreign key (AccountID) references Account(AccountID);

alter table TransactionLog add constraint FK3_TransactionLog 
foreign key (CustomerID) references Customer(CustomerID);

alter table TransactionLog add constraint FK4_TransactionLog 
foreign key (EmployeeID) references Employee(EmployeeID);

alter table TransactionLog add constraint FK5_TransactionLog 
foreign key (UserLoginID) references UserLogins(UserLoginID);

alter table Customer add constraint FK1_Customer 
foreign key (AccountID) references Account(AccountID);

alter table Customer add constraint FK2_Customer 
foreign key (UserLoginID) references UserLogins(UserLoginID);

alter table FailedTransactionLog add constraint FK1_FailedTransactionLog 
foreign key (FailedTransactionErrorTypeID) references FailedTransactionErrorType(FailedTransactionErrorTypeID)


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
FailedTransactionsErrorType;

insert into Login_account (UserLoginID, AccountID )
values 
(123, 4567),
(456, 8910),
(789, 1112),
(101, 1314),
(111, 1516)

insert into UserLogins (UserLoginID, UserLogin, UserPassword)
values 
(123, 'fati', 'fkia2'),
(456, 'kian', 'khan3'),
(789, 'ahma', 'shai'),
(101, 'joem', 'satu42'),
(111, 'sabi', 'krenA')

insert into UserSecurityAnswers( UserLoginID, UserSecurityanswer, UserSecurityQuestionID)
values
(123, 'MOM', 20),
(456, 'UofT', 30),
(789, 'Tehran', 40),
(101, 'DAD', 50),
(111, 'Poppy', 60)

insert into UserSecurityQuestions (UserSecurityQuestionID, UserSecurityQuestion)
values 
(10, 'your favorite place?'),
(20, 'your favorite person?'),
(30, 'ypur school'),
(40, 'Place you born'),
(50, 'your hero'),
(60, ' your pet name?')

insert into Customer_Account( AccountID, CustomerID)
values
(4567, 10001),
(8910, 10010),
(1112, 10012),
(1314, 10016),
(1516, 10019)

insert into Account( AccountID, CurrentBalance, AccountTypeID, AccountStatusTypeID, InsertSavingRateID)
values
(4567, 2000, 4, 500, 2 ),
(8910, 10010, 9, 600, 3),
(1112, 10012, 16, 700, 5),
(1314, 10016, 25, 800, 6),
(1516, 10019, 36, 900, 1)

insert into OverDraftLog (AccountID, OverDraftDate, OverDraftAmount, OverDraftTransactionXml)
values
(4567, '2018-11-11 ', 500.00, 'Successfull' ),
(8910, '2019-01-05 ', 250.00, 'Withrow'),
(1112, '2019-02-01 ', 50.00, 'Done'),
(1314, '2018-10-25 ', 75.00, ' Successfull'),
(1516, '2019-01-06 ', 450.00, 'Withrow')

insert into Customer (CustomerID, AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitail, CustomerLastName, City, State_ , ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhoen, SSN, UserLoginID)
values
(10001, 4567, 'Unit 2105', '20 Charles Street West', 'Alex', Null, 'Shiate', 'toronto', 'ON', 'M4Y 1R5', 'al.shi@gmail.com' , '12345678', '9101112', '13141516', '171819', 123)
(10010, 8910, 'Unit 1678', '50 Church Street', 'Akolo', 'M' , 'comel', 'toronto', 'ON', 'L45 r34', 'kolo.Com@gmail.com' , '212223142, '9101112', '13141516', '171819', 123),
(10012, 1112),
(10016, 1314),
(10019, 1516)


