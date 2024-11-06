--Exercício 1
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > 5000;

--Exercício 2
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > 8000 AND SALARY < 10000;

--Exercício 3
SELECT LAST_NAME, PHONE_NUMBER, EMAIL, JOB_TITLE FROM EMPLOYEES e
JOIN JOBS j ON e.JOB_ID = j.JOB_ID
WHERE j.JOB_TITLE = 'Programmer';

--Exercício 4
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES e
JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME = 'Marketing';

--Exercício 5
SELECT * FROM LOCATIONS l
JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
WHERE c.COUNTRY_NAME = 'Canada';

--Exercício 6
SELECT COUNTRY_NAME, REGION_NAME FROM COUNTRIES c
JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
WHERE r.REGION_NAME = 'Europe';

--Exercício 7
SELECT DEPARTMENT_NAME, LAST_NAME FROM DEPARTMENTS d
JOIN EMPLOYEES e ON e.EMPLOYEE_ID = d.MANAGER_ID;

--Exercício 8
SELECT DEPARTMENT_NAME, CITY FROM DEPARTMENTS d
JOIN LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID;

--Exercício 9 
SELECT DEPARTMENT_NAME, CITY, COUNTRY_NAME FROM DEPARTMENTS d
JOIN LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID
JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID;

--Exercício 10
SELECT DEPARTMENT_NAME, CITY, COUNTRY_NAME FROM DEPARTMENTS d
JOIN LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID
JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
WHERE c.COUNTRY_NAME LIKE '%United%';

--Exercício 11
SELECT FIRST_NAME, LAST_NAME, EMAIL, REGION_NAME FROM EMPLOYEES e
JOIN DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
JOIN LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID
JOIN COUNTRIES c ON c.COUNTRY_ID = l.COUNTRY_ID
JOIN REGIONS r ON r.REGION_ID = c.REGION_ID
WHERE r.REGION_NAME = 'Europe';

