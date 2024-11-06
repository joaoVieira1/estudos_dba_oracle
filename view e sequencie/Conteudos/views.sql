-- CRIANDO VIEWS

-- views são representações lógicas de tabelas já existentes, como máscaras dessas tabelas 
-- as tabelas nas quais as views se baseiam são chamadas de tabelas base
-- a view é nada mais nada menos do que um select

CREATE OR REPLACE VIEW view_employees -- (or replace) permite modificações na consulta
    AS SELECT employee_id,first_name, last_name, email
    FROM employees
    WHERE employee_id BETWEEN 100 and 200;

SELECT * FROM view_employees;

SELECT first_name FROM view_employees;

-- essa consulta retorna apenas os funcionários com id maior que 150 e menor que 201 pois é o que a VIEW delimita
SELECT employee_id, first_name
    FROM view_employees
    WHERE employee_id >= 150;
    
-- As views restringem o acesso a determinadas tabelas
-- podem diminuir complexidade de consultas
-- o usuário da view não sabe como ela é criada

-- Estabelecemos a regra de negócio já em uma view para ser possivelmente utilizada em determinada ocasião. (países europeus)
CREATE OR REPLACE VIEW countries_from_europe AS
SELECT country_id, region_id as "REGIÃO", country_name as "PAÍS" -- podemos renomear colunas com areas para os usuários utilizarem como se a view realmente fosse uma tabela
    FROM COUNTRIES c
    INNER JOIN REGIONS r USING (region_id)
    WHERE r.region_name LIKE 'Europe';
    
SELECT REGIÃO FROM countries_from_europe;

-- Assim como consultas existem views simples e complexas.