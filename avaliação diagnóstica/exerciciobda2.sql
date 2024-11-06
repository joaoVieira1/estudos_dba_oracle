CREATE DATABASE IF NOT EXISTS caixa;

USE caixa;

CREATE TABLE jogos(
	concurso INTEGER NOT NULL,
	dia DATE NOT NULL,
    numero_um INTEGER NOT NULL,
    numero_dois INTEGER NOT NULL,
    numero_tres INTEGER NOT NULL,
    numero_quatro INTEGER NOT NULL,
    numero_cinco INTEGER NOT NULL,
    numero_seis INTEGER NOT NULL,
	ganhadores INTEGER DEFAULT NULL,
    premio DECIMAL(20,2) DEFAULT NULL,
    apostas BIGINT NOT NULL,
	PRIMARY KEY (concurso)
);

INSERT INTO jogos VALUES (2577,'2023-03-25',12,18,22,31,44,50,NULL,NULL,22247684),
						   (2578,'2023-03-29',37,39,47,50,59,60,2,37457585.34,23458048),
                           (2745,'2024-07-04',2,5,7,11,52,57,3,54262775.07,25173694),
                           (2746,'2024-07-06',22,27,30,43,51,56,NULL,NULL,7706013),
                           (2763,'2024-08-17',15,16,19,43,44,49,NULL,NULL,13572200),
                           (2764,'2024-08-20',20,31,34,38,42,51,1,62156999.34,12482925),
                           (2765,'2024-08-22',8,12,34,39,43,47,NULL,NULL,8164980),
                           (2776,'2024-09-19',5,17,22,37,51,52,NULL,NULL,4967699),
                           (2777,'2024-09-21',2,13,21,38,42,52,NULL,NULL,6856866),
                           (2778,'2024-09-24',20,33,34,40,43,57,NULL,NULL,6545609);
                           
-- select que retorna apenas o jogos que tiveram no mínimo um ganhador 
SELECT concurso, ganhadores, premio, apostas 
	FROM jogos 
	WHERE ganhadores > 0;

-- select que retorna a maior e menor premiação dos jogos
SELECT MAX(premio) AS maior_premio, 
	MIN(premio) AS menor_premio 
	FROM jogos;

-- select que retorna o número de jogos que não tiveram ganhadores
SELECT COUNT(*) AS jogos_sem_ganhadores
	FROM jogos
	WHERE ganhadores IS NULL;

-- select que retorna a maior e menor numéro de apostas dos jogos
SELECT MAX(apostas) AS maior_numero_apostas, 
	MIN(apostas) AS menor_numero_apostas 
	FROM jogos;
