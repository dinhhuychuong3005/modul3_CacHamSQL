use quanlysinhvien;
/*Hiển thị số lượng sinh viên ở từng nơi*/
select Address,COUNT(StudentId) AS 'Số lượng học viên'
from student
group by Address;
/*Tính điểm trung bình các môn học của mỗi học viên*/
select S.StudentId,S.StudentName, AVG(Mark)
from student s join Mark M on s.StudentId = M.StudentId
group by s.StudentId,s.StudentName;
/*Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15*/
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15;
/*Hiển thị thông tin các học viên có điểm trung bình lớn nhất*/
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);