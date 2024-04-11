USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
--Trong thực tế có những DATA/ INFOR chưa xác định được nó là gì??
--Kí tên danh sách thi, danh sách kí tên có cột điểm 
-- chưa xác định, từ từ sẽ có, từ từ sẽ được update 
-- NULL chưa xác định. (Không giá trị) => không so sánh lớn ><=...
-- Cấm Tuyệt đối XÀI các toán tử so sánh kèm voies giá trị NULL
-- Ta dùng Toán tử, IS NULL, IS NOT NULL, NOT(IS NULL) để filter cell có giá trị NULL

----------------------------------------------------------
--THỰC HÀNH
--1. In ra danh sách nhân viên
SELECT * FROM Employees

--2. Ai chưa xác định khu vực ở, region, NULL
SELECT * FROM Employees WHERE Region = 'NULL' -- 0 rows...Vì không ai ở khu vực tên là NULL
SELECT * FROM Employees WHERE Region = NULL -- 0 rows...Vì không thể dùng  <>=
SELECT * FROM Employees WHERE Region  IS NULL -- 4 rows 

--3. Những ai đã xác định được khu vực cư trú?
SELECT * FROM Employees WHERE Region = 'WA'
SELECT * FROM Employees WHERE Region IS NOT NULL
SELECT * FROM Employees WHERE NOT(Region IS NULL)

--4. Những nhân viên đại diện kinh doanh và xác định được nơi cư trú
SELECT * FROM Employees WHERE Title ='Sales Representative' AND Region IS NOT NULL

--5. Liệt kê danh sách khách hàng đến từ ANH, PHÁP, MỸ, có cả thông tin số FAX và Region
SELECT * FROM Customers WHERE Country IN('USA', 'UK', 'France') AND Fax is NOT NULl AND Region IS NOT NULL
