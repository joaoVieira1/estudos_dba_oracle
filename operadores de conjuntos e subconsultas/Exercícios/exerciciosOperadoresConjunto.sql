-- Exercício 1
SELECT first_name FROM EMPLOYEES e
    INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    INNER JOIN LOCATIONS l USING (location_id)
    INNER JOIN COUNTRIES c USING (country_id)
    WHERE c.country_name = 'United States of America'
INTERSECT
SELECT first_name FROM EMPLOYEES e
    INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    INNER JOIN LOCATIONS l USING (location_id)
    INNER JOIN COUNTRIES c USING (country_id)
    INNER JOIN JOB_HISTORY jh ON e.employee_id = jh.employee_id
    WHERE c.country_name = 'United States of America';

-- Exercício 2

-- Exercício 3
SELECT first_name, last_name 
    FROM EMPLOYEES e
UNION 
SELECT first_name, last_name
    FROM EMPLOYEES e
    INNER JOIN JOB_HISTORY jh 
    USING(EMPLOYEE_ID);
    
    
SELECT first_name, last_name 
    FROM EMPLOYEES e
UNION ALL
SELECT first_name, last_name
    FROM EMPLOYEES e
    INNER JOIN JOB_HISTORY jh 
    USING(EMPLOYEE_ID);
    
-- Exercício 4
SELECT first_name || ' ' || last_name as "NOME",
    CASE
        WHEN commission_pct IS NULL THEN 'Sem Comissão'
        WHEN commission_pct IS NOT NULL THEN TO_CHAR(e.commission_pct)
    END as "COMISSÕES"
    FROM EMPLOYEES e;
    

