use SEDCHome

--1. Declare scalar variable
declare @FirstName nvarchar(50)
set @FirstName = 'Antonio'

select * from Student
where FirstName = @FirstName

--2. Declare table variable
go
declare @FemaleStudents table (
ID int,
FirstName nvarchar(50),
LastName nvarchar(50),
DateOfBirth date
)
insert into @FemaleStudents (Student.ID, Student.FirstName, Student.LastName, Student.DateOfBirth)
select ID, FirstName, LastName, DateOfBirth
from Student
where Gender = 'F'
select * from @FemaleStudents
delete from @FemaleStudents

-- 3. Declare temp table 

create table #TempTable (
LastName nvarchar(50),
EnrolledDate date
)
insert into #TempTable(LastName, EnrolledDate)
select LastName, EnrolledDate
from Student
where Gender = 'M' and FirstName like 'A%'

select
*
from #TempTable
where len(LastName) = 7

--4. Find all teachers 

select * from Teacher
where len(FirstName) < 5 and left(FirstName, 3) = left(LastName, 3)





