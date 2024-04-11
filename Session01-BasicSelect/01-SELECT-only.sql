USE NORTHWND -- chọn để chơi với thùng chứa data nào đó 
             -- tại 1 thời điểm chơi với 1 thùng chứa data

SELECT * FROM Customers

SELECT * FROM Employees
----------------------------------------------------------
-- Lí thuyết 
-- 1. DBE cung cấp câu lânhj SELECT dùng để 
-- in ra màng hình 1 cái gì đó ~~ printf() sout()
-- in ra dữ liệu có trong table (hàng, cột) !!!!!!!!!
-- dùng cho mục đích nào thì kết quả hiển thị luôn là table
----------------------------------------------------------
-- THỰC HÀNH 
-- 1. Hôm nay là ngày bao nhiêu
SELECT GETDATE ()

SELECT GETDATE () AS [hôm nay là ngày]

--2. Hôm nay là tháng mấy rồi hỡi em?
SELECT YEAR(GETDATE ()) AS[BÂY GIỜ NĂM MẤY]

SELECT MONTH(GETDATE ()) AS[BÂY GIỜ THÁNG MẤY]

--3. Trị tuyệt đối của -5 là mấy?
SELECT ABS(-5) AS[KÊT QUẢ TRỊ TUYỆT ĐỐI]

--4. 5+5 BẰNG MẤY ? 
SELECT 5 + 5 AS[5+5 BẰNG ]
--5. In ra tên của mình
select N'Nguyễn Thanh Nhàn'as[My name is]
select N'Nguyễn Thanh Nhàn '+ N'Diệu Vy' as[My name is]

--6. tính tuổi
select year(getdate())-2004
--select N'Nguyễn' + N'Thanh Nhàn' + (year(getdate())-2004) + 'year old'
-- lỗi không đồng nhất kiểu dữ liệu

select N'Nguyễn' + N'Thanh Nhàn ' + convert(varchar, year(getdate()) -2004) + ' year old' as[my profile]

select N'Nguyễn' + N'Thanh Nhàn ' + cast(year(getdate()) -2004 as varchar) + ' year old' as MyProfile

--7. phép nhân hai số 
SELECT 10*10 as [10x10= ]
