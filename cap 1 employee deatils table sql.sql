
create table employee_details(employee_ID int,
First_name varchar(50),
Last_name varchar(50),
salary int not null ,
JoiningDate datetime,
Department varchar (50),
Gender varchar (50))

insert into employee_details values (1,'Vikash','Ahlawat',600000,'2/12/2013 11:16', 'IT','male')
insert into employee_details values (2,'Nikita','Jain',530000,'2/14/2013 11:16','HR','female')
insert into employee_details values(3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','male')
insert into employee_details values(4,'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','male')
insert into employee_details values(5,'Anish','Kadian',500000,'2/16/2013 11:16','Paroll','male')

select *from employee_details

select first_name from employee_details
select upper(first_name) from employee_details;
select CONCAT(first_name,last_name)as name from employee_details
select *from employee_details where First_name ='vikash';
select *from employee_details where First_name like 'a%'
select *from employee_details where First_name like '%h'
select *from employee_details where First_name like '[a-p]%'
select *from employee_details where First_name like '[^a-p]%'
select *from employee_details where gender like '__le'
select *from employee_details where First_name like 'a____'
select *from employee_details where First_name like' %' as 'vik%'
select department,count(*) as department_count from employee_details
group by Department
having count (*)=1
select distinct (department) from employee_details
select max(salary) from employee_details
select min(salary)from employee_details
select joiningdate from employee_details
select CONVERT(varchar(20),joiningdate,106) from employee_details
select CONVERT(varchar(20),joiningdate,111) from employee_details
select date (joiningdate) from employee_details;
select CONVERT(varchar(20),joiningdate,108) from employee_details
select datepart(year,joiningdate) from employee_details
select datepart(MONTH,joiningdate) from employee_details
select getdate()
select GETUTCDATE()
select first_name,getdate(),joiningdate,
DATEDIFF(mm,joiningdate,GETDATE()) as [totalmonth] from employee_details
select first_name,getdate(),joiningdate,
DATEDIFF(Day,joiningdate,GETDATE()) as [totalday] from employee_details
select *from employee_details where YEAR(joiningdate)= 2013
select *from employee_details where month(joiningdate)= 1
select count(*) from employee_details

select *from  employee_details
select top 1 *from employee_details
select *from employee_details where First_name in ('vikash','ashish','nikhil')
select *from employee_details where First_name not in ('vikash','ashish','nikhil')
select rtrim (first_name)as [first_name] from [employee_details]
select ltrim (first_name)as [first_name] from [employee_details]
select first_name,case  when gender='male'then 'm'
when gender='female'then 'f'
end as[gender] from employee_details
select first_name ='hello'+ First_name from employee_details
select *from employee_details where salary >600000
select *from employee_details where salary <700000
select *from employee_details where salary between 500000and 600000
 
 create table projectdetail (projectdetailID int not null,employeedetailsID int not null,projectname varchar(70))
 insert into projectdetail values(1,1,'task track')
  insert into projectdetail values(2,1,'clp')
   insert into projectdetail values(3,1,'survey management')
    insert into projectdetail values(4,2,'HR management')
	 insert into projectdetail values(5,3,'task track')
	  insert into projectdetail values(6,3,'GRS')
	   insert into projectdetail values(7,3,'DDS')
	    insert into projectdetail values(8,4,'HR management')
		 insert into projectdetail values(9,6,'GL management')
		 select *from projectdetail
		 select department ,sum(salary) as [total salary] from employee_details group by Department
		 select department ,sum(salary) as [total salary] from employee_details group by Department order by sum(salary)asc
		 select department ,sum(salary) as [total salary] from employee_details group by Department order by sum(salary)desc
		 select department,count(*) as[dept counts],sum(salary)as [total salay] from employee_details group by Department
		 select department ,avg(salary)as[average salary]from employee_details group by Department order by avg(salary)
		 	 select department ,MAX(salary)as[MAXIMUM salary]from employee_details group by Department order by MAX(salary)
			  	 select department ,MIN(salary)as[Minimum salary]from employee_details group by Department order by Min(salary)
				 select *from employee_details
				 select * from projectdetail
				 select employee_details.employee_ID,employee_details.First_name,projectdetail.projectdetailID from employee_details
				 inner join projectdetail on projectdetail.projectdetailID=employee_details.employee_ID;
				 select first_name ,projectname from [employee_details]a inner join [projectdetail]b on a.employee_ID=b.employeedetailsID
				 order by First_name
				  select first_name ,projectname from [employee_details]a left outer join  [projectdetail]b on a.employee_ID=b.employeedetailsID
				 order by First_name
				 select first_name ,isnull(projectname,'-no assigned project') from [employee_details]a left outer join [projectdetail]b on a.employee_ID=
				 b.employeedetailsID
				 order by First_name

				 select first_name ,projectname from[employee_details]A right outer join [projectdetail]B on A.employee_ID=B.employeedetailsID 
				 order by First_name
				 select first_name, projectname from[employee_details]A  full outer join [projectdetail]B on A.employee_ID=B.employeedetailsID
				 order by First_name
				SELECT employee_ID,first_name ,projectname from[employee_details]C inner join [projectdetail]D on C.employee_ID=D.employeedetailsID
				where employee_ID in (select employeedetailsID from[projectdetail]group by employeedetailsID
				having count(*)>1)
				select first_name,projectname from [employee_details]A inner join [projectdetail]B on A.employee_ID=B.employeedetailsID
				select *from employee_details cross join projectdetail;