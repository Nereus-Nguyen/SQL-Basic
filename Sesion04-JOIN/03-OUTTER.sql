
--1. Liệt kê các cặp từ điển anh-việt 
SELECT * FROM EnDict e, VnDict v WHERE e.Numbr = v.Numbr -- co bang thi moi ghep
SELECT * FROM EnDict e INNER JOIN VnDict v ON e.Numbr = v.Numbr
SELECT * FROM EnDict e JOIN VnDict v ON e.Numbr = v.Numbr
--			3 câu tương đương nhau

--Hụt mất từ 4 - Four và 5 năm không thây xuat hien
-- Xuất hiện 4Four và 5 Năm --> Tích đề các
SELECT * FROM EnDict e, VnDict v

-- Lấy tiếng anh làm chuẩn tìm các nghĩa tiếng việt tưởng đương 
-- Nếu không tương đương vẫn phải hiện ra 
SELECT * FROM EnDict e LEFT JOIN VnDict v ON e.Numbr = v.Numbr
SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v ON e.Numbr = v.Numbr

--lấy tiếng việt làm móc ban đầu 
SELECT * FROM VnDict v RIGHT JOIN EnDict e ON e.Numbr = v.Numbr
SELECT * FROM VnDict v FULL JOIN EnDict e ON e.Numbr = v.Numbr -- ko quan trong thu tu

--Sau khi tìm ra được DATA chung riêng ta có quyền FILTER trên loại CELL nào đó WHERE như bình thường 
--6. In ra bộ từ điển Anh - Việt (Anh làm Chuẩn) của những con số từ 2 trở lên 
SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v ON e.Numbr = v.Numbr WHERE e.Numbr >=2
SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v ON e.Numbr = v.Numbr WHERE v.Numbr >=2
