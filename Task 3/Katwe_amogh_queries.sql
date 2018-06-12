AMOGH KATWE
DBMS: Oracle

select OrderNo,OrderDate,Amount
from USOrder
where CustomerName='FedEx';

Select EmployeeNo,EmployeeName
from USEmployee
where (Select COUNT(*)
from Handles
where Handles.EmployeeNo=USEmployee.EmployeeNo)>=2;

Select OrderNo,SuborderNo,RequiredShipDate,ActualShipDate,CustomerName,BrNo
from Suborder ,Branch
where Branch.BranchName = Suborder.BranchName AND ActualShipDate > RequiredShipDate;

Select * from Branch
where CustomerName='Bluedart';

Select USOrder.OrderNo, OrderDate, Amount, CustomerName
from USOrder, USEmployee, Handles 
where Handles.EmployeeNo = USEmployee.EmployeeNo AND EmployeeName ='Tejal' AND Handles.OrderNo = USOrder.OrderNo;