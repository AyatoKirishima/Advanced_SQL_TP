#E205 : L’administrateur veut attribuer à l’utilisateur ‘fernand’ les droits d’extraction, d’insertion, modification, de données sur la table ENTREE avec la possibilité de retransmettre, pour ‘fernand’, les droits à d’autres utilisateurs

GRANT SELECT,
INSERT,
UPDATE
ON ENTREE
TO 'fernand'
WITH GRANT OPTION