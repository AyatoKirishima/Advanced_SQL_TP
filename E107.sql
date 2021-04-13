SELECT CONCAT(
				DATE_FORMAT(
							MAKEDATE(
									YEAR(
										NOW()
                                        ), jour_in
									),
							'%d/%m'
							),
				'à',
                DATE_FORMAT(
							SEC_TO_TIME(
										heure_in*60
                                        ),
							'%Hh%i'
                            )
                )
				AS 'entrée',
		CONCAT(
				DATE_FORMAT(
							MAKEDATE(
									YEAR(
										NOW()
										),
									jour_out
                                    ),
							'%d/%m'
                            ),
				'à',
                DATE_FORMAT(
							SEC_TO_TIME(
										heure_out*60
                                        ),
							'%Hh%i'
                            )
				)
				AS 'sortie'
                
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
AND trfh_tarif=0
AND (
	jour_out*1440+heure_out-(jour_in*1440+heure_in)
    )
    <= trfh_duree
ORDER BY entrée


									
                                        