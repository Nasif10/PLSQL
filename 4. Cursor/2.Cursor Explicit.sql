SET SERVEROUTPUT ON;

--Explicit Cursors

DECLARE  
   i emp.id%TYPE;  
   n emp.name%TYPE;  
   s emp.salary%TYPE;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp WHERE id = 1;
   
BEGIN  
   OPEN c_emp;    
      FETCH c_emp into i,n,s;  	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);    
   CLOSE c_emp;  
END;  
/

--FOR MULTIPLE ROW

DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp;
   
BEGIN  
   OPEN c_emp;  
   LOOP  
      FETCH c_emp into i,n,s;  
      EXIT WHEN c_emp%notfound;
	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/


DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp WHERE salary < 130;
   
BEGIN  
   OPEN c_emp;  
   LOOP  
      FETCH c_emp into i,n,s;  
      EXIT WHEN c_emp%notfound;
	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/    