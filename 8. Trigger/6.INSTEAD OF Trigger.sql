SET SERVEROUTPUT ON;

--INSTEAD OF trigger 

drop table emp_id;
drop table emp_name;
	
create table emp_id(id number);
create table emp_name(name varchar2(20));

insert into emp_id values(1);
insert into emp_name values('A');


CREATE VIEW emp_info AS
SELECT id, name FROM emp_id, emp_name;

SELECT * FROM emp_info;

-----------------------------------
DROP TRIGGER io_insert;

CREATE OR REPLACE TRIGGER io_insert 
INSTEAD OF INSERT ON emp_info
FOR EACH ROW

BEGIN
	INSERT INTO emp_id(id) VALUES (:NEW.id);
	INSERT INTO emp_name(name) VALUES (:NEW.name);
END;
/

--INSERT INTO emp_info VALUES(2, 'B');
--SELECT * FROM emp_info;
