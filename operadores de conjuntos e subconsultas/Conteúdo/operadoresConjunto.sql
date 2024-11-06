-- Operadores de conjunto são capazes de combinar resultados de mais de uma tabela em um mesmo select
-- são utéis para comparar, mesclar ou contrastar dados de diferentas tabelas ou conjunto de dados.

-- * NÚMERO DE COLUNAS DEVEM SER IGUAIS E CORRESPONDENTES 

--UNION
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 10
UNION
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 20;
    
-- Une os dados de ambas as tabelas consultadas tirando duplicatas 



--UNION ALL
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 10
UNION ALL
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 20;
    
-- Une os dados de ambas as tabelas consultadas com duplicatas (maior rendimento pois não precisa checar duplicatas)



--INTERSECT
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE salary > 10000
INTERSECT
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 80;

-- Retorna apenas as linhas que aparecem em ambas as tabelas 




--MINUS
SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE department_id = 80
MINUS
    SELECT employee_id, first_name, last_name 
    FROM employees 
    WHERE salary > 10000;
    
-- Retorna todo os funcionários menos os que são do departamento 80 e que tem salario maior que 10 mil



--QUANDO ALGUM DADO TIVER CHANCES DE VOLTAR NULO USAMOS O TO_CHAR PARA CONVERTE-LO EM UMA STRING VAZIA E GARANTIR PERISISTÊNCIA
SELECT TO_CHAR(manager_id) FROM employees
UNION
SELECT TO_CHAR(department_id) FROM departments;




