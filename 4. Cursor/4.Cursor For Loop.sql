SET SERVEROUTPUT ON;


DECLARE
  A  emp.id%TYPE;
  B  emp.salary%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM emp) 
	LOOP
		A := R.id;
		B := R.salary;
		DBMS_OUTPUT.PUT_LINE(A ||' '|| B);
	END LOOP;
END;
/

--Explicit

DECLARE
  CURSOR c_emp IS 
  SELECT * FROM emp;
  
BEGIN
	FOR R IN c_emp LOOP
		DBMS_OUTPUT.PUT_LINE(R.id ||''||R.name||' '|| R.salary);
	END LOOP;
END;
/


--with Parameters

DECLARE
  CURSOR c_emp(s emp.salary%TYPE) IS 
  SELECT * FROM emp WHERE salary < s;
  
BEGIN
	FOR R IN c_emp(130) LOOP
		DBMS_OUTPUT.PUT_LINE(R.id ||' '|| R.salary);
	END LOOP;
END;
/



DECLARE
  A emp.id%TYPE;
  B emp.salary%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM emp) LOOP
		A := R.id;
		B := R.salary;
		DBMS_OUTPUT.PUT_LINE(A ||' '|| B);
		
		IF MOD(B, 2) = 0 THEN
			DBMS_OUTPUT.PUT_LINE(B ||' = EVEN');
		ELSE
			DBMS_OUTPUT.PUT_LINE(B ||' = ODD');
		END IF;
	END LOOP;
END;
/