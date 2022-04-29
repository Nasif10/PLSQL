SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE TRIGGER FIX_NAME 
BEFORE INSERT OR UPDATE
ON APPS
FOR EACH ROW
DECLARE
    name VARCHAR2(20);
BEGIN
    :NEW.APP_NAME := UPPER(:NEW.APP_NAME);
END;
/