SET SERVEROUTPUT ON;

--Function

CREATE OR REPLACE FUNCTION sampleFunction
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello from FUNCTION');
	return 5; 
END sampleFunction;
/


--Calling a function

DECLARE
	NUM NUMBER;
BEGIN
	NUM:=sampleFunction;
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/
