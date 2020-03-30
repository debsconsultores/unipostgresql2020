begin;
create table mitabla(n int);
insert into mitabla values(1);

savepoint s1;
insert into mitabla values(2);
insert into mitabla values(3);

rollback;


begin;
create table mitabla(n int);
insert into mitabla values(1);

savepoint s1;
insert into mitabla values(2);
insert into mitabla values(3);

rollback to s1;



begin;
insert into mitabla values(2);
savepoint s2;
insert into mitabla values(3);
select * from mitabla;
release savepoint s2;
rollback;

begin;
insert into mitabla values(2);
savepoint s2;
insert into mitabla values(3);
select * from mitabla;
commit to s1;