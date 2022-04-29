SET SERVEROUTPUT ON;

--{BEFORE | AFTER}

CREATE OR REPLACE TRIGGER ai_emp 
AFTER INSERT ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted After');
END;
/

INSERT INTO emp VALUES(6,'F',160);


--BEFORE INSERT

CREATE OR REPLACE TRIGGER bi_emp
BEFORE INSERT ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted Before');
END;
/

INSERT INTO emp VALUES(7,'G',170);


--AFTER INSERT OR DELETE Trigger

CREATE OR REPLACE TRIGGER HELLO3 
AFTER INSERT OR DELETE 
ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted or Deleted');
END;
/

DELETE FROM emp WHERE id=1;
DELETE FROM emp WHERE id=2;
INSERT INTO emp VALUES(8,'H',180);


--AFTER UPDATE Trigger

CREATE OR REPLACE TRIGGER HELLO3 
AFTER UPDATE
ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('UPDATED');
END;
/

UPDATE emp SET salary = 140 where id=5;


--SPECIFIC ATTRIBUTE TRIGGER

CREATE OR REPLACE TRIGGER HELLO3 
AFTER UPDATE
OF salary
ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('SALARY UPDATED');
END;
/

UPDATE emp SET salary = 50 where id=1;