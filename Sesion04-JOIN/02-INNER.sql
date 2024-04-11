SELECT * FROM VnDict, EnDict -- tich de cac
SELECT * FROM VnDict CROSS JOIN EnDict --tich de cac

SELECT * FROM VnDict vn, EnDict en WHERE vn.Numbr = en.Numbr

--CHUẨN THẾ GIỚI 
SELECT * FROM VnDict INNER JOIN EnDict ON VnDict.Numbr = EnDict.Numbr -- ghép có tương quan bên trong 
SELECT * FROM VnDict JOIN EnDict ON VnDict.Numbr = EnDict.Numbr -- ghép có tương quan bên trong 