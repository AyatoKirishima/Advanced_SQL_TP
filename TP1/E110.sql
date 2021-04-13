SELECT *
FROM ABONNE
WHERE LOCATE(
			'@gmail.com',
            abo_mel
            ) > 0