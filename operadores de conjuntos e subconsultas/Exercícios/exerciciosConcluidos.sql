-- Exerc�cio 1
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

-- Exerc�cio 2
SELECT DISTINCT c.country_name 
    FROM LOCATIONS l
    INNER JOIN COUNTRIES c USING(country_id)
    WHERE l.location_id IN (SELECT location_id FROM DEPARTMENTS) 
MINUS
SELECT c.country_name 
    FROM EMPLOYEES e
    INNER JOIN DEPARTMENTS d USING(department_id)
    INNER JOIN LOCATIONS l USING(location_id)
    INNER JOIN COUNTRIES c USING(country_id);

-- Exerc�cio 3
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
    
-- Exerc�cio 4
SELECT first_name || ' ' || last_name as "NOME",
    CASE
        WHEN commission_pct IS NULL THEN 'Sem Comiss�o'
        WHEN commission_pct IS NOT NULL THEN TO_CHAR(e.commission_pct)
    END as "COMISS�ES"
    FROM EMPLOYEES e;
    
-- Exerc�cio 5
SELECT first_name || ' ' || last_name AS "NOME_FUNCION�RIO", salary
    FROM EMPLOYEES e
    WHERE e.salary > (SELECT AVG(salary) 
                        FROM EMPLOYEES e
                        INNER JOIN DEPARTMENTS d USING(department_id)
                        WHERE d.department_name LIKE 'Sales');

-- Exerc�cio 6
SELECT DISTINCT department_name 
    FROM DEPARTMENTS d
    INNER JOIN EMPLOYEES e USING(department_id)
    WHERE e.SALARY > ANY (SELECT salary FROM EMPLOYEES e
                            WHERE e.salary > 10000);
    
-- Exerc�cio 7
SELECT first_name || ' ' || last_name AS "NOME_COMPLETO"
    FROM EMPLOYEES e 
    WHERE e.job_id = (SELECT job_id 
                        FROM EMPLOYEES e
                        WHERE e.first_name = 'Steven' AND e.last_name = 'King');

-- Exerc�cio 8 
SELECT first_name || ' ' || last_name AS "NOME_COMPLETO", hire_date
    FROM EMPLOYEES e
    WHERE e.hire_date < ALL (SELECT hire_date 
                                FROM EMPLOYEES e
                                INNER JOIN DEPARTMENTS d USING(department_id)
                                WHERE d.department_name = 'IT');

-- Exerc�cio 9 
-- ?

-- Exerc�cio 10 
-- ?

-- Exerc�cio 11
SELECT first_name || ' ' || last_name AS "NOME_COMPLETO", department_name, city 
    FROM EMPLOYEES e
    INNER JOIN DEPARTMENTS d USING(department_id)
    INNER JOIN locations l USING(location_id);

-- Exerc�cio 12
SELECT department_name, COUNT(employee_id) AS "FUNCION�RIOS"
    FROM DEPARTMENTS d
    LEFT JOIN EMPLOYEES e USING (department_id)
    GROUP BY(department_name);
    
-- Exerc�cio 13
SELECT first_name || ' ' || last_name AS "NOME_COMPLETO", job_title, department_name 
    FROM EMPLOYEES e
    FULL OUTER JOIN DEPARTMENTS d USING(department_id)
    INNER JOIN JOBS j USING(job_id);
