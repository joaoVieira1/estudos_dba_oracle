-- Blocos de consulta
-- unidade b�sica: cont�m apenas um select, from, where...
-- v�rios blocos: subconsultas compara��es com conjuntos e consultas complexas, possuem mais de um select, where...

-- Subconsultas:
-- consultas aninhadas dentro de outra consulta.
-- � importante pensar e criarmos primeiro ela e dps a consulta principal.
-- muito utilizada para checar a cardinalidade e a exist�ncia de dados em conjuntos.
-- conjuntos s�o os valores gerados pela subconsulta.

-- Consultas complexas:
-- imposs�veis ou quase imposs�veis de se escrever com apenas um bloco de consulta.
-- usa uni�o, intersec��o ou diferen�a entre blocos.
-- possuem rela��es derivadas como lista de produtos renomeados e subconsulta especificada na clausula from
