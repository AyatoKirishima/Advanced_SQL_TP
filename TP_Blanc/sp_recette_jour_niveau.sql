CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_recette_jour_niveau`(IN nojour INT, IN nivid INT, OUT recette DOUBLE(7,2))
BEGIN
-- Ecrire la procédure sp_recette_jour_niveau qui retourne la recette calculée d’un jour donné 
-- (jour_in dans la table ENTREE) pour un niveau.
	
    -- Déclaration des variables
    DECLARE jdeb, hdeb, jfin, hfin int;
    

    DECLARE i INT ;
	SET i=1;
	WHILE (i <= 10)
    -- On associe aux variables les valeurs associées par rapport au numéro 'entid' entré auparavant
    SET jdeb := 	
				(
					SELECT jour_in
					FROM ENTREE
					WHERE jour_in = nojour
                    AND niv_id = nivid
				);
    
    SET jfin := 
				(
					SELECT jour_out
					FROM ENTREE
					WHERE jour_in = nojour
                    AND niv_id = nivid
				);
    
    SET hdeb := 
				(
					SELECT heure_in
					FROM ENTREE
					WHERE jour_in = nojour
                    AND niv_id = nivid
				);
    
    SET hfin := 
				(
					SELECT heure_out
					FROM ENTREE
					WHERE jour_in = nojour
                    AND niv_id = nivid
				);
                
	-- Application de la procédure du calcul de prix
    CALL sp_calcul_prix(jdeb, hdeb, jfin, hfin, @prix);
    
    -- SET recette := recette + @prix;
    
    -- SELECT recette AS 'Recette';
END
-- CLOSE i;