-- Blocos de consulta
-- unidade básica: contém apenas um select, from, where...
-- vários blocos: subconsultas comparações com conjuntos e consultas complexas, possuem mais de um select, where...

-- Subconsultas:
-- consultas aninhadas dentro de outra consulta.
-- é importante pensar e criarmos primeiro ela e dps a consulta principal.
-- muito utilizada para checar a cardinalidade e a existência de dados em conjuntos.
-- conjuntos são os valores gerados pela subconsulta.

-- Consultas complexas:
-- impossíveis ou quase impossíveis de se escrever com apenas um bloco de consulta.
-- usa união, intersecção ou diferença entre blocos.
-- possuem relações derivadas como lista de produtos renomeados e subconsulta especificada na clausula from
