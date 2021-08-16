
CREATE TABLE STAFF
( EmpId           VARCHAR(50)   NOT NULL,
  FirstName  VARCHAR(30)     ,
  LastName    VARCHAR(30),
  Gender VARCHAR(10), designation VARCHAR(20),
  Address VARCHAR(10),
  WorkHours INT,
  dependents INT,
  PRIMARY KEY(EmpId));
 

  CREATE TABLE CLIENT(
ClientId	Varchar(50)	  NOT NULL,
Password	Varchar(30)	  NOT NULL,
ContactPerson	Varchar(50),	
ContactNo	Varchar(11) UNIQUE	,
Address	Varchar(100),	
CompanyName	Varchar(80),
  PRIMARY KEY(ClientId));

  

 CREATE TABLE EVENTDESC(
EventId		int NOT NULL,
ClntId	Varchar(50),	
Audience	Varchar(50),	
TimePeriod	Varchar(10),	
Invitation	Varchar(50),	
TypeEvent	Varchar(30),		
Venue	Varchar(100),		
Performance	Varchar(100),PRIMARY KEY(EventId));


CREATE TABLE SPONSORS(
SponsorId	int NOT NULL,	
SponsorName	Varchar(100),	
Product	Varchar(100),PRIMARY KEY(SponsorId));

CREATE TABLE ESTIMATE(
EventsId		int,
emPiD	Varchar(50),	
Rate	int,	
ApproveStatus	BIT);

CREATE TABLE SERVICEPROVIDER
(ProviderId	int NOT NULL,
CompanyName	Varchar(100),	
Contact	Varchar(50),	
ContactNo	Varchar(11),	
ServiceType	Varchar(100),	
ServiceRate	int,	
ServiceUnit	Varchar(20),PRIMARY KEY(ProviderId));

CREATE TABLE EXPENDITURE
(TransId	int	NOT NULL,
EVNId	int,
PrvdrId	int,
EmployeeId	Varchar(50),
Amount	int, DUEDATE varchar(50)
primary key(TransId));

CREATE TABLE EVENTSERVICE
(
EventID	int,
ProvdriD	int,	
Expenses	int);

CREATE TABLE  EventSponsor
(
EVENT_Id	int,
SponsorID	int,
SponsorService	Varchar(50),	
Revenue	int);



CREATE TABLE PURCHASEORDER(
EVENTIDs	int,	
PROVIDERID	int,	
Descrptn	Varchar(300),	
DateDelivery	VARCHAR(30),	
Units	int,
Rate	int,
Taxes	int,
Others	Varchar(20));

CREATE TABLE DELIVERYCHALLAN(
ChallanNo	int NOT NULL,
EventId_challan	int,
ProviderId_challan	int,
EmpId_challan	Varchar(50),
ChallanDate	VARCHAR(20),	
Quality	Bit,
Amount	int,
AcceptStatus	Bit,PRIMARY KEY(ChallanNo));

ALTER TABLE PURCHASEORDER ADD CONSTRAINT taxes check(Taxes<=30)

ALTER TABLE DELIVERYCHALLAN ADD CONSTRAINT Amount check(Amount>1000 and Amount<1000000)

ALTER TABLE EVENTDESC ADD CONSTRAINT ClntId FOREIGN KEY(ClntId)references CLIENT(ClientId)on delete cascade on update cascade

ALTER TABLE ESTIMATE ADD CONSTRAINT EventsId FOREIGN KEY(EventsId)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE ESTIMATE ADD CONSTRAINT emPiD FOREIGN KEY(emPiD)references STAFF(EmpId)on delete cascade on update cascade

ALTER TABLE EXPENDITURE ADD CONSTRAINT EmployeeId FOREIGN KEY(EmployeeId)references STAFF(EmpId)on delete cascade on update cascade

ALTER TABLE EXPENDITURE ADD CONSTRAINT EVNId FOREIGN KEY(EVNId)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE EXPENDITURE ADD CONSTRAINT PrvdrId FOREIGN KEY(PrvdrId)references SERVICEPROVIDER(ProviderId)on delete cascade on update cascade

ALTER TABLE EVENTSERVICE ADD CONSTRAINT ProvdriD FOREIGN KEY(ProvdriD)references SERVICEPROVIDER(ProviderId)on delete cascade on update cascade

ALTER TABLE EVENTSERVICE ADD CONSTRAINT EventID FOREIGN KEY(EventID)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE EventSponsor ADD CONSTRAINT SponsorID FOREIGN KEY(SponsorID)references SPONSORS(SponsorId)on delete cascade on update cascade

ALTER TABLE EventSponsor ADD CONSTRAINT EVENT_Id FOREIGN KEY(EVENT_Id)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE PURCHASEORDER ADD CONSTRAINT EVENTIDs FOREIGN KEY(EVENTIDs)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE PURCHASEORDER ADD CONSTRAINT PROVIDERID FOREIGN KEY(PROVIDERID)references SERVICEPROVIDER(ProviderId )on delete cascade on update cascade


ALTER TABLE DELIVERYCHALLAN ADD CONSTRAINT ProviderId_challan FOREIGN KEY(ProviderId_challan)references SERVICEPROVIDER(ProviderId)on delete cascade on update cascade


ALTER TABLE DELIVERYCHALLAN ADD CONSTRAINT EventId_challan FOREIGN KEY(EventId_challan)references EVENTDESC(EventId)on delete cascade on update cascade

ALTER TABLE DELIVERYCHALLAN ADD CONSTRAINT EmpId_challan FOREIGN KEY(EmpId_challan)references  STAFF(EmpId)on delete cascade on update cascade


INSERT INTO STAFF
  VALUES('BZ113','Natasha','Dsilva','Female','MD','Bangalore','6','3'),
  ('BZ215','Niyathi','Shanbag','Female','CO-ORDINATOR','Mangalore','7','2'),
  ('BZ116','Viksith','Hegde','male','SUPERVISOR','Bangalore','9','3'),
  ('BZ998','Mokshith','Kapoor','male','GROUP-A-EMPLOYEE','mumbai','6','3'),
  ('BZ118','Arnav','Gupta','male','GROUP-B-EMPLOYEE','Bangalore','6','3');
  

  
 INSERT INTO CLIENT
 VALUES('CL001','974A','MR.SHARMA','1134','MUMBAI','FUTURE PHARMA'),
 ('CL002','127B','MR.KHAN','6859','UDUPI','EASY FIT'),
 ('CL003','792C','MRS.PHILOMINA','9135','CHENNAI','STAR CAFE'),
 ('CL004','099D','MR.HEGDE','2934','AGRA','HEGDE AND COMPANY'),
 ('CL005','452E','MR.RAO','6312','UDUPI','LIVE LOVE LAUGH');



 INSERT INTO EVENTDESC
VALUES('001','CL001','BELOVE THOUSAND','5HRS','E-MAIL','AWARD-FUNCTION','BANGALORE','GOOD'),
('013','CL004','BELOVE THREE HUNDRED','3HRS','HANDBILLS','AWARD-FUNCTION','MANGALORE','BEST'),
('095','CL005','BELOVE FIVE THOUSAND','2HRS','PERSONALLY SENT','INNAGURATION','AGRA','POOR'),
('032','CL002','BELOVE SEVEN HUNDRED','3HRS','E-MAIL','FELICITATION','PUNE','AVG');

INSERT INTO SPONSORS
VALUES('114','DAIRY DAY','DAIRY PRODUCTS'),
('232','EKAM LEARNING','EDUCATIONAL'),
('512','HUDA','COSMETICS'),
('119','LENOVO','ELECTRONICS'),
('239','YONEX','SPORTS');





INSERT INTO ESTIMATE
VALUES('001','BZ113','300000','1'),
('013','BZ215','100000','1'),
('095','BZ998','200000','1'),
('032','BZ118','350000','0');


INSERT INTO SERVICEPROVIDER
VALUES('5113','SERVICE SUPER FAST','SALES DEPARTMENT','11356','HOSPITALITY','100000','ABOVE 100'),
('5115','CHEF INDIA','SERVICE DEPARTMENT','11356','CATERING','50000','ABOVE 150'),
('5117','MANAPURAM GOLD LOAN','MD','11356','FINANCIAL','30000','ABOVE 200'),
('5118','EASY GO','SALES DEPARTMENT','11356','LOGISTICS','45000','ABOVE 190');


INSERT INTO EXPENDITURE
VALUES('131','013','5115','BZ215','350000','22 JULY 2020'),
('146','095','5117','BZ116','230000','22 SEPT 2020'),
('235','032','5113','BZ998','450000','25 NOV 2020');


INSERT INTO EVENTSERVICE
VALUES('013','5115','350000'),
('095','5117','230000'),
('032','5113','450000');

INSERT INTO EventSponsor
values('013','114','GIFT HAMPER','13000'),
('095','232','FOOD','20000'),
('032','512','SECURITY','50000');

INSERT INTO PURCHASEORDER
VALUES('013','5115','FOOD PLATES','22 MAY 2020','52','150','20','PACKING'),
('095','5117','LUCKY COUPONS','29 JUNE 2020','35','2000','10',NULL),
('032','5113','CHAIRS','21 MAY 2020','32','30','18',NULL);


