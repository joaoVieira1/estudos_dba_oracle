CREATE TABLE copy_employees AS SELECT * FROM EMPLOYEES;

CREATE OR REPLACE VIEW view_dept50
AS SELECT department_id, employee_id,first_name, last_name, salary
    FROM copy_employees
    WHERE department_id = 50
WITH CHECK OPTION
    CONSTRAINT view_dept50_check; -- não permite que a clausula where da view seja violada ou modificada (constraint nomeia a clausula)


UPDATE view_dept50 -- esse update não é permitido pois viola a regra de negócio where da view em questão
SET department_id = 90
WHERE employee_id = 125;



CREATE OR REPLACE VIEW view_dept50
AS SELECT department_id, employee_id,first_name, last_name, salary
    FROM copy_employees
    WHERE department_id = 50
WITH READ ONLY
    CONSTRAINT view_dept50_check; -- não permite nenhuma modificação na view 


UPDATE view_dept50 -- esse update gera um comando dml logo não é permitido
SET first_name = 'João Vieira'
WHERE employee_id = 125;



SELECT e.last_name, e.salary, e.department_id, d.maxsal
    FROM view_dept50 e,
        (SELECT department_id, max(salary) maxsal
            FROM employees
            GROUP BY department_id) d
    WHERE e.department_id = d.department_id
    AND e.salary = d.maxsal;