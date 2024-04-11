USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--CÚ PHÁP MỞ RỘNG LỆNH SELECT 
--Khi cần lọc dữ liệu trong một đoạn cho trước thay vì dùng >= ... AND <= ... , ta có thể thay thế
-- bằng mệnh đề BETWEEN , IN
-- * Cú pháp: Cột BETWEEN VALUE-1 AND VALUE-2
-- * Cú pháp: IN... CỘt IN ( Một tập giá trị được liệt kê cách nhau dấu phẩy)
-- thay thế cho OR 
----------------------------------------------------------------
-- THỰC HÀNH 
--1. liệt kê danh sách nhân viên trong năm 1960..1970
SELECT * FROM Employees WHERE YEAR(BirthDate) <= 1970 AND YEAR(BirthDate) >= 1960 ORDER BY BirthDate DESC
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 ORDER BY BirthDate DESC

--2. Liệt kê các đơn hàng có trọng lượng từ 100...500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500

--3. Liệt kê các đơn hàng gửi tới Anh, Pháp, Mỹ.
SELECT * FROM Orders WHERE ShipCountry = 'UK' OR ShipCountry = 'USA' OR ShipCountry = 'France'

SELECT * FROM Orders WHERE ShipCountry  IN('UK', 'USA', 'France')

--4. Liệt kê các đơn hàng không gửi tới Anh, Pháp, Mỹ.
SELECT * FROM Orders WHERE ShipCountry  NOT IN('UK', 'USA', 'France')

--5. Liệt kê các đơn hàng trong năm 1996 ngoại trừ các tháng 6 7 8 9
SELECT * FROM Orders WHERE year(OrderDate) = '1996'  AND month(OrderDate)  IN(1,2,3,4,5,10,11,12)

--6. Liệt kê các đơn hàng có trọng lượng 100..110
SELECT *FROM Orders WHERE Freight BETWEEN 100 AND 110 ORDER BY Freight DESC