#E209 : L’utilisateur ‘Raoul’ a été créé. L’utilisateur ‘fernand’ veut donner la possibilité à ‘Raoul’ d’extraire les données de la table ENTREE. Peut-il le faire ? Si non que faut-il faire ? Ecrire la ou les requêtes. 

-- L'utilisateur possède déjà les droits

GRANT SELECT		-- table level
ON ENTREE
TO 'raoul'