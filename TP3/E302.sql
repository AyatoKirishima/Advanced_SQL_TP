#Reflexion avant code:
#ABONNEMENT et ABONNE : abo_id
#ABONNEMENT et TARIF_ABONNE : trfa_id

#Expiration dans 2 mois :
#abo_debut + trfa_periode -1
# = mois(date du jour) +2

CREATE VIEW E302 AS
    SELECT 
        abo_num,
        abo_mel,
        CONCAT(abo_nom, ' ', abo_prn) AS 'identité',
        abo_tel AS 'téléphone',
        abo_mel AS 'mel'
    FROM
        ABONNEMENT,
        ABONNE,
        TARIF_ABONNE
    WHERE
        ABONNEMENT.abo_id = ABONNE.abo_id
            AND ABONNEMENT.trfa_id = TARIF_ABONNE.trfa_id
            AND abo_debut - 1 + trfa_periode = MONTH(NOW()) + 2