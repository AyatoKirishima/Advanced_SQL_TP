#E204 : L’administrateur veut autoriser l’extraction des données d’un abonné, sauf le numéro de téléphone, à ‘fernand’

GRANT
SELECT(
		abo_id,
        abo_nom,
        abo_prn,
        abo_mel
        )
ON ABONNE
TO 'fernand';