-- Outer Join:
-- A principal diferen�a entre o outer e o join convencional
-- � que o Outer Join retorna tamb�m, linhas que n�o correspondem a determinada condi��o de jun��o
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