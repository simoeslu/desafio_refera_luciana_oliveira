SELECT 
EXTRACT(month from primeiro_aluguel)as mes, 
COUNT(base.customer_id) as novos_clientes
	FROM
		(SELECT MIN(rental_date) as primeiro_aluguel, customer_id
			FROM rental		
		GROUP BY (customer_id)
		) base --subquery para filtrar datas do primeiro aluguel de cada cliente
GROUP BY mes
ORDER BY mes;