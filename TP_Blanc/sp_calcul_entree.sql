CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_calcul_entree`(IN entid INT, OUT prix DOUBLE(4,2))
BEGIN
-- Ecrire la procédure sp_calcul_entree qui à partir d’un numéro d’une entrée, retourne le prix calculé du stationnement.*

	-- Déclaration des variables
    DECLARE jdeb, hdeb, jfin, hfin int;
    
    -- Récupérer la ligne associée au numéro d'entrée
    -- SELECT jour_in, heure_in, jour_out, heure_out
    -- FROM ENTREE
    -- WHERE ent_id = entid;
    
    
    -- On associe aux variables les valeurs associées par rapport au numéro 'entid' entré auparavant
    SET jdeb := 	
				(
					SELECT jour_in
					FROM ENTREE
					WHERE ent_id = entid
				);
    
    SET jfin := 
				(
					SELECT jour_out
					FROM ENTREE
					WHERE ent_id = entid
				);
    
    SET hdeb := 
				(
					SELECT heure_in
					FROM ENTREE
					WHERE ent_id = entid
				);
    
    SET hfin := 
				(
					SELECT heure_out
					FROM ENTREE
					WHERE ent_id = entid
				);
    
    -- Application de la procédure du calcul de prix
    CALL sp_calcul_prix(jdeb, hdeb, jfin, hfin, @prix);
END