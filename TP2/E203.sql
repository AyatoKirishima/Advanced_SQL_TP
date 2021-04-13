#E203 : L’administrateur veut autoriser la modification des tarifs dans les tables TARIF_HORAIRE et TARIF_ABONNE à ‘fernand’

GRANT UPDATE(trfh_tarif)
ON TARIF_HORAIRE
TO 'fernand' -- impossible de faire en une seule requête
;
GRANT UPDATE(trfa_tarif)
ON TARIF_ABONNE
TO 'fernand' # deuxième partie