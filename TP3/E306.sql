CREATE VIEW `E306` AS
SELECT CONCAT(
				abo_nom,
                ' ',
                abo_prn
			  ) 
              AS 'identité',
		COUNT(*)
        AS 'nb abonnement'
FROM ABONNE, ABONNEMENT
WHERE ABONNEMENT.abo_id = ABONNE.abo_id
GROUP BY ABONNE.abo_id
ORDER BY 2 DESC;