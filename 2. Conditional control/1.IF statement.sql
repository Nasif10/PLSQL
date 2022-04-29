SET SERVEROUTPUT ON;

--IF THEN

DECLARE
	v_num INT := 5;
	
BEGIN
	IF v_num < 10 THEN
		DBMS_OUTPUT.PUT_LINE('LESS THAN 10');
	END IF;
	DBMS_OUTPUT.PUT_LINE('OUTSIDE IF');
END;
/

-------

DECLARE
	NUM int:=6;
	
BEGIN
	IF MOD(NUM,2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('EVEN');
	END IF;
	
END;
/


--IF-ELSE

DECLARE
	NUM int:=5; 
	
BEGIN
	IF MOD(NUM,2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('EVEN');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('ODD');
	END IF;
	
END;
/

-------

DECLARE
	NUM int:=10; 
	
BEGIN
	IF NUM < 0 AND NUM > 10 THEN
		DBMS_OUTPUT.PUT_LINE('IN RANGE');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('NOT IN RANGE');
	END IF;
	
END;
/


--IF-ELSIF-ELSE

DECLARE
	NUM int:=5;
	
BEGIN
	IF MOD(NUM,3) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('ZERO');
	ELSIF MOD(NUM,3) = 1 THEN
		DBMS_OUTPUT.PUT_LINE('ONE');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('TWO');
	END IF;
	
END;
/


--CONDITIONAL ALONG WITH DATABASE

DECLARE
	NUM emp.salary%TYPE; 
	
BEGIN
	SELECT salary INTO NUM FROM emp WHERE id = 1;
	
	IF MOD(NUM,3) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('ZERO');
	ELSIF MOD(NUM,3) = 1 THEN
		DBMS_OUTPUT.PUT_LINE('ONE');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('TWO');
	END IF;
	
END;
/


--Nested IF

DECLARE
	NUM int:=15;
	
BEGIN
	IF (NUM > 10) THEN	
		IF MOD(NUM,2) = 0 THEN
			DBMS_OUTPUT.PUT_LINE('ABOVE 10 and EVEN');
		ELSE 
			DBMS_OUTPUT.PUT_LINE('ABOVE 10 and ODD');	
		END IF;
	ELSE 
		DBMS_OUTPUT.PUT_LINE('BELOW 10');
	END IF;
	
END;
/