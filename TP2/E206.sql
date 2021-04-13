#E206 : L’utilisateur ‘fernand’ souhaite afficher la liste des tarifs horaires. Peut-il le faire ? Si non que faut-il faire ? Ecrire la ou les requêtes.

-- L'utilisateur fernand n'a pas les droits pour extraire les tarifs horaires

-- L'administrateur doit lui en donner les droits, au niveau de la table, avec la commande

GRANT SELECT(trfh_tarif)
ON TARIF_HORAIRE
TO 'fernand'

;

-- L'utilisateur fernand peut alors extraire les données

SELECT trfh_tarif
FROM TARIF_HORAIRE