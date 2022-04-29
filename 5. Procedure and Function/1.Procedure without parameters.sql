SET SERVEROUTPUT ON;

--Procedure

CREATE OR REPLACE PROCEDURE sampleProcedure
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello world');

END sampleProcedure;
/


--Calling procedure from block

BEGIN
	sampleProcedure;
END;
/


--EXECUTE

EXEC sampleProcedure;



--PROCEDURE with variables

CREATE OR REPLACE PROCEDURE myproc

IS

A money.id%TYPE;
B money.taka%TYPE;
C money.taka%TYPE;

BEGIN
	C := 0;
	FOR R IN (SELECT * FROM money) LOOP
		A := R.id;
		B := R.taka;
		C := C + B;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(C);
END myproc;
/