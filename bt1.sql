use quanlysinhvien;
/*Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.*/
select *
 from subject
 group by SubId
 having max(Credit) >= all (select max(Credit)from subject group by SubId);
/*Hiển thị các thông tin môn học có điểm thi lớn nhất.*/
SELECT Sub.SubID, Sub.SubName, M.mark
FROM subject Sub
JOIN mark M
ON Sub.SubID = M.SubID
WHERE M.mark = (
SELECT MAX(Mark)
FROM mark);
/*Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần*/
select S.StudentName, AVG(Mark)
FROM student S
JOIN mark M
ON S.StudentID = M.StudentID
group by StudentName
ORDER BY avg(Mark) DESC;