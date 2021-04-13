SELECT *
FROM ABONNE
WHERE LEFT(
			abo_tel,2
		  )
		  IN
		  (
            '06',
            '07'
		   )