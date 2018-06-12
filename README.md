# Database-Design-using-SQL

## 1.	Requirements
This is a purchase order processing database of Boston Papers Company. The company produces papers and sells them to office supply retail stores. The following is a description of the order processing database and other relevant information.

1. The customers of Boston Papers Company are retail office supply stores. Each customer has one headquarter and one or more branch stores in MA.
2. For each customer headquarter, we want to store the name of the customer, address, and phone number.

3. For each branch store of a customer, we want to keep a branch number, address, and phone number. A branch number is an integer starting with 1 and is not unique among all branch stores. It is unique only among those that belong to the same retail store. For example, Officemax has three branch stores and their branch numbers are 1, 2, and 3; Officedepot has two branch stores and their branch numbers are 1 and 2.

4. Boston Papers produces many different types of papers and each type of paper has a unique type number, size, weight, and unit price.

5. An order is issued by a retail store headquarter. For each order, we want to keep the following information.
(1) A unique order number
(2) The retail store who issued the order
(3) Order date and order amount (in Dollars)
(4) The employee(s) of the Boston Papers who handle the order

6. An order consists of one or more suborders. Each suborder has a suborder number. This suborder number is an integer starting with 1 and is not unique among all suborders. It is unique only among those that belong to a particular order. A suborder is shipped to exactly one branch store. A suborder includes one or more paper types. In addition to the suborder number, for each suborder, we want to keep the following information in the database:
(1) The branch store the suborder is shipped to
(2) Required shipping date
(3) Actual shipping date
(4) Quantity of each paper type included in the suborder

7. For each employee in the Boston Papers, we want to keep a unique employee ID, name, salary, address, classification, and the date of birth.

8. An order is handled by at least one employee and at most two employees, and an employee handles at most five orders.


## 2.	Convert the conceptual design of Part 1 into a relational data model.

## 3.	Tasks
1. Write a create table statement for each relation. In your create table statements, include at least two constraints for each table.
2. For each foreign key, specify appropriate referential triggered action clause.
3. Write insert statements to insert about 10 tuples into each table.
4. Write following queries in SQL and issue them to the database.

a. Show the OrderNo, Date, and Amount of all orders issued by <your choice of customer name>.
	
b. Show the EmpNo’s and names of all employees who handle at least two orders.
	
c. Show all suborder details (OrderNo, SuborderNo, required shipping date, actual shipping date, customer name, and BrNo) which were shipped later than required shipping date.
	
d). Show the details of all branches of <your choice of customer name>.
	
e. Show the OrderNo, date, amount, and customer name of all orders that are handled by <your choice of employee name>


## 4. Implement the constraints using triggers.
1. An employee handles at most 5 orders.

2. The required shipping date of a suborder cannot be earlier than the order date of the order to which the suborder belongs.

3. Only a staff member or a manager can handle orders. Here, it is assumed that the classification of an employee is one of {secretary, staff, manager}. If classifications in the database have different values, modify this requirement appropriately. For example, if in your database, possible values of classification are {assistant, staff, supervisor}, then change the requirements to “Only a staff member or a supervisor can handle orders,” and show the changed requirements in your report.

4. First, we create an audit table named LATE_SHIPMENT with five columns which keeps the following audit information. Whenever a suborder is shipped later than the required shipping date, enter the following entry in the above table: (1) EmpNo of an employee who handled the order, (2) OrderNo, (3) SuborderNo, (4) required shipping date, and (5) actual shipping date. If more than one employee handled the order, insert the only one EmpNo of the employee with the smallest EmpNo.

