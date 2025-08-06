create database implementDatabase

use implementDatabase

Create table Department 
(
	Dname nvarchar(20) not null,
	Dnum int primary key identity (1,1)
)

Create table Employee 
(
	Fname nvarchar(20) not null,
	Lname nvarchar(20) not null,
	SSN int primary key identity (100,1),
	BirthDate Date not null,
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	Dnum int not null,
	SuperviseSSN int,
	foreign key (Dnum) references Department (Dnum),
	foreign key (SuperviseSSN) references Employee (SSN)
)

Create table Department_Location
(
	Dnum int not null,
	Location varchar(100),
	primary key  (DNum, Location),
    foreign key  (DNum) REFERENCES Department(DNum)
)

Create table Project
(
	Pnumber int primary key identity (100,1),
	Pname nvarchar (20) not null,
	Location nvarchar (100),
	City nvarchar(100),
	Dnum int not null,
	foreign key (Dnum) references Department (Dnum)
)

Create table Manage 
(
	SSN int,
	Dnum int,
	HireDate date not null,
	Primary key (SSN, Dnum),
	foreign key (SSN) references Employee (SSN),
	foreign key (Dnum) references Department (Dnum)
)

Create table WorkOn
(
	SSN int,
	Pnumber int,
	Hours decimal not null,
	primary key (SSN,Pnumber),
	foreign key (SSN) references Employee (SSN),
	foreign key (Pnumber) references Project (Pnumber)
)

Create table Dependent 
(
	DepName nvarchar(50),
	SSN int,
	Gender char(1) check (Gender in ('M' , 'F')),
	Birthdate date not null,
	primary key (DepName, SSN),
	foreign key (SSN) references Employee(SSN)
)
