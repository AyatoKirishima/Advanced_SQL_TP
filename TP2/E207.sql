#E207 : L’utilisateur ‘fernand’ veut créer l’utilisateur ‘Raoul’. Peut-il le faire ? Si non que faut-il faire ? Ecrire la ou les requêtes.

-- L'utilisateur ferenand n'a pas les droits pour ajouter un ouvel utilisateur

-- L'administrateur doit lui en donner les droits, au niveau global du SGBD à l'aide de '*.*', avec la commande :

GRANT CREATE USER ON *.*
TO 'fernand' -- global level
;
-- L'utilisateur fernand peut alors créer l'utilisateur 'raoul' et pourra aussi le supprimer :

CREATE USER 'raoul'