SELECT concat(ac.first_name,' ',ac.last_name) AS nome_completo --seleção da concatenação do primeiro e último nomes para trazer nome completo
	FROM actor ac
		LEFT JOIN film_actor fa 
		ON fa.actor_id = ac.actor_id

		LEFT JOIN film fm 
		ON fm.film_id = fa.film_id --join com a tabela de filmes para posterior filtro

WHERE fm.title in 
	(SELECT Titulo_filme from 
		(SELECT COUNT(RENTAL_ID) as Qtd_alugueis, FM.TITLE AS Titulo_filme 
			FROM RENTAL RT
				LEFT JOIN INVENTORY INV
				ON RT.INVENTORY_ID = INV.INVENTORY_ID

				LEFT JOIN FILM FM
				ON INV.FILM_ID = FM.FILM_ID

		GROUP BY Titulo_filme
		ORDER BY Qtd_alugueis DESC
		LIMIT 16)
	 as sub) --subqueries para filtrar os top 16 filmes mais alugados
GROUP BY nome_completo
ORDER BY count(concat(ac.first_name,' ',ac.last_name)) desc
LIMIT 1; -- encontrar o ator mais frequente