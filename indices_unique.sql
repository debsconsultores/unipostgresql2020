CREATE TABLE employee(
	employee_id serial not null primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email varchar(255) unique
)

select 
  tablename,
  indexname,
  indexdef
from pg_indexes
where tablename='employee'

ALTER TABLE EMPLOYEE ADD TELEFONO VARCHAR(20);
CREATE UNIQUE INDEX idx_emp_tel ON EMPLOYEE(TELEFONO)

INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Pedro','Perez','pedro@uni.edu.ni',22664532)
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Juan','Lopez','pedro@uni.edu.ni',22664532)  --FALLA
INSERT INTO EMPLOYEE (first_name,last_name,email,telefono) values ('Juan','Lopez','juan@uni.edu.ni',22664532)
