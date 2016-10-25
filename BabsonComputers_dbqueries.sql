/*Babson Computers */

/*Eli Iaslovits, Kevin Mitchell, Michael Phillips */


Use BabsonComputers

--Select Queries --

Select *
 From Product

Select *
 From Customer

Select *
 From OrderHeader

Select *
 From OrderLine



-- Aggregate Function Query --

Select SUM(TotalDue) as Total_Revenue
 From OrderHeader


-- Query that selects records from two tables using inner join --


Select C.FirstName, C.LastName, SUM(O.TotalDue) as Amount_Owed
 From Customer as C
 Join OrderHeader as O
 ON C.CustomerID = O.CustomerID
 Group By C.FirstName, C.LastName
 Order By Amount_Owed DESC


-- Query using Left Outer Join --

Select C.FirstName, C.LastName, C.EmailAddress, SUM(O.TotalDue) as Amount_Owed
 From Customer as C
 Left Outer Join OrderHeader as O
 ON C.CustomerID = O.CustomerID
 Group By C.FirstName, C.LastName, C.EmailAddress
 Order By Amount_Owed DESC

 /* Left outer join is necessary to show all the customers and what they owe 
 but it also shows which customers have not ordered and we could possibly extend a promotion to them */

 Select AVG(TotalDue)
  From OrderHeader

--Subquery --

Select OH.TotalDue, P.AssetTag, P.Make, P.Model 
 From OrderHeader as OH
 Join OrderLine as OL
 On OH.OrderID = OL.OrderID
 Join Product as P
 ON OL.AssetTag = P.AssetTag
 Where OH.TotalDue >
	(Select AVG(TotalDue) as Average_TotalDue
	From OrderHeader)
Order By TotalDue