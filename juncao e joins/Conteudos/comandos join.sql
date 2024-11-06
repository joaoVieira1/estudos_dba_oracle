-- Comandos JOINS

-- TIPOS DE JOINS:

-- INNER JOIN:
-- Junção simples, compara a igualdade entre atributos chave primária e chave estrangeira
-- EXEMPLOS:

SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d -- junção simples de tabelas 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;  --comparando chave estrangeira com chave primária

SELECT LAST_NAME, JOB_TITLE, SALARY FROM EMPLOYEES e
INNER JOIN JOBS j 
ON e.JOB_ID = j.JOB_ID -- junção simples
WHERE e.SALARY > 5000
AND e.DEPARTMENT_ID > 50; -- condições where

SELECT FIRST_NAME, DEPARTMENT_NAME, CITY FROM EMPLOYEES e
    INNER JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    INNER JOIN LOCATIONS l
    ON l.LOCATION_ID = d.LOCATION_ID
ORDER BY DEPARTMENT_NAME, FIRST_NAME;

-- CLAUSULA USING, É UTILIZADA QUANDO O ATRIBUTO DE COMPARAÇÃO ON DO JOIN TEM O MESMO NOME
-- VAMOS MELHORAR O PRIMEIRO EXEMPLO
SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d
USING(DEPARTMENT_ID);

-- NATURAL JOIN:
-- Junta as tabelas considerando todas as colunas de ambas que possuem o mesmo nome e tipo de dado
-- ou seja, as chaves não precisarão ser declaradas pois obrigatoriamente no natural join
-- as colunas que irão ser consideradas para a junção precisam ter o mesmo nome
-- EXEMPLOS:

SELECT LAST_NAME, JOB_TITLE FROM EMPLOYEES e
NATURAL JOIN JOBS j;

SELECT DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME FROM DEPARTMENTS d
NATURAL JOIN LOCATIONS l
NATURAL JOIN COUNTRIES c
NATURAL JOIN REGIONS r;

SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e
NATURAL JOIN DEPARTMENTS d; -- essa consulta não está correta pois as tabelas possuem mais de uma coluna com nomes iguais

-- CROSS JOIN:
-- gera produto cartesiano
-- EXEMPLO:

SELECT C.COUNTRY_ID, R.REGION_ID
FROM COUNTRIES C
CROSS JOIN REGIONS R; -- combinações de cada região com todos os ids de country

--SELF JOIN:
--liga uma tabela a ela mesma
--EXEMPLO:

SELECT e.LAST_NAME, g.LAST_NAME FROM EMPLOYEES e
INNER JOIN EMPLOYEES g
ON e.MANAGER_ID = g.EMPLOYEE_ID;







