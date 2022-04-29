SET SERVEROUTPUT ON;
SET VERIFY OFF;

--CONTINUE statement

BEGIN
  FOR i IN 1 .. 10
  
  LOOP
     IF MOD(i,2) = 1 THEN
        CONTINUE;
     END IF;
     DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;
/


BEGIN
  FOR i IN 1 .. 10
  
  LOOP
    CONTINUE
    WHEN MOD(i,2) = 0;
    DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;