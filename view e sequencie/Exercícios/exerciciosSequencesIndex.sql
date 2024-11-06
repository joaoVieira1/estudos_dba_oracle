-- EXERCÍCIOS SEQUENCE

-- Exercício 1 

CREATE SEQUENCE seq_funcionario
    INCREMENT BY 1
    START WITH 207
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;
    
SELECT seq_funcionario.nextval FROM dual;
    
-- Exercício 2

INSERT INTO copy_employees VALUES(seq_funcionario.currval, 'João', 'Vieira', 'JVIEIRA', '590.423.4571', TO_DATE('2008/11/27', 'yyyy/mm/dd'), 'IT_PROG', 10000, null, 103, 60);

SELECT * FROM copy_employees;

-- Exercício 3

CREATE INDEX index_last_name ON copy_employees(last_name);

-- Exercício 4

SELECT seq_funcionario.currval FROM dual;

-- Exercício 5

SELECT last_name FROM copy_employees
    WHERE department_id = 60;

-- a busca com index é mais rápida.

-- Exercício 6

CREATE SEQUENCE seq_departamento
    INCREMENT BY 10
    START WITH 300
    MAXVALUE 9990
    MINVALUE 10
    CACHE 20
    NOCYCLE;
    
-- Exercício 7 

INSERT INTO copy_departments VALUES (seq_departamento.nextval, 'Exemplo', null, 1700);

SELECT * FROM copy_departments;
SELECT seq_departamento.nextval FROM dual;
SELECT seq_departamento.currval FROM dual;

-- Exercício 8

DROP INDEX index_last_name;
