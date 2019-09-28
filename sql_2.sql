ALTER TABLE auth_user MODIFY user_id int(64) NOT NULL;
ALTER TABLE salary ADD dept varchar(63) NULL;


select * from user u
join auth_user au on u.id = au.user_id
union
select * from user u
join auth_user au on u.id = au.user_id

select last_name, first_name, login from user u
join auth_user au on u.id = au.user_id

select * from user u
left join auth_user au on u.id = au.user_id

select * from user u
right join auth_user au on u.phone = au.login

# full join
select * from user u
left join auth_user au on u.id = au.user_id
union
select * from user u
right join auth_user au on u.id = au.user_id

select * from salary


select dept, avg(money) from salary group by dept;
select dept, max(money) from salary group by dept
select dept, min(money) from salary group by dept
select dept, sum(money) from salary where money > 10 group by dept
select dept, min(money) as mm from salary group by dept
having mm < 20 and dept = 'dev'
select dept, avg(money) mm from salary group by dept having mm > 50

select count(*) from user u
left join auth_user au on u.id = au.user_id where login is null

select login from (
select login, count(u.phone) as cnt from user u
left join auth_user au on u.id = au.user_id
group by  login
having cnt > 1) as tt;

select * from user order by id  limit 1
select * from user limit 1 offset 0
select * from user limit 1 offset 2
select * from user limit 2 offset 1;


-- page
set @var =10;
select * from user order by id desc limit 10 offset 10*(var-1);
