#E212 : L’administrateur veut retirer les droits sur la table ENTREE à ‘fernand’ 

REVOKE SELECT,
INSERT,
UPDATE ON ENTREE
FROM 'fernand'
-- ou
-- REVOKE ALL PRIVILEGES
-- ON ENTREE
-- FROM 'fernand'