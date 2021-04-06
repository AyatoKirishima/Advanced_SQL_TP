SELECT CONCAT(DATE_FORMAT(MAKEDATE(YEAR(NOW()),jour_in),'%d/%m'),
' à ',
DATE_FORMAT(SEC_TO_TIME(heure_in*60),'%Hh%i')) AS'Entrée',

CONCAT(DATE_FORMAT(MAKEDATE(YEAR(NOW()),jour_out),'%d/%m'),
' à ',
DATE_FORMAT(SEC_TO_TIME(heure_out*60),'%Hh%i')) AS'Sortie',

DATE_FORMAT(
			TIMEDIFF(
					ADDTIME(
							MAKEDATE(YEAR(NOW()),jour_out),
							SEC_TO_TIME(heure_out*60)
                            ),
					ADDTIME(
							MAKEDATE(YEAR(NOW()),jour_in),
							SEC_TO_TIME(heure_in*60)
                            )
					)
			,'%Hh%i'
            ) AS'Durée'

FROM ENTREE

WHERE DATE_FORMAT(MAKEDATE(YEAR(NOW()),jour_in),'%d/%m')='20/01'
		  
ORDER BY entrée DESC;
