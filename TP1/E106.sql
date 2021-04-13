SELECT CONCAT(
			  DATEDIFF(
						NOW(),
						STR_TO_DATE('23/09/2012','%d/%m/%Y')
					),
                        'jours')
                AS 'intervalle en jours',
                
                CONCAT(
						PERIOD_DIFF(
									DATE_FORMAT(
												NOW(),
                                                '%Y%m'
                                                ),
									'201209'
                                    ),
					'mois')
                    AS 'intervalle en mois'