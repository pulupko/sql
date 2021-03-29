#1
	a)
		SELECT f.name, IFNULL(p.phone, '-') FROM firm f
		LEFT JOIN phone p ON p.firm_id = f.id
		GROUP BY f.name
		ORDER BY p.phone DESC

	b)
		SELECT f.name FROM firm f
		LEFT JOIN phone p ON p.firm_id = f.id
		WHERE p.phone IS NULL
		GROUP BY f.name

	c)
		SELECT f.name FROM firm f
		LEFT JOIN phone p ON p.firm_id = f.id
		GROUP BY f.name
		HAVING COUNT(p.phone) >= 2

	d)	
		SELECT f.name FROM firm f
		LEFT JOIN phone p ON p.firm_id = f.id
		GROUP BY f.name
		HAVING COUNT(p.phone) < 2

	e) 
		SELECT f.name FROM firm f
		LEFT JOIN phone p ON p.firm_id = f.id
		GROUP BY f.name
		ORDER BY COUNT(p.phone) DESC
		LIMIT 1;

#2
	a)
		SELECT company.name, goods.name, SUM(shipment.quantity), max(shipment.shipdate)
		FROM company
		LEFT JOIN shipment ON company.id=shipment.company_id
		LEFT JOIN goods ON goods.id=shipment.good_id
		GROUP BY company.name, goods.name

	b) 	
		SELECT company.name, goods.name, case when SUM(shipment.quantity) = 0 then 'NO data'else SUM(shipment.quantity) end,max(shipment.shipdate)
		FROM company
		LEFT JOIN shipment ON company.id=shipment.company_id
		LEFT JOIN goods ON goods.id=shipment.good_id
		WHERE  shipment.shipdate < DATE(NOW() - INTERVAL 30 DAY)
		GROUP BY company.name, goods.name