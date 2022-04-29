SET SERVEROUTPUT ON;


DECLARE
   TYPE rv_emp IS RECORD (name VARCHAR2(20), salary emp.salary%TYPE);
   
   v_emp rv_emp;
BEGIN
	SELECT name, salary INTO v_emp.name, v_emp.salary FROM emp WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(v_emp.name||' '||v_emp.salary);
END;
/