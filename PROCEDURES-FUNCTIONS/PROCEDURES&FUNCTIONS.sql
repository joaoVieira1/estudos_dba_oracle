-- PROCEDIMENTOS // PROCEDURES

SET SERVEROUTPUT ON;



--ADICIONANDO DEPARTAMENTO 
CREATE OR REPLACE PROCEDURE add_dpt
IS
    dept_id departments.department_id%TYPE;
    dept_name departments.department_name%TYPE;
BEGIN
    SELECT MAX(department_id) INTO dept_id FROM departments;
    
    dept_name := 'Novo departamento';
    
    INSERT INTO DEPARTMENTS (department_id, department_name)
    VALUES ((dept_id+1), dept_name);
    
    DBMS_OUTPUT.PUT_LINE('Inserida ' || SQL%ROWCOUNT || 'linha.');
END;

EXEC add_dpt;



--EXIBINDO NOME DE DEPARTAMENTO ESPECÍFICO 
CREATE OR REPLACE PROCEDURE exibir_nome_dept_240
IS
    dept_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO dept_name FROM departments
        WHERE department_id = 240;
        
    DBMS_OUTPUT.PUT_LINE('Nome do departamento 240: ' || dept_name);
END;

EXEC exibir_nome_dept_240;



--EXIBINDO NOME DE DEPARTAMENTO COM PARÂMETRO 
CREATE OR REPLACE PROCEDURE print_nome_dept(
    dept_id departments.department_id%TYPE)
IS
    dept_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO dept_name FROM departments 
        WHERE department_id = dept_id;
        
    DBMS_OUTPUT.PUT_LINE('Nome do departamento ' || dept_id || ': ' || dept_name);
END;
    
EXEC print_nome_dept(10);
    


--TESTANTO COMPORTAMENTOS IN, OUT E IN OUT
CREATE OR REPLACE PROCEDURE p (
    a INTEGER,
    b IN INTEGER,
    c OUT INTEGER,
    d IN OUT FLOAT) 
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Dentro do procedimento p:');
    DBMS_OUTPUT.PUT_LINE('IN a = ' || a);
    DBMS_OUTPUT.PUT_LINE('IN b = ' || b);
    DBMS_OUTPUT.PUT_LINE('OUT c = ' || c);
    DBMS_OUTPUT.PUT_LINE('IN OUT d = ' || d);
    
    c := a+b;
    d := a/b;
END;


DECLARE
    x INTEGER := 10;
    y INTEGER := 2;
    z INTEGER;
    w FLOAT := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('ANTES do procedimento p:');
    DBMS_OUTPUT.PUT_LINE('x = ' || x);
    DBMS_OUTPUT.PUT_LINE('y = ' || y);
    DBMS_OUTPUT.PUT_LINE('z = ' || z);
    DBMS_OUTPUT.PUT_LINE('w = ' || w);
    p(x,y,z,w);
    DBMS_OUTPUT.PUT_LINE('DEPOIS do procedimento p:');
    DBMS_OUTPUT.PUT_LINE('x = ' || x);
    DBMS_OUTPUT.PUT_LINE('y = ' || y);
    DBMS_OUTPUT.PUT_LINE('z = ' || z);
    DBMS_OUTPUT.PUT_LINE('w = ' || w);
END;




-- FUNÇÕES / FUNCTIONS

--CHECA SE O SALÁRIO É MAIOR OU MENOR QUE A MÉDIA
CREATE OR REPLACE FUNCTION check_sal(
    empno employees.employee_id%TYPE)
RETURN BOOLEAN 
IS
    dept_id employees.department_id%TYPE;
    sal employees.salary%TYPE;
    avg_sal employees.salary%TYPE;
BEGIN
    SELECT salary,department_id INTO sal, dept_id
    FROM employees WHERE employee_id = empno;
    
    SELECT AVG(salary) INTO avg_sal
    FROM employees WHERE department_id = dept_id;
    
    IF sal > avg_sal THEN
        RETURN TRUE;
    END IF;
    
    RETURN FALSE;
END;

--TESTANDO A FUNÇÃO 
BEGIN
    IF (check_sal(100)) THEN
        DBMS_OUTPUT.PUT_LINE('Salário > média');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salário < média');
    END IF;
END;



--RETORNA A QUANTIDADE DE FUNCIONÁRIOS COM SALÁRIO MAIOR QUE O DO FUNCIONÁRIO ESPECIFICADO NO ID
CREATE OR REPLACE FUNCTION qtd_salario_maior
    (empno employees.employee_id%TYPE)
RETURN NUMBER
IS
    qtd NUMBER;
BEGIN
    SELECT COUNT(*) INTO qtd FROM employees
        WHERE salary >
                (SELECT salary FROM employees
                 WHERE employee_id = empno);
                 
    RETURN qtd;
END;


















































    
    
    
    