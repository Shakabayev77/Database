create database transaction;
create user2 password 'kbtu';
create tables students(id integer, name varchar(30));
select into students values(23, 'Asan'), (12, 'Zhake');
grant select, update, insert on students to user2;

--user1
begin transaction isolation level serializable;
insert into students values(1, 'Eldar'),(2, 'Tomas');
update students set id=id+1 where name='Tomas';
commit;

--user2
begin transaction isolation level repeatable read;
insert into students values(4, 'OOP'),(5, 'DB');
delete from students where name='Asan';
commit;

--user1
begin transaction isolation level read commited
delete from students where id=12;
update students set id=id+8 where name='Asan';
commit;

--user2
begin transaction isolation level serializable;
insert into students values(7, 'Aliya'),(8, 'Tommy');
update students set id=id+1 where name='Asan';
commit;