CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_niveau_maxaffluence`(IN nivid INT, OUT resultat VARCHAR(20))
BEGIN
	DECLARE v_res VARCHAR(20) DEFAULT null;
    DECLARE niveauNotFound BOOLEAN DEFAULT false;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET niveauNotFound := true;
        
	SELECT CONCAT(
				  DATE_FORMAT(
							  MAKEDATE(
									   YEAR(
											NOW()
                                            ), jour_in
										),
                                            '%d/%m'
							), ':',
				COUNT(*)
				)
	INTO v_res
	FROM ENTREE
	WHERE niv_id = nivid
    GROUP BY jour_in
    HAVING COUNT(*) >= ALL((
							SELECT COUNT(*)
                            FROM ENTREE
                            WHERE niv_id = nivid
                            GROUP BY jour_in
                            ));
	SET RESULTAT := v_res;
    
    IF niveauNotFound THEN 
    SELECT CONCAT('Le niveau ', nivid, ' n\'existe pas !') AS erreur;
    END IF;
END