INSERT INTO DELIVERYCHALLAN
VALUES('3219','013','5115','BZ215','15 may 2020','1','93600','1'),
('1536','095','5117','BZ116','16 may 2020','1','77150','1'),
('3339','032','5113','BZ998','16 may 2020','1','96000','1');






GO
CREATE TRIGGER violationafterinsert on DELIVERYCHALLAN AFTER INSERT
AS
DECLARE @Amount int;
DECLARE @EventId_challan	 int;
DECLARE @log_action varchar(20);
select
@Amount=i.Amount,@EventId_challan=i.EventId_challan	 from inserted i;
set @log_action='inserted record';
if(@Amount<1000 or @Amount>1000000)
insert into violationafterinsert(message,EventId_challan,log_action,log_timestamp)values('rule violated',@EventId_challan,@log_action,getdate());
else
insert into violationafterinsert(message,EventId_challan,log_action,log_timestamp)values('',@EventId_challan,@log_action,getdate());
print'after inserted triggered fired'


GO
CREATE TRIGGER violationafterupdate on DELIVERYCHALLAN AFTER update
AS
DECLARE @Amount int;
DECLARE @EventId_challan	 int;
DECLARE @log_action varchar(20);
select
@Amount=i.Amount,@EventId_challan=i.EventId_challan	 from inserted i;
set @log_action='updated record';
if(@Amount<1000 or @Amount>1000000)
insert into violationafterupdate(message,EventId_challan,log_action,log_timestamp)values('rule violated',@EventId_challan,@log_action,getdate());
else
insert into violationafterupdate(message,EventId_challan,log_action,log_timestamp)values('',@EventId_challan,@log_action,getdate());
print'after updated triggered fired'






/*Retrieve the first name,last name , gender , and no of working hours of the staffs who live in Bangalore*/
SELECT FirstName as First_name,Lastname as Last_name ,Gender as gender, WorkHours as workhour
FROM STAFF
WHERE Address = 'Bangalore' 



/* Retrieve id  first name and last name of staff who have expenditure Amount>400000  */


SELECT EmpId  as Employee_id,FirstName as First_name,Lastname as Last_name 

FROM STAFF AS s 
WHERE  EXISTS
(select * 
FROM EXPENDITURE AS e
WHERE e.Amount> 400000 and s.EmpId=e.EmployeeId) 

/* Retrieve id  first name, last name ,Address and number of working hours whose estimate rate is between 200000 and 300000*/

SELECT s.EmpId  as Employee_id,s.FirstName as First_name,s.Lastname as Last_name ,s.Address as my_address ,s.WorkHours as no_of_hours

FROM STAFF AS s 
WHERE  EXISTS(
SELECT*
FROM ESTIMATE AS e
WHERE (e.Rate BETWEEN 200000 and 300000) and s.EmpId=e.EmpId)


/*Retrieve the Client id ,contact number address and  company name whose event desc venue isnt in bangalore*/

SELECT ClientId as clnt_id,	ContactNo as contact_num, Address as address,CompanyName as company_name
FROM CLIENT as c
WHERE NOT EXISTS(
SELECT*
FROM EVENTDESC AS e
WHERE e.Venue='BANGALORE' and c.ClientId=e.ClntId)

/*AGGREGATE FUNCTIONS*/
/*Count the number of staffs and total number of clients */
SELECT COUNT(EmpId) from STAFF
SELECT COUNT(ClientId) from CLIENT

/*USING ALL THE BASIC AGGREGATE FUNCTIONS*/
SELECT MAX(Rate) from ESTIMATE
SELECT SUM(Rate) from ESTIMATE
SELECT MIN(Rate) from ESTIMATE
SELECT AVG(Rate) from ESTIMATE
SELECT MAX(WorkHours) FROM STAFF
SELECT SUM(WorkHours) FROM STAFF
SELECT MIN(WorkHours) FROM STAFF
SELECT AVG(WorkHours) FROM STAFF


/* GROUP BY FUNCTION   -> Find the sum of the workhours by male and female*/


SELECT Gender ,SUM(WorkHours)
from STAFF
GROUP BY GENDER

/*OUTER JOIN FUNCTIONS*/





/*Retrieve names of EMPLOYEES worked for the event id'095'*/
select FirstName ,LastName
from (ESTIMATE as E left outer join STAFF as S on S.EmpId=E.emPiD) join EVENTDESC as ED on ED.EventId=E.EventsId
where E.EventsId=095







/*Retrieve the sponsor names for the event id'032'*/
select S.SponsorName as SponsorName	
from (EventSponsor as ES right outer join SPONSORS as S on ES.SponsorID = S.SponsorId)join EVENTDESC as DESCR on DESCR.EventId=ES.Event_ID
where ES.Event_ID=032
