USE NORTHWND
-----------------------------------------------------
--LÝ THUYẾT
-- DB ENGINE hổ trợ 1 loạt nhóm hàm dùng theo tác trên nhóm dòng/ cột, gôm data tính toán trên data này
-- Gom Nhóm (AGGREGATE FUNTIONS)
-- CUONT() SUM() MAX() MIN() AVG()
--* Cú Pháp
--SELECT Cột..., Hàm Gom nhóm() ... FROM <Table> ...WHERE...GROUP By (Gom theo cụm cột nào)
--SELECT Cột..., Hàm Gom nhóm() ... FROM <Table> ...WHERE...GROUP By (Gom theo cụm cột nào) HAVING

-- * HÀM COUNT() : đếm số lần suất hiện của 1 cái gì đó 
--	COUNT(*) Đếm số dòng trong TABLE
--	COUNT(*) FROM...WHERE... : CHỌN RA NHỮNG DÒNG THỎA TIÊU CHÍ NÀO ĐÓ RỒI MỚI ĐẾM 
--	COUNT(Cột nào đó):
-----------------------------------------------------
--1. In ra danh sách các nhân viên
	SELECT * FROM Employees
-- 2. Đếm xem có bao nhiêu nhân viên 
SELECT COUNT(*) FROM Employees
SELECT COUNT(*) AS [Number of employees] FROM Employees

--3. Có bao nhiêu nhân viên ở LonDon
SELECT COUNT(*) AS [No of eaps in LonDon] FROM Employees WHERE City ='LonDon'

--4. Có bao nhiêu lượt thành phố xuất hiện / giái thích : cứ xuất tên tp là đếm, k quan tâm lặp lại .
SELECT COUNT(City) FROM Employees -- 9 luot tp xuat hien

--5. Đếm xem có bao nhiêu Regtion
SELECT COUNT(Region) FROM Employees -- Hàm count cột , Nếu có NULL thì không đếm.

--5.1 Đếm có bao nhiêu dòng xuất hiện NULL
SELECT COUNT(*) FROM Employees WHERE Region IS NULL -- Đếm sự xuất hiện chứa dòng region NULL
SELECT COUNT(Region) FROM Employees WHERE Region IS NULL -- NULL không đếm được, không value 

--6. Có bao nhiêu thành phố
SELECT * FROM Employees
SELECT City FROM Employees --9
SELECT DISTINCT City FROM Employees --5
--	tui coi kết quả là 1 table,

--	SUB QUERY MỚI: COI 1 CÂU SELECT LÀ 1 TABLE, BIẾN VALUE NÀY VÀO TRONG MỆNH ĐỀ FROM 
SELECT *from 
	(SELECT DISTINCT City FROM Employees) as CITIES

SELECT COUNT(*) FROM 
	(SELECT DISTINCT City FROM Employees ) AS CITIES 

SELECT COUNT(*) FROM Employees --9 NV
SELECT COUNT(City) FROM Employees -- 9 CITY
SELECT COUNT(DISTINCT City) FROM Employees -- 5

--8. Đếm xem mỗi thành phố có bao nhiêu nhân viên 
--  KHI CÂU HỎI CÓ TÍNH TOÁN GOM DATA (HÀM AGGEGATE) MÀ LẠI CHỨA TỪ KHÓA "MỖI"...
-- GẶP TỪ' MỖI' CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ, CHIA ĐỂ GOM ĐẾM.
-- sỰ XUẤT HIỆN CỦA NHÓM 
-- ĐẾM THEO SỰ XUẤT HIỆN CỦA NHÓM, COUNT ++ TRONG NHÓM, SAU ĐÓ RESET  TRONG NHÓM MỚI 
-- Muốn hiện thị số lượng của ai đó, gì đó, gom nhóm theo cái gì đó 
-- Gom theo KEY /PK, vô nghĩa , vì KEY không trùng 
SELECT *FROM Employees
select count(City) FROM Employees GROUP BY City -- Đếm VALUE của city nhưng theo nhóm 
select City , count(City) AS[No employess] FROM Employees GROUP BY City

--9. Hãy có biết thành phố nào có từ 2 nhân viên trở lên 
--9.1 thành phố có bao nhiêu nhân viên
--9.2 đếm xong mỗi thành phố ta bắt đầu lọc lại kết quả sau đếm 
-- FILTER sau đếm WHERE sau đếm WHERE sau khi đã gom, AGGREGATE thì gọi HAVING 
select City , count(City) AS[No employess] FROM Employees GROUP BY City
select City , count(*) AS[No employess] FROM Employees GROUP BY City

select City , count(*) AS[No employess] FROM Employees GROUP BY City HAVING COUNT(*) >= 2

--10. Đếm số nhân viên của 2 thành phố Seatle và LonDon
SELECT City, COUNT(*) FROM Employees WHERE City IN ('London','Seattle') GROUP BY City

--11. Trong 2 thành phố nhiều hơn 3 nhân viên 
SELECT City, COUNT(*) FROM Employees WHERE City IN ('London','Seattle') GROUP BY City HAVING COUNT(*) >= 3

--12 Đếm Có bao nhiêu đơn hàng đã bán ra
SELECT * FROM Orders
SELECT COUNT(*) AS[no oders] FROM Orders 

--12.1 Nước Mỹ có bao nhiêu đơn hàng
SELECT  COUNT(*) AS[no oders] FROM Orders WHERE ShipCountry = 'USA'
--12.2 Mỹ Anh Pháp chiếm tổng cộng bao nhiêu đơn hàng
SELECT count(*) AS[no oders] from Orders WHERE ShipCountry IN ( 'USA','UK','France')
--12.3 Mỹ Anh Pháp mỗi quốc gia có bao nhiêu đơn hàng
SELECT ShipCountry,COUNT(*) AS[no oders] from Orders WHERE ShipCountry IN ( 'USA','UK','France') GROUP BY ShipCountry
--12.4 Trong 3 quốc gia, quốc gia nào có từ 100 trở lên  
SELECT ShipCountry,COUNT(*) AS[no oders] from Orders WHERE ShipCountry IN ( 'USA','UK','France') GROUP BY ShipCountry HAVING COUNT(*) >= 100


--BTVN
SELECT * FROM Orders
SELECT * FROM Products
SELECT * FROM Categories

--13 Đếm có bao nhiêu măt hàng có trong kho
SELECT COUNT(*) FROM Categories
--14.Đém có bao nhiêu lượt quốc gia đã mua hàng
SELECT COUNT(ShipCountry) FROM Orders 
--15 Đếm có bao nhiêu quốc gia đã mua hàng ( Mỗi quốc gia đếm 1 lần)
SELECT  COUNT(ShipCountry) FROM Orders 

--16 Đếm số lượng đơn hàng của mỗi quốc gia
--17 Quốc gia nào có từ 10 đơn hàng trở lên 
--18 Đếm xem mỗi chủng loại có bao nhiêu mặt hàng(bia rượu có 5sp, thủy sản 10 sp)
-- Trong 3 quốc gia Anh Pháp Mỹ quốc gia nào có nhiều đơn hàng hàng nhất
--19 Quốc gia nào có nhiều đơn hàng nhất 
--20. Thành phố nào có nhiều nhân viên nhất???
--


