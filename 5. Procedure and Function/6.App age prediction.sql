SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE APPS;
CREATE TABLE APPS(APP_ID number, APP_NAME VARCHAR2(20), RELEASE_DATE DATE);

insert into APPS values(1,'SKYPE',    '29-AUG-2003');
insert into APPS values(2,'ZOOM',     '21-APR-2011');
insert into APPS values(3,'MESSENGER','9-AUG-2011');
insert into APPS values(4,'WHATSAPP', '24-FEB-2009');
insert into APPS values(5,'SIGNAL',   '29-JUL-2014');

COMMIT;
SELECT * FROM APPS;

CREATE OR REPLACE PROCEDURE FIND_APPS(AppID IN APPS.APP_ID%TYPE)
IS
    
    CAL_YER INT;
    RELEASE_DATE APPS.RELEASE_DATE%TYPE;
    
BEGIN
    SELECT RELEASE_DATE INTO RELEASE_DATE FROM APPS WHERE APP_ID = AppID;
        
    CAL_YER := (SYSDATE - RELEASE_DATE) / 365;
         
    IF CAL_YER > 12 THEN
        DBMS_OUTPUT.PUT_LINE('MORE THAN 12 YEARS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOT MORE THAN 12 YEARS');
    END IF;
        
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('MULTIPLE ROWS RETURNED');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHERS ERROR');
		
END FIND_APPS;
/


EXEC FIND_APPS(3);