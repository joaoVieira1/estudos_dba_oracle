--1:

CREATE OR REPLACE TRIGGER previnindo_salario_abaixo
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
DECLARE
    salario_minimo JOBS.MIN_SALARY%TYPE;
BEGIN

    SELECT min_salary INTO salario_minimo 
    FROM JOBS
    WHERE JOB_ID = :NEW.JOB_ID;
    
    IF :NEW.SALARY < salario_minimo THEN 
        RAISE_APPLICATION_ERROR(-20001, 'O sal�rio n�o pode ser menor que o sal�rio m�nimo definido para o cargo.');
    END IF;

END;

--2:

CREATE OR REPLACE TRIGGER trg_update_total_pay
BEFORE INSERT OR UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    -- Calcula a remunera��o total (sal�rio + comiss�o)
    IF :NEW.COMMISSION_PCT IS NOT NULL THEN
        :NEW.TOTAL_PAY := :NEW.SALARY + (:NEW.SALARY * :NEW.COMMISSION_PCT);
    ELSE
        :NEW.TOTAL_PAY := :NEW.SALARY; -- Caso a comiss�o seja NULL, considera apenas o sal�rio
    END IF;
END;

--3:

CREATE TABLE register_updates(
    user_id VARCHAR (30),
    updateData DATE
);

CREATE OR REPLACE TRIGGER register_updates_employees
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW 
BEGIN
    INSERT INTO register_updates(user_id, updateData)
    VALUES(USER, SYSDATE);
END;

--4:

CREATE OR REPLACE TRIGGER trg_check_department_transfer
AFTER INSERT ON JOB_HISTORY
FOR EACH ROW
DECLARE
    v_old_department_id JOB_HISTORY.DEPARTMENT_ID%TYPE;
    v_new_department_id JOB_HISTORY.DEPARTMENT_ID%TYPE := :NEW.DEPARTMENT_ID;
BEGIN
    -- Obt�m o �ltimo departamento registrado para o funcion�rio na tabela EMPLOYEES
    SELECT DEPARTMENT_ID
    INTO v_old_department_id
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = :NEW.EMPLOYEE_ID;

    -- Verifica se houve mudan�a de departamento
    IF v_old_department_id IS NOT NULL AND v_old_department_id <> v_new_department_id THEN
        -- Insere um registro na tabela DEPARTAMENTO_TRANSFERENCIA
        INSERT INTO DEPARTAMENTO_TRANSFERENCIA (
            EMPLOYEE_ID,
            OLD_DEPARTMENT_ID,
            NEW_DEPARTMENT_ID,
            TRANSFER_DATE
        ) VALUES (
            :NEW.EMPLOYEE_ID,
            v_old_department_id,
            v_new_department_id,
            SYSDATE
        );
    END IF;
END;

--5:

CREATE OR REPLACE TRIGGER trg_delete_country_locations
BEFORE DELETE ON COUNTRIES
FOR EACH ROW
BEGIN
    -- Excluir todas as localidades associadas ao pa�s que est� sendo deletado
    DELETE FROM LOCATIONS
    WHERE COUNTRY_ID = :OLD.COUNTRY_ID;
END;

