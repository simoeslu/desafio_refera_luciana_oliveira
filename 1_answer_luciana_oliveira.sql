SELECT COUNT(RT.RENTAL_ID) as Qtd_alugueis, --para retornar a quantidade de vezes de cada filme foi alugado 
FM.TITLE AS Titulo_filme
	FROM RENTAL RT

		LEFT JOIN INVENTORY INV --join intermediário com tabela de inventário 
		ON RT.INVENTORY_ID = INV.INVENTORY_ID

		LEFT JOIN FILM FM --join com a tabela que trará os nomes dos filmes
		ON INV.FILM_ID = FM.FILM_ID

GROUP BY Titulo_filme
ORDER BY Qtd_alugueis DESC --ordenação e posterior limitação para trazer os dois filmes mais alugados
LIMIT 2;
