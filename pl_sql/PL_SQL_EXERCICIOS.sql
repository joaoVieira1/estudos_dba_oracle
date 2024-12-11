SET SERVEROUT ON;

--1. Crie um bloco anônimo que exiba a mensagem "Olá, mundo!".
BEGIN
    dbms_output.put_line('Olá mundo!');
END;

--2. Crie um bloco anônimo que declare uma variável do tipo NUMBER e atribua o valor 10 a ela. Exiba o valor da variável.
DECLARE 
    numero NUMBER := 10;
BEGIN 
    dbms_output.put_line(numero);
END;

--3. Crie um bloco anônimo que declare duas variáveis do tipo NUMBER, atribua valores a elas e exiba a soma das variáveis.
DECLARE 
    numeroUm NUMBER := 10;
    numeroDois NUMBER := 5;
BEGIN 
    dbms_output.put_line(numeroUm + numeroDois);
END;

--4. Crie um bloco anônimo que declare uma variável do tipo VARCHAR2 e atribua o seu nome a ela. Exiba o valor da variável.
DECLARE
    meuNome VARCHAR(20) := 'João Pedro';
BEGIN
    dbms_output.put_line(meuNome);
END;

--5. Crie um bloco anônimo que declare uma variável do tipo DATE e atribua a data atual a ela. Exiba o valor da variável.
DECLARE 
    dataAtual DATE := SYSDATE();
BEGIN
    dbms_output.put_line(dataAtual);
END;

--6. Crie um bloco anônimo que use uma instrução IF para verificar se um número é positivo. Se for, exiba a mensagem "O número é positivo".
DECLARE 
    numero NUMBER := 0;
BEGIN 
    IF numero > 0 THEN
        dbms_output.put_line('O número é positivo');
    ELSIF numero < 0 THEN
        dbms_output.put_line('O número é negativo');
    ELSE
        dbms_output.put_line('0');
    END IF;
END;

--7. Crie um bloco anônimo que use uma instrução IF para verificar se um número é par. Se for, exiba a mensagem "O número é par".
DECLARE numero NUMBER := 7;
BEGIN 
    IF MOD(numero, 2) = 0 THEN 
        dbms_output.put_line('Número par');
    ELSE
        dbms_output.put_line('Número impar');
    END IF;
END;

--8. Crie um bloco anônimo que use uma instrução IF para verificar se uma string é igual a "SIM". Se for, exiba a mensagem "A string é igual a SIM"
DECLARE 
    texto VARCHAR(3) := 'SIM';
BEGIN 
    IF texto = 'SIM' THEN
        dbms_output.put_line('A string é igual a SIM');
    ELSE
        dbms_output.put_line('A string não é igual a SIM');
    END IF;
END;

--9. Crie um bloco anônimo que use uma instrução IF para verificar se uma data é anterior à data atual. Se for, exiba a mensagem "A data é anterior à data atual".
DECLARE 
    dataInput DATE := '27/11/2024';
BEGIN  
    IF dataInput < SYSDATE() THEN
        dbms_output.put_line('A data é anterior à data atual');
    ELSIF dataInput = SYSDATE() THEN
        dbms_output.put_line('A data é atual');
    ELSE 
        dbms_output.put_line('A data é superior à atual');
    END IF;
END;

--10. Crie um bloco anônimo que use uma instrução CASE para verificar o valor de uma variável e exibir uma mensagem diferente para cada valor.
DECLARE 
    numero NUMBER := 0;
BEGIN 
    CASE numero
        WHEN 0 THEN
            dbms_output.put_line('Numero 0');
        WHEN 1 THEN 
            dbms_output.put_line('Número 1');
        WHEN 2 THEN 
            dbms_output.put_line('Número 2');
        WHEN 3 THEN
            dbms_output.put_line('Número 3');
        ELSE
            dbms_output.put_line('null');
    END CASE;
END;

--11. Crie um bloco anônimo que use uma instrução CASE para verificar se um número é positivo, negativo ou zero.
DECLARE 
    numero NUMBER := 1;
    texto VARCHAR(20);
BEGIN 
    CASE 
        WHEN numero > 0 THEN
            texto := 'Positivo';
        WHEN numero < 0 THEN
            texto := 'Negativo';
        WHEN numero = 0 THEN
            texto := 'Zero';
        ELSE
            texto := 'null';
    END CASE;
    
    dbms_output.put_line(texto);
END;

--12. Crie um bloco anônimo que use uma instrução CASE para verificar se uma string é igual a "A", "B" ou "C".
DECLARE
    letra VARCHAR(1) := 'A';
    resposta VARCHAR(20);
BEGIN
    CASE 
        WHEN letra = 'A' THEN 
            resposta := 'É igual';
        WHEN letra = 'B' THEN
            resposta := 'É igual';
        WHEN letra = 'C' THEN
            resposta := 'É igual';
        ELSE
            resposta := 'Não é igual';
    END CASE;
    
    dbms_output.put_line(resposta);
END;

--13. Crie um bloco anônimo que use uma instrução CASE para verificar se uma data é um dia da semana, um fim de semana ou um feriado.
DECLARE
    v_data DATE := TO_DATE('2024-12-25', 'YYYY-MM-DD');  -- Data de exemplo
    v_dia_semana VARCHAR2(20);
    v_tipo_dia VARCHAR2(20);
