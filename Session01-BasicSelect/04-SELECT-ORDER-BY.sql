USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--CÚ PHÁP MỞ RỘNG LỆNH SELECT 
-- Ta muốn sắp xếp dữ liệu/sort theo tiêu chí nào đó, thường là tăng dần- ASCENDING/ASC
--                                                              giảm dần -DESCENDING/DESC
-- Mặc định không nói gì là sort tăng dần
-- A < b < C
-- 1 < 2 < 3
-- Ta có thể sort trên nhiều cột, logic này từ từ tính
-- SELECT ...FROM < Tên-Table> ORDER BY Tên cột muốn sort < KIểu Sort>
--------------

--1. In ra danh sách nhân viên
Select * From Employees
-- 2. In ra danh sách nhân viên theo năm sinh tăng dần
SELECT * From Employees ORDER BY BirthDate ASC
SELECT * From Employees ORDER BY BirthDate -- mặc định là tăng dần

-- 3. In ra danh sách nhân viên theo năm sinh giảm dần
SELECT * From Employees ORDER BY BirthDate DESC

--4. Tính tiền chi tiết Mua hàng 
SELECT *FROM [Order Details]
SELECT *, UnitPrice * Quantity*(1 - Discount) AS Suptotal FROM [Order Details]

--5. Tính tiền chi tiết Mua hàng, sắp xếp giảm dần theo số tiền 
SELECT *FROM [Order Details]
SELECT *, UnitPrice * Quantity*(1 - Discount) AS Suptotal FROM [Order Details]
    ORDER BY Suptotal DESC

--6 In ra danh sách nhân viên giảm dần theo tuổi 
SELECT  * FROM Employees
SELECT EmployeeID, FirstName,BirthDate , year(GETDATE())-year(BirthDate)  as Age FROM Employees
     ORDER BY Age DESC
