create database quanlydiemthi;
create table student(
studentID varchar(4) primary key not null,
studentName varchar(100) not null,
birthday date not null,
gender bit(1) not null,
address text not null,
phoneNumber varchar(45) unique
);

create table subject(
subjectID varchar(4) primary key not null,
subjectName varchar(45) not null,
priority int(11) not null
);

create table mark(
studentID varchar(4) not null,
subjectID varchar(4) not null,
point float(11) not null,
foreign key (subjectID) references subject(subjectID),
foreign key (studentID) references student(studentID),
primary key(subjectID,studentID)
);

insert into student values
("S001","Nguyễn Thế Anh","1999-1-11",1,"Hà Nội",984678082),
("S002","Đặng Bảo Trâm","1998-12-22",0,"Lào Cai",904982654),
("S003","Trần Hà Phương","2000-5-5",0,"Nghệ An",947645363),
("S004","Đỗ Tiến Mạnh","1999-3-26",1,"Hà Nội",983665353),
("S005","Phạm Duy Nhất","1998-10-4",1,"Tuyên Quang",987242678),
("S006","Mai Văn Thái","2002-6-22",1,"Nam Định",982654268),
("S007","Giang Gia Hân","1996-11-10",0,"Phú Thọ",982364753),
("S008","Nguyễn Ngọc Bảo My","1999-1-22",0,"Hà Nam",927867453),
("S009","Nguyễn Tiến Đạt","1998-8-7",1,"Tuyên Quang",989274673),
("S010","Nguyễn Thiều Quang","2000-9-18",1,"Hà Nội",984378291);

insert into subject values
("MH01","Toán",2),
("MH02","Vật Lý",2),
("MH03","Hóa Học",1),
("MH04","Ngữ Văn",1),
("MH05","Tiếng Anh",2);

insert into mark values 
("S001","MH01",8.5),("S001","MH02",7),("S001","MH03",8.5),("S001","MH04",9),("S001","MH05",5),
("S002","MH01",9),("S002","MH02",8),("S002","MH03",6.5),("S002","MH04",8),("S002","MH05",6),
("S003","MH01",7.5),("S003","MH02",6.5),("S003","MH03",8),("S003","MH04",7),("S003","MH05",7),
("S004","MH01",6),("S004","MH02",7),("S004","MH03",5),("S004","MH04",6.5),("S004","MH05",8),
("S005","MH01",5.5),("S005","MH02",8),("S005","MH03",7.5),("S005","MH04",8.5),("S005","MH05",9),
("S006","MH01",8),("S006","MH02",10),("S006","MH03",9),("S006","MH04",7.5),("S006","MH05",6.5),
("S007","MH01",9.5),("S007","MH02",9),("S007","MH03",6),("S007","MH04",9),("S007","MH05",4),
("S008","MH01",10),("S008","MH02",8.5),("S008","MH03",8.5),("S008","MH04",6),("S008","MH05",9.5),
("S009","MH01",7.5),("S009","MH02",7),("S009","MH03",9),("S009","MH04",5),("S009","MH05",10),
("S010","MH01",6.5),("S010","MH02",8),("S010","MH03",5.5),("S010","MH04",4),("S010","MH05",7);

-- 2. Cập nhật dữ liệu [10 điểm]:
-- - Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
update student set studentName = "Đỗ Đức Mạnh" where studentID = "S004";
-- - Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update subject set subjectName = "Ngoại Ngữ" where subjectID = "MH05";
update subject set priority = 1 where subjectID = "MH05";
-- - Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, 
-- MH05 : 9).
update mark  set point = 8.5 where studentID = "S009" and subjectID = "MH01";
update mark  set point = 7 where studentID = "S009" and subjectID = "MH02";
update mark  set point = 5.5 where studentID = "S009" and subjectID = "MH03";
update mark  set point = 6 where studentID = "S009" and subjectID = "MH04";
update mark  set point = 9 where studentID = "S009" and subjectID = "MH05";
-- 3. Xoá dữ liệu[10 điểm]:
-- - Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh 
-- này ở bảng STUDENT.
delete from mark where studentID = "S010";
delete from student where studentID = "S010";

-- Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
select studentId,studentName,birthday,
 case gender 
 when 1 then 'Nam'
 when 0 then 'Nữ'
 end as gender
 ,
address,
phoneNumber from STUDENT;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select subject.subjectName,subject.subjectID from subject
where subject.priority = 1;
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ 
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select student.studentID , student.studentName, (year(now()) - year(birthday)) as `Age`,  
case gender 
 when 1 then 'Nam'
 when 0 then 'Nữ'
 end as gender, address from student;
-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn 
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]
select student.studentName, subject.subjectName, mark.point from mark
join student on student.studentID = mark.studentID
join subject on subject.subjectID = mark.subjectID
group by student.studentID,subject.subjectID
having subject.subjectName = "Toán"
order by mark.point desc;
-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng). 
-- [4 điểm]
select if(gender=1,'Nam','Nữ') as gender, count(*) as count
        from STUDENT group by gender;
-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm 
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm
select STUDENT.studentId as studentID, STUDENT.studentName as studentName, sum(MARK.point) as Total, avg(MARK.point) as Avegare
		from STUDENT STUDENT
		join MARK on STUDENT.studentId = MARK.studentId group by STUDENT.studentId; 