BEGIN
    -- Verifica o dia da semana
    SELECT TO_CHAR(v_data, 'Day') INTO v_dia_semana FROM dual;
    
    -- Aplica a lógica usando o CASE
    v_tipo_dia := CASE 
                    WHEN TO_CHAR(v_data, 'DY') IN ('SAT', 'SUN') THEN 'Fim de semana'
                    WHEN v_data = TO_DATE('2024-12-25', 'YYYY-MM-DD') OR 
                         v_data = TO_DATE('2024-01-01', 'YYYY-MM-DD') THEN 'Feriado'
                    ELSE 'Dia da semana'
                  END;
    
    -- Exibe o resultado
    DBMS_OUTPUT.PUT_LINE('A data ' || TO_CHAR(v_data, 'YYYY-MM-DD') || ' é um(a): ' || v_tipo_dia);
END;

-- 14. Crie um bloco anônimo que use um loop simples para exibir os números de 1 a 10
DECLARE 
    CONT NUMBER := 1;
BEGIN 
    LOOP
        dbms_output.put_line(CONT);
        CONT := CONT + 1;
        EXIT WHEN CONT > 10;
    END LOOP;
END;

--15. Crie um bloco anônimo que use um loop simples para exibir os números pares de 1 a 20
DECLARE 
    CONT NUMBER := 1;
BEGIN 
    LOOP
        IF MOD(CONT, 2) = 0 THEN
            dbms_output.put_line(CONT);
        END IF;
        CONT := CONT + 1;
        EXIT WHEN CONT > 20;
    END LOOP;
END;

--16. Crie um bloco anônimo que use um loop simples para exibir as letras do alfabeto.
DECLARE 
    LETRA CHAR(1) := 'A';
BEGIN 
    LOOP
        dbms_output.put_line(LETRA);
        IF LETRA = 'Z' THEN
            EXIT;
        END IF;
        LETRA := CHR(ASCII(LETRA) + 1);
    END LOOP;
END;

--17. Crie um bloco anônimo que use um loop simples para exibir os nomes dos meses do ano
DECLARE 
    numero_mes NUMBER := 1;
    nome_mes VARCHAR(20);
BEGIN
    LOOP
        SELECT TO_CHAR(TO_DATE(numero_mes, 'MM'), 'MONTH')
        INTO nome_mes 
        FROM DUAL;
    
        dbms_output.put_line(nome_mes);
    
        numero_mes := numero_mes + 1;
        
        IF numero_mes > 12 THEN
            EXIT;
        END IF;
    END LOOP;
END;

--18. Crie um bloco anônimo que use um loop WHILE para exibir os números de 1 a 10.
DECLARE 
    CONT NUMBER := 1;
BEGIN 
    WHILE CONT < 11 LOOP
        dbms_output.put_line(CONT);
        CONT := CONT + 1;
    END LOOP;
END;

--19. Crie um bloco anônimo que use um loop WHILE para exibir os números ímpares de 1 a 20.
DECLARE 
    CONT NUMBER := 1;
BEGIN 
    WHILE CONT < 21 LOOP
        IF MOD(CONT, 2) != 0 THEN
            dbms_output.put_line(CONT);
        END IF;
        CONT := CONT + 1;
    END LOOP;
END;

--20. Crie um bloco anônimo que use um loop WHILE para exibir as letras do alfabeto em ordem inversa 
DECLARE 
    LETRA CHAR(1) := 'Z';
BEGIN 
    WHILE LETRA != 'A' LOOP
        dbms_output.put_line(LETRA);
        LETRA := CHR(ASCII(LETRA) - 1);
    END LOOP;
END;

--21. Crie um bloco anônimo que use um loop WHILE para exibir os nomes dos meses do ano em ordem inversa.
DECLARE 
    numero_mes NUMBER := 12;
    nome_mes VARCHAR(20);
BEGIN
    WHILE numero_mes > 0 LOOP
        SELECT TO_CHAR(TO_DATE(numero_mes, 'MM'), 'MONTH')
        INTO nome_mes 
        FROM DUAL;
    
        dbms_output.put_line(nome_mes);
    
        numero_mes := numero_mes - 1;
    END LOOP;
END;

--22. Crie um bloco anônimo que use um loop FOR para exibir os números de 1 a 10
DECLARE 
    INICIO_C NUMBER := 1;
    FINAL_C NUMBER := 10;
BEGIN
    FOR i IN INICIO_C..FINAL_C LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

--23. Crie um bloco anônimo que use um loop FOR para exibir os números pares de 1 a 20.
DECLARE 
    INICIO_C NUMBER := 1;
    FINAL_C NUMBER := 20;
BEGIN
    FOR i IN INICIO_C..FINAL_C LOOP
        IF MOD(i,2) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;

--24. Crie um bloco anônimo que use um loop FOR para exibir as letras do alfabeto.
DECLARE 
    INICIO_C NUMBER := 1;
    FINAL_C NUMBER := 26;
    LETRA CHAR(1);
BEGIN
    FOR i IN INICIO_C..FINAL_C LOOP
        dbms_output.put_line(LETRA);
        LETRA := ASCII(i);
    END LOOP;
END;

--25. Crie um bloco anônimo que use um loop FOR para exibir os nomes dos meses do ano.
DECLARE 
    INICIO NUMBER := 1;
    FINAL NUMBER := 12;
    nome_mes VARCHAR(20);
BEGIN
    FOR i IN INICIO..FINAL LOOP
        SELECT TO_CHAR(TO_DATE(i, 'MM'), 'MONTH')
        INTO nome_mes 
        FROM DUAL;
    
        dbms_output.put_line(nome_mes);
    END LOOP;
END;


