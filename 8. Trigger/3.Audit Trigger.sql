SET SERVEROUTPUT ON;

--AUDIT USER

CREATE OR REPLACE TRIGGER ubi_emp
BEFORE INSERT ON emp

DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	DBMS_OUTPUT.PUT_LINE('Inserted by '||v_user);
END;
/

INSERT INTO emp VALUES(6,'F',160);


--AUDIT ACTIVITIES

CREATE OR REPLACE TRIGGER bidu_emp
BEFORE INSERT OR DELETE OR UPDATE 
ON emp

DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	
	IF INSERTING THEN
		DBMS_OUTPUT.PUT_LINE('Row Inserted by '||v_user);
	ELSIF DELETING THEN
		DBMS_OUTPUT.PUT_LINE('Row Deleted by '||v_user);	
	ELSIF UPDATING THEN
		DBMS_OUTPUT.PUT_LINE('Row Updated by '||v_user);
	END IF;		
END;
/

INSERT INTO emp VALUES(6,'F',160);
DELETE FROM emp WHERE id = 1;
UPDATE emp SET name = 'X' WHERE id = 4;


--AUDIT SPECIFIC ATTRIBUTE

DROP TABLE emp_audit;
CREATE TABLE emp_audit(id number, name varchar2(20), salary number);

CREATE OR REPLACE TRIGGER emp_audit 
BEFORE UPDATE 
OF salary
ON emp
FOR EACH ROW
DECLARE
	A emp.id%TYPE;
	B emp.name%TYPE;
	C emp.salary%TYPE;
BEGIN
	A := :OLD.ID;
	B := :OLD.NAME;
	C := :OLD.salary;
	INSERT INTO emp_audit VALUES(A, B, C);
END;
/

UPDATE emp SET salary = 200 WHERE ID = 1;

SELECT * FROM emp;
SELECT * FROM emp_audit;

