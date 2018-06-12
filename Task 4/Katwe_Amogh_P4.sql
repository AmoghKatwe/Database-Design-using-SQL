Query 1

create or replace trigger EmployeeWorkingOnAtmost5Orders before insert on Handles
for each row
declare
OrderNo natural;
begin
select count(*) into OrderNo from Handles
where EmployeeNo = :new.EmployeeNo;
if OrderNo >= 5 then
raise_application_error(-20001,('Employee' || :new.EmployeeNo || 'Cannot handle more' || 'than 5 orders'));
end if;
end;

insert into Handles values(222,3); ----success
insert into Handles values(222,7); ----Fail


Query 2

create or replace trigger Not_Earlier before insert on SubOrder
for each row
declare OrderDate DATE;
begin
select OrderDate into OrderDate
from USOrder b
where b.OrderNo= :new.OrderNo;
if :new.RequiredShipDate < OrderNo then
raise_application_error(-20001,('Required Shipping Date' || :new.RequiredShipDate || 'Cannot be earlier then' || 'order date of order' || 'to which suborder belongs')); 
end if;
end;

insert into SubOrder values(1,10,'05-FEB-2016','12-MAY-2016','Celiooffice'); ---Success
insert into SubOrder values(2,13,'01-JAN-2016','12-MAY-2016','Bluedartoffice'); ---Fail


Query 3

create or replace trigger Classification
before insert on Handles
for each row
declare EmployeeRole char;
begin
select E.EmployeeClass into EmployeeRole
from USEmployee E
where E.EmployeeNo = :new.EmployeeNo;
if EmployeeRole = 'F' then
raise_application_error(-20001,('Manager cannot handle order'));
end if;
end;

insert into Handles values(222,2); --Fail
insert into Handles values(777,1); --Success

Query 4

create table LateShipment_Audit(
EmpNo int,
Order_No int,
Sub_Order int,
ReqdShipDate DATE,
ActShipDate DATE);

create or replace trigger LaterShipment_Audit after update on SubOrder
for each row
declare EmpNumber int;
begin
select min(EmployeeNo) into EmpNumber
from Handles
where handles.OrderNo= :new.OrderNo;
if :new.ActualShipDate > :new.RequiredShipDate then
insert into LateShipment_Audit values(EmpNumber, :new.OrderNo , :new.SuborderNo, :new.RequiredShipDate, :new.ActualShipDate);
end if;
end;

Update SubOrder set ActShipDate ='01-MAR-2015';
Update SubOrder set ActShipDate ='02-JAN-2016';