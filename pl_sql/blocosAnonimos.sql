SET SERVEROUT ON;

--1. Inserir um novo departamento chamado 'Research' com ID 280 e localizado em 'Seattle'.
BEGIN
    INSERT INTO DEPARTMENTS
    VALUES (280, 'Research', 100, 1700);
END;

COMMIT;

--2. Criar uma nova localização em 'São Paulo' com ID 3300.
BEGIN 
    INSERT INTO LOCATIONS
    VALUES (locations_seq.nextval, '1400 Avenida Brasil', '0100', 'São Paulo', 'São Paulo', 'BR');
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

--5. Encontrar o salário mais alto, o salário mais baixo e a diferença entre eles
DECLARE
    max_salary NUMBER(8,2);
    min_salary NUMBER(8,2);
BEGIN
    SELECT MAX(SALARY), MIN(SALARY)
    INTO max_salary, min_salary
    FROM EMPLOYEES;
    
    dbms_output.put_line('Maior salário: ' || max_salary || ' ' || 'Menor salário: ' || min_salary);
END;

--6. Inserir um novo funcionário na tabela EMPLOYEES.
BEGIN
    INSERT INTO EMPLOYEES
    VALUES (employees_seq.nextval, 'João', 'Vieira', 'joaosv78', '510.124.5566', DATE '1983-10-01', 'IT_PROG', 10000, null, null, 60);
END;

COMMIT;

--7. Atualizar o salário de um funcionário com base no seu ID
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = 50000
    WHERE EMPLOYEE_ID = 208;
END;

COMMIT;

--8. Remover um funcionário da tabela EMPLOYEES com base no seu ID.

BEGIN 
    DELETE FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 208;
END;

COMMIT;

