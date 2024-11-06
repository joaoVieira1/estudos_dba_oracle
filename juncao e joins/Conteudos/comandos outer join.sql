-- Outer Join:
-- A principal diferença entre o outer e o join convencional
-- é que o Outer Join retorna também, linhas que não correspondem a determinada condição de junção
-- EXEMPLO:

SELECT *
FROM locations L left OUTER JOIN departments D
ON L.location_id = D.location_id
ORDER BY L.city;

--LEFT OUTER JOIN:
-- retorna todos os registros da tabela a esquerda do join e dps os correspondentes da direitas

--RIGHT OUTER JOIN:
-- retorna todos os registros da tabela a direita do join e dps os correspondentes da esquerda

--FULL OUTER JOIN:
-- mostra todos os valores quando tem correspondencia na tabela esquerda ou direita