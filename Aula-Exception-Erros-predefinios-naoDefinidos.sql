--1
declare
    v_deptid departments.department_id%type:=500;
    v_deptname departments.department_name%type;
begin
   select department_name
   into   v_deptname 
   from departments
   where department_id=v_deptid;
end;
/

declare
    v_deptid departments.department_id%type:=500;
    v_deptname departments.department_name%type;
begin
   select department_name
   into   v_deptname 
   from departments
   where department_id=v_deptid;
exception
   when no_data_found then
        dbms_output.put_line('Departamento não existe');
end;
/
--2
BEGIN
    INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME)
    VALUES (1000,NULL);
    COMMIT;
END;
/


DECLARE 
    E_INS EXCEPTION;
    PRAGMA EXCEPTION_INIT(E_INS,-1400);
BEGIN
    INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME)
    VALUES (1000,NULL);
    COMMIT;
EXCEPTION
    WHEN E_INS THEN
        DBMS_OUTPUT.PUT_LINE('INFORME O NOME DO DEPTO');
END;
/
--3
DECLARE
    V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE:=500;
    V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE:='TESTE';
BEGIN
    UPDATE DEPARTMENTS
    SET    DEPARTMENT_NAME=V_DEPT_NAME
    WHERE  DEPARTMENT_ID=V_DEPT_ID;
    COMMIT;
END;
/


DECLARE
    V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE:=500;
    V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE:='TESTE';
    E_UPDATE EXCEPTION;
BEGIN
    UPDATE DEPARTMENTS
    SET    DEPARTMENT_NAME=V_DEPT_NAME
    WHERE  DEPARTMENT_ID=V_DEPT_ID;
    IF SQL%NOTFOUND THEN
        RAISE E_UPDATE;
    END IF;
    COMMIT;
EXCEPTION
    WHEN E_UPDATE THEN
        DBMS_OUTPUT.PUT_LINE('Depto não existe!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro genérico!');
END;
/