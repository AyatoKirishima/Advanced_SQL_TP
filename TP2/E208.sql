#E208 : L’utilisateur ‘fernand’ veut donner la possibilité à ‘Raoul’ d’extraire les numéros, noms et prénoms des abonnés de la table ABONNE. Peut-il le faire ? Si non que faut-il faire ? Ecrire la ou les requêtes.

-- L'utilisateur 'fernand' n'a pas les droits de rétrocession sur la table ABONNEE

-- L'administrateur doit lui ajouter ces droits sur les droits déjà définis à la requête E204

GRANT USAGE
ON ABONNE
TO 'fernand'
WITH GRANT OPTION
-- table level
;
GRANT SELECT(
			abo_id,
            abo_nom,
            abo_prn
            )
ON ABONNE
TO 'raoul';