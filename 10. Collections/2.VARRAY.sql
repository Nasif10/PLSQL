SET SERVEROUTPUT ON;

--VARRAY

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry(NULL,NULL,NULL,NULL,NULL);
	
BEGIN
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr(i) := i*10;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/


--Add multiple elements using EXTEND(n)

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry();
	
BEGIN
	v_varr.EXTEND(5);
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr(i) := i*5;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/

--Alternative

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry();
	
BEGIN
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr.EXTEND;
	   v_varr(i) := i*5;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/


--VARRAY as Database object

CREATE OR REPLACE TYPE dbObj_vry IS VARRAY(5) OF NUMBER;
/
create table calendar(day_name varchar2(20), day_date dbObj_vry);
insert into calendar values('Saturday', dbObj_vry(7,14,21,28));

SELECT * FROM calendar;