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
        RAISE_APPLICATION_ERROR(-20001, 'O salário não pode ser menor que o salário mínimo definido para o cargo.');
    END IF;

END;

--2:

CREATE OR REPLACE TRIGGER trg_update_total_pay
BEFORE INSERT OR UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    -- Calcula a remuneração total (salário + comissão)
    IF :NEW.COMMISSION_PCT IS NOT NULL THEN
        :NEW.TOTAL_PAY := :NEW.SALARY + (:NEW.SALARY * :NEW.COMMISSION_PCT);
    ELSE
        :NEW.TOTAL_PAY := :NEW.SALARY; -- Caso a comissão seja NULL, considera apenas o salário
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
    -- Obtém o último departamento registrado para o funcionário na tabela EMPLOYEES
    SELECT DEPARTMENT_ID
    INTO v_old_department_id
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = :NEW.EMPLOYEE_ID;

    -- Verifica se houve mudança de departamento
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
    -- Excluir todas as localidades associadas ao país que está sendo deletado
    DELETE FROM LOCATIONS
    WHERE COUNTRY_ID = :OLD.COUNTRY_ID;
END;

