CREATE DEFINER=`baggioko1u_appli`@`%` PROCEDURE `sp_calcul_entree`(IN entid INT, OUT prix DOUBLE)
BEGIN
	DECLARE id INT;
    DECLARE hdeb, hfin INT;
    DECLARE jdeb, jfin INT;
    DECLARE total DOUBLE;
    DECLARE duree INT;
    
    SET id := entid;
    
    SET hdeb := ( SELECT heure_in FROM ENTREE WHERE id = ent_id );
    
    SET hfin := ( SELECT heure_out FROM ENTREE WHERE id = ent_id );
    
    SET jdeb := ( SELECT jour_in FROM ENTREE WHERE id = ent_id );
    
    SET jfin := ( SELECT jour_out FROM ENTREE WHERE id = ent_id );
    
    
	CALL sp_calcul_prix(jdeb, hdeb, jfin, hfin, @prix);
    

END

##update : il marche pas :(
