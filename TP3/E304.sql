CREATE VIEW `E304` AS
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
WHERE ENTREE.niv_id = NIVEAU.niv_id
GROUP BY NIVEAU.niv_id, jour_in
HAVING affluence >= ALL(
						SELECT COUNT(*)
                        FROM ENTREE
                        GROUP BY niv_id, jour_in
                        )