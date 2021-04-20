#niv_lib (NIVEAU)
#Compter le nombre d'entrées pour chaque jour (ENTREE)
#ENTREE, NIVEAU : niv_id

#Resultat : total jour i >= total de chaque jour

#Une requete contenenat une sous requete avec utilisation de l'opérateur ALL

CREATE VIEW `E303` AS
SELECT DATE_FORMAT(
					MAKEDATE(
							YEAR(
								NOW()
                                ),
							jour_in
                            ),
					'%d/%m'
                    )
		AS date,
        niv_lib AS 'niveau',
        COUNT(*) AS 'affluence'
FROM NIVEAU, ENTREE
WHERE LOWER(niv_lib) = 'jaune'
#LOWER permet de mettre en minuscule
AND ENTREE.niv_id = NIVEAU.niv_id
GROUP BY NIVEAU.niv_id, jour_in
HAVING affluence >= ALL(
						SELECT COUNT(*)
                        FROM ENTREE, NIVEAU
                        WHERE LOWER(niv_lib) = 'jaune'
                        AND ENTREE.niv_id = NIVEAU.niv_id
                        GROUP BY NIVEAU.niv_id, jour_in
                        )