SELECT CONCAT(
				COUNT(*)
                /
                (
                SELECT COUNT(*)
                FROM ENTREE
                WHERE DATE_FORMAT(
									MAKEDATE(
											YEAR(
												NOW()
                                                ),
											jour_in
                                            ),
									'%d/%m'
								)
						='24/03'
				)
		*100,
        '%'
        )
AS 'Entrées gratuites / Entrées'
FROM ENTREE, TARIF_HORAIRE
WHERE DATE_FORMAT(
					MAKEDATE(
							YEAR(
								NOW()
                                ),
							jour_in
                            ),
					'%d/%m'
				)
	 ='24/03'
AND trfh_tarif = 0
AND (jour_out*1440+heure_out-(jour_in*1440+heure_in))
	<= trfh_duree
                
                        