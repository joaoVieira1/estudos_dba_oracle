-- INTRODU��O JOINS

-- Estudo de caso, retorne o sobrenome do trabalhador e o nome de seu departamento.
-- como vamos fazer isso?? 
-- Sobrenome = tabela employees
-- Nome departamento = tabela departments

-- Ser� necess�ria a jun��o dessas duas tabelas
-- restringindo combina��es apenas necess�rias relacionando isso com as chaves estrangeiras
-- EXEMPLOS:

SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e, DEPARTMENTS d --para evitar nomes de atributos ambiguos, apelidamos DEPARTMENTS de d e EMPLOYEES de e.
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID; -- essas restri��es s�o feitas a partir da condi��o where, que ir� buscar dados que atendam 
                                         -- a especifica��o.
                                        
SELECT LAST_NAME FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.DEPARTMENT_NAME = 'Sales'; --mais de uma condi��o com operador AND 

SELECT DEPARTMENT_NAME AS DEPARTAMENTO, LAST_NAME AS GERENTE FROM DEPARTMENTS d, EMPLOYEES e
WHERE d.MANAGER_ID = e.EMPLOYEE_ID;

SELECT LAST_NAME, JOB_TITLE FROM EMPLOYEES e, JOBS j, DEPARTMENTS d
WHERE e.JOB_ID = j.JOB_ID
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.DEPARTMENT_NAME = 'Sales'; --n�o h� limites para as jun��es.

SELECT LAST_NAME, COUNTRY_NAME FROM EMPLOYEES e, COUNTRIES c, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID
AND l.COUNTRY_ID = c.COUNTRY_ID
AND c.COUNTRY_NAME LIKE '%United%'; --multiplas e multiplas tabelas


