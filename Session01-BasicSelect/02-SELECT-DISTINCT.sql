USE NORTHWND
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
-- Khi ta SELECT ít cột từ table gốc thì có nguy cơ dữ kiêu bị trùng lại
-- Không phải bị sai, không phải người thiết kế table và người nhập liệu bị sai
-- Do chung ta có nhiều INFO trùng nhau/ đặc điểm trùng nhau, nên nếu chỉ tập trung vào data
-- Trungf nhau là chắc chắc sảy ra 
--vd: 100 triệu người dân VN đc quản lí info bao gồm: ID, tên, DOB,...tỉnh thành sinh sống 
--														<>							63 tỉnh 
--														<>							63 tỉnh 
-- lệnh SELECT hổ trợ loại trừ dòng trùng nhau/ trùng 100%
-- SELECT DISTINCT Ten Cot FROM< Ten-Cot>
----------------------------------------------------------
--1. Liệt kê danh sách nhân viên
SELECT * FROM Employees
-- phân thích: 9 người nhưng chỉ có 4 title 
select TitleOfCourtesy from Employees
select DISTINCT EmployeeID ,TitleOfCourtesy from Employees
-- Neu DISTINCT đi kèm với ID/KEY --> nó vô dung, key sao mà trùng được mà loại trừ ?

--2. In ra thông tin khách hàng
SELECT * FROM Customers -- 92 rows
--.3 Có bao nhiêu quốc gia
SELECT DISTINCT Country  FROM Customers
