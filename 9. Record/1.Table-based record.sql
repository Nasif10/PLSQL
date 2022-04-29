SET SERVEROUTPUT ON;


DECLARE
	v_emp emp%ROWTYPE;
BEGIN
	SELECT * INTO v_emp FROM emp WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(v_emp.id||' '||v_emp.name||' '||v_emp.salary);
END;
/

--for selected column

DECLARE
	v_emp emp%ROWTYPE;
BEGIN
	SELECT name INTO v_emp.name FROM emp WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(v_emp.name);
END;
/