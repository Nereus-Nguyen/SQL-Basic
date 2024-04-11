USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--CÚ PHÁP MỞ RỘNG LỆNH SELECT 
-- Mệnh đề WHERE: dùng làm bộ lọc/ Filter / nhắt ra nhưng dữ liệu ta cần theo tiêu chí nào đó
--ViDu: Lọc ra những sv quê ở Binh Duong
--		Lọc ra những sv có quê ở Tiền Giang và điểm tb >9 
-- Cú Pháp Dùng Bộ Lọc : SELECT *(cột muốn in ra) FROM <Tên-Table> WHERE < điều kiện lọc>
-- *Điều kiện lọc: Tìm từng dòng, Với Cái- Cột Có giá trị Cần lọc
--                 Lọc Theo tên cột với value thế nào, lấy tên cột, xem value trong cell
--					Có thỏa điều kiện hay không ?
-- Để viết điều kiện lọc ta cần : 
-- > Tên cột
-- > Value của cột (cell)
-- > Toán tử (operator) > >= < <= = [!= <> cùng ý nghĩa]
-- > Nhiều điều kiện đi kèm nhau --> dugnf thêm LOGIC OPERATOR ( AND, OR, NOT,
-- Ví Dụ : WHERE City = N'Bình Dương'
--		   WHERE City = N'Tiền Giang' AND Gpa >= 8
-- Lọc Liên Quan Đến Giá Trí/ VALUE / CELL Chứa gì, Ta phải quan tâm đến Data Types
-- Số : Nguyên/ thực, ghi số ra như truyền thống 5, 10, 3.14;
-- chuỗi/ Kí tự: 'A', 'Ahihi'
----------------------------------------------------------------
-- THỰC HÀNH 
--1. In ra danh sách khách hàng
SELECT * FROM Customers -- 92 rows

--2. In ra ds khach hang đến từ Ý 
SELECT * FROM Customers WHERE Country = 'Italy'

--3. in ra danh sách khách hàng đến từ Mỹ
SELECT * FROM Customers WHERE Country ='USA'

--3. in ra danh sách khách hàng đến từ Mỹ và Ý
SELECT * FROM Customers WHERE Country = 'USA' or Country= 'Italy'

--4. Sort theo Ý, Mĩ, để gom cùng cụm cho dễ theo dõi 
 SELECT * FROM Customers WHERE Country = 'USA' or Country= 'Italy' ORDER BY Country

--5. iN RA khach hang thu do Nuoc Duc
SELECT * FROM Customers WHERE Country ='Germany' and City ='Berlin'

--6 In ra thông tin của nhân viên 
SELECT * FROM Employees

--7. In ra thông tin nhân viên có năm sinh ltuwf 1960 trở lại đây.
SELECT * FROM Employees WHERE year(BirthDate)  >= 1960 

--8. In ra thông tin nhân viên có tuổi từ 60 trở lên 
SELECT YEAR(GETDATE()) - year(BirthDate) AS Age ,*
FROM Employees WHERE YEAR(GETDATE()) - year(BirthDate) >= 63
--9. Những nhân viên nào ở LONDON
SELECT * FROM Employees WHERE City ='LonDon'
--10. Những nhân viên nào không ở LONDON
SELECT * FROM Employees WHERE City != 'LonDon'

--Vi Diệu : Đảo mệnh đề 
SELECT * FROM Employees WHERE NOT(City ='LonDon')

--11. In ra hồ sơ nhân viên mã số là 1
SELECT * FROM Employees WHERE EmployeeID = 1
-- Công thức FULL 
-- SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY...
--      DISTINCT
--      Ham
--      NESTED QUERY/SUB QUERY

--12. Xem infor cua Don hang
SELECT * FROM Orders

--13. Xem infor cua Don hang sắp xếp giảm dần theo trọng lượng 
SELECT * FROM Orders ORDER BY Freight DESC
--14. Xem infor cua Don hang sắp xếp giảm dần theo trọng lượng , trong luong >= 500kg
SELECT * FROM Orders  WHERE Freight >= 500 ORDER BY Freight DESC
--15. Xem infor cua Don hang sắp xếp giảm dần theo trọng lượng , 100kg<=trong luong <= 500kg
SELECT * FROM Orders  WHERE Freight <= 500 and Freight >= 100 ORDER BY Freight DESC
--15. Xem infor cua Don hang sắp xếp giảm dần theo trọng lượng , 100kg<=trong luong <= 500kg và ship bởi cty giao vận số 1 
SELECT * FROM Orders  WHERE Freight <= 500 and Freight >= 100 AND ShipVia =1 

--16. và không ship tới LONDON 
SELECT * FROM Orders  WHERE Freight <= 500 and Freight >= 100 AND ShipVia =1 AND ShipCity = 'LonDon'
SELECT * FROM Orders  WHERE Freight <= 500 and Freight >= 100 AND ShipVia =1 AND NOT(ShipCity = 'LonDon')

-- rất cân thận khi trong mệnh đề WHERE lại có AND OR trộn với nhau, ta phải xài thêm ()
-- Để phân tách thứ tự filter (SS AND OR khác nữa) AND (ss khác)

-- 17. Liệt kê khách hàng đến từ <ỹ hoặc Mexico
SELECT * FROM Customers WHERE Country = 'USA' AND Country = 'Mexico' -- 0 rows
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico' -- 18 rows

-- 18. Liệt kê khách hàng ko đến từ Mỹ hoặc Mexico
SELECT * FROM Customers WHERE Country != 'USA' AND Country != 'Mexico'
SELECT * FROM Customers WHERE NOT(Country = 'USA' OR Country = 'Mexico')

-- 19. Liệt kê tự các nhân viên  ra trong đoạn [1960-1970]
SELECT * FROM Employees WHERE YEAR(BirthDate) <= 1970 AND YEAR(BirthDate) >= 1960 ORDER BY BirthDate DESC

