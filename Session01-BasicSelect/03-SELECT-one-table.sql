----------------------------------------------------------
-- Lí thuyết 
--Một DB là nơi chứa data (bán hàng, thư viện, qlsv,...)
-- Data được lưu dưới dạng table, tách thành nhiều TABLE (nghệ thuật design DB, NF)
--Dùng lệnh SELECT để xem/in dữ liệu từ table, cũng hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELET * FROM<TÊN-TABLE>
--                      * ĐẠI diện cho việc tui mún lấy all of columns
-- Cú pháp mở rộng:
--                      SELECT tên - các - cột - muốn - lấy, cách nhau - dấu - phẩy FROM <Tên - TABLE>
--                      SELECT có thể dùng các hàm xử lí các cột để độ lại thông tin hiển thị
--                         FROM <Tên - Table>

-- DATA trar veef có cell/ ô co null, hiểu rằng chưa xác định value/giá trị, chưa có ---> cập nhập sau
--ví dụ: Sinh viên kí tên vào danh sách thi, cột điểm ngay lúc kí tên gọi là NULL, mang trạng thái chưa xác định.
----------------------------------------------------------
--1. Xem thông tin tất cả các khách hàng đang giao dịch với mình
SELECT * FROM Customers
--INSERT INTO Customers (CustomerID,CompanyName,ContactName)
--VALUES('ALFKI', 'fpt UNIVERSITY','NGUYEN THANH NHAN') 
--LỖI trùng PK
INSERT INTO Customers (CustomerID,CompanyName,ContactName)
VALUES('FPTU', 'fpt UNIVERSITY','NGUYEN THANH NHAN') 

--2. Xem thông tin nhân viên, xem hết các cột luôn
SELECT *FROM Employees

--3. Xem sanr phẩm bán hàng trong kho 
SELECT *FROM Products

--4. Mua hang, thì thông tin sẽ nằm ở table Orthers và OrderDetails
SELECT * FROM Orders  -- 830 BILL

--5. xem cong ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName,Phone) VALUES ('FADEX VIETNAM','(084)90...')
--6. Xem chi tiết mua hàng
SELECT * FROM Orders		  -- Phần trên của bill siêu thị
SELECT * FROM [Order Details] -- Phần Table kẻ gióng lề những món hàng đã mua

--7. In ra thông tin khách hàng chỉ gồm các cột ID, CompanyName, ContractName, Country
SELECT CustomerID, CompanyName, ContactName, Country FROM Customers

--8. In ra thông tin nhân viên, chỉ cần ID, Last, First, Title, DOB
-- Tên người tách thành Last & First : dành cho mục tiêu sort theo tiêu chí nào đo
-- Tên theo quy ước quốc gia 
SELECT * FROM Employees
SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

--9. Ghép tên in ra thông tin nhân viên, tính tuổi (ghép cột)
SELECT EmployeeID, LastName +' '+  FirstName as [Full name], Title, BirthDate FROM Employees 
SELECT EmployeeID, LastName +' '+  FirstName as [Full name], Title, BirthDate, 
year(GETDATE()) - year(BirthDate) as Age FROM Employees 

--. In ra thông tin chi tiết đơn hàng 
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity FROM [Order Details]
-- Công thức tính tổng tiền có tính giảm phần trăm
-- SL * đơn giá - Giảm giá ==> Tiền trả
-- SL*DG -(SL*DG*GiamGia%) 
-- SL*DG(1-GiamGia) ==> Tiền trả
SELECT *, UnitPrice * Quantity*(1- Discount) as Toltal FROM [Order Details]
