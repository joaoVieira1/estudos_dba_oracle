-- Podemos criar uma sequencia para delimitar e especificar o comportamento de dados como id's em tabelas

CREATE SEQUENCE runner_id_seq
    INCREMENT BY 10
    START WITH 100
    MAXVALUE 50000
    NOCACHE -- não pega lixo da memória cache
    NOCYCLE; -- quando chegar em 5000 o ciclo não volta para o 10, se encerra
    
ALTER SEQUENCE runner_id_seq --permite alterações com algumas restrições que não comprometam os números já gerados
    INCREMENT BY 10
    MAXVALUE 50000
    NOCACHE
    NOCYCLE;

CREATE TABLE atleta (
    id_atleta INT PRIMARY KEY,
    nome VARCHAR(30)
);

INSERT INTO atleta VALUES (runner_id_seq.nextval, 'Carlos');
INSERT INTO atleta VALUES (runner_id_seq.nextval, 'Joana');

SELECT * FROM atleta;

SELECT runner_id_seq.currval from dual; --ultimo valor gerado
SELECT runner_id_seq.nextval from dual; --próximo valor gerado

SELECT sequence_name, min_value, max_value, increment_by, last_number FROM runner_id_seq; -- consultando uma sequencia