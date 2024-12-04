SET SERVEROUT ON;

--1. Inserir um novo departamento chamado 'Research' com ID 280 e localizado em 'Seattle'.
BEGIN
    INSERT INTO DEPARTMENTS
    VALUES (280, 'Research', 100, 1700);
END;

COMMIT;

--2. Criar uma nova localiza��o em 'S�o Paulo' com ID 3300.
BEGIN 
    INSERT INTO LOCATIONS
    VALUES (locations_seq.nextval, '1400 Avenida Brasil', '0100', 'S�o Paulo', 'S�o Paulo', 'BR');
END;

COMMIT;

--3. Remover o departamento 'Shipping'.
BEGIN
    DELETE FROM DEPARTMENTS 
    WHERE DEPARTMENT_NAME = 'Shipping';
END;

COMMIT;

--4. Atualizar o nome do cargo 'Programmer' para 'Software Engineer'.
BEGIN
    UPDATE JOBS
    SET JOB_TITLE = 'Software Engineer'
    WHERE JOB_TITLE = 'Programmer';
END;

COMMIT;

--5. Encontrar o sal�rio mais alto, o sal�rio mais baixo e a diferen�a entre eles
DECLARE
    max_salary NUMBER(8,2);
    min_salary NUMBER(8,2);
BEGIN
    SELECT MAX(SALARY), MIN(SALARY)
    INTO max_salary, min_salary
    FROM EMPLOYEES;
    
    dbms_output.put_line('Maior sal�rio: ' || max_salary || ' ' || 'Menor sal�rio: ' || min_salary);
END;

--6. Inserir um novo funcion�rio na tabela EMPLOYEES.
BEGIN
    INSERT INTO EMPLOYEES
    VALUES (employees_seq.nextval, 'Jo�o', 'Vieira', 'joaosv78', '510.124.5566', DATE '1983-10-01', 'IT_PROG', 10000, null, null, 60);
END;

COMMIT;

--7. Atualizar o sal�rio de um funcion�rio com base no seu ID
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = 50000
    WHERE EMPLOYEE_ID = 208;
END;

COMMIT;

--8. Remover um funcion�rio da tabela EMPLOYEES com base no seu ID.

BEGIN 
    DELETE FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 208;
END;

COMMIT;

