-- Exerc�cios VIEW

-- Criando c�pia da tabela employees

CREATE TABLE copy_employees AS (SELECT * FROM EMPLOYEES);

-- Exerc�cio 1

CREATE VIEW vw_empregados_info AS
SELECT first_name || ' ' || last_name as "FULL_NAME", job_id, salary
    FROM copy_employees;

SELECT * FROM vw_empregados_info;

-- Exerc�cio 2

CREATE VIEW vw_empregados_alta_renda AS 
SELECT employee_id, first_name || ' ' || last_name as "FULL_NAME", job_id, salary
    FROM copy_employees ce
    WHERE ce.salary > 10000;
    
SELECT * FROM vw_empregados_alta_renda;

-- Exerc�cio 3

CREATE VIEW vw_empregados_departamentos AS
SELECT first_name || ' ' || last_name as "FULL_NAME", department_name, city
    FROM copy_employees ce
    INNER JOIN DEPARTMENTS d USING (department_id)
    INNER JOIN LOCATIONS l USING (location_id);
    
SELECT * FROM vw_empregados_departamentos;
    
-- Exerc�cio 4

CREATE VIEW vw_salario_medio_departamento AS
SELECT department_name, AVG(salary) as "AVG_SALARY"
    FROM copy_employees ce 
    INNER JOIN DEPARTMENTS d USING(department_id)
    GROUP BY(department_name);
    
SELECT * FROM vw_salario_medio_departamento;
 
-- Exerc�cio 5

CREATE OR REPLACE VIEW vw_empregados_ti AS
    SELECT * FROM copy_employees
    WHERE department_id = 60
WITH CHECK OPTION
    CONSTRAINT view_empregados_ti_check;
    
SELECT * FROM vw_empregados_ti;

UPDATE vw_empregados_ti
SET department_id = 50
WHERE employee_id = 106;

-- Exerc�cio 6

CREATE OR REPLACE VIEW vw_empregados_rh AS
    SELECT * FROM copy_employees
    WHERE department_id = 40
WITH READ ONLY
    CONSTRAINT view_empregados_rh_read_only;

SELECT * FROM vw_empregados_rh;

UPDATE vw_empregados_rh
SET department_id = 60
WHERE employee_id = 203;

-- Exerc�cio 7

INSERT INTO vw_empregados_ti VALUES(108, 'Jo�o', 'Vieira', 'JVIEIRA', '590.423.4571', TO_DATE('2008/11/27', 'yyyy/mm/dd'), 'IT_PROG', 10000, null, 103, 60);

SELECT * FROM vw_empregados_ti;
SELECT * FROM copy_employees;

UPDATE vw_empregados_ti 
SET employee_id = 207
WHERE first_name LIKE 'Jo�o';

-- Exerc�cio 8 

UPDATE vw_empregados_ti
SET salary = salary + (0.1 * salary)
WHERE employee_id = 207;

SELECT * FROM vw_empregados_ti;

-- Exerc�cio 9

DELETE FROM vw_empregados_ti
WHERE employee_id = 207;

SELECT * FROM vw_empregados_ti;

-- Exerc�cio 10

UPDATE vw_empregados_ti
SET job_id = 'AD_VP'
WHERE employee_id = 107;

SELECT * FROM vw_empregados_ti;

-- A modifica��o foi poss�vel pois n�o infringiu a clausula WHERE, gerando uma inconsist�ncia de dados
    
    
    