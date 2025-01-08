--EXERCÍCIOS 

--1. Elabore uma função que, dado o id do empregado, retorne quantos empregados são mais antigos que ele na empresa.

CREATE OR REPLACE FUNCTION qtd_funcionarios_mais_velhos(
    empt_id employees.employee_id%TYPE)
RETURN NUMBER
IS
    qtd NUMBER;
BEGIN
    SELECT COUNT(*) INTO qtd FROM employees
        WHERE hire_date < 
            (SELECT hire_date FROM employees 
             WHERE employee_id = empt_id);
    
    RETURN qtd;
END;

-- TESTE
DECLARE
    empno Employees.employee_id%TYPE := &empno;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Quantidade de funcionários com mais tempo de empresa: ' || qtd_funcionarios_mais_velhos(empno));
END;

SELECT * FROM EMPLOYEES;





--2. 





-- 3. Elabore um procedimento para alterar o gerente de um departamento, passando o id do departamento e o id do empregado que será seu novo gerente.
-- -Faça tratamento de exceção para todos os parâmetros, ou seja, verifique se os valores informados
-- como parâmetros são válidos.
-- -Um empregado somente pode ser gerente do departamento ao qual pertence. Caso o empregado
-- pertença a outro departamento, exiba uma mensagem na tela dizendo que não é possível alterar o
-- gerente, pois ele deve pertencer ao mesmo departamento que gerencia.


CREATE OR REPLACE PROCEDURE alterando_gerente(
    dept_id departments.department_id%TYPE,
    empt_id employees.employee_id%TYPE)
IS
    dept_empt employees.department_id%TYPE;
BEGIN
    SELECT department_id INTO dept_empt FROM employees
    WHERE employee_id = empt_id;
    
    IF(dept_id = dept_empt) THEN
        UPDATE departments
        SET manager_id = empt_id
        WHERE department_id = dept_id;
    ELSE 
        DBMS_OUTPUT.PUT_LINE('O funcionário pertence a outro departamento');
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Departamento ou funcionário não encontrados');
    
END;


DROP PROCEDURE alterando_gerente;

-- TESTE 
EXEC alterando_gerente(90, 20);




