SET SERVEROUTPUT ON;

--Cursor Attributes
--SQL%FOUND

DECLARE   
   total_rows number(2);  
BEGIN  
   DELETE FROM EMP WHERE id = 3; 
     
   IF SQL%FOUND THEN 
		DBMS_OUTPUT.PUT_LINE('Employee deleted');
		INSERT INTO EMP VALUES(3,'C',140);
   END IF;   
END;  
/ 

SELECT * FROM EMP; 


--SQL%NOTFOUND, SQL%ROWCOUNT

DECLARE   
   total_rows number(2);  
BEGIN  
   UPDATE EMP SET salary = salary + 10 WHERE salary >= 130; 
   
   IF SQL%NOTFOUND THEN  
       DBMS_OUTPUT.PUT_LINE('No employee updated');  
   ELSIF SQL%FOUND THEN  
      total_rows := SQL%ROWCOUNT;  
      DBMS_OUTPUT.PUT_LINE( total_rows || ' EMPLOYEE UPDATED');  
   END IF;   
END;  
/ 

SELECT * FROM EMP; 