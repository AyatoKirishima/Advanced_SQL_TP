CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_liste_abonne_annuel`()
BEGIN

DECLARE v_aboid INT;
DECLARE v_annuel BOOLEAN;
DECLARE v_ident VARCHAR(40);
DECLARE fincurs1 boolean default 0;
DECLARE flagNotFound BOOLEAN DEFAULT false;

/* Attention toutes les déclarations de variables doivent être placées avant la définition d'un curseur */
DECLARE curs1 cursor for
	SELECT DISTINCT abo_id, CONCAT(abo_nom,' ',abo_prn)
	FROM ABONNE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fincurs1=1;

BEGIN
	DECLARE EXIT HANDLER FOR 1051 SET flagNotFound := true;
    DROP TABLE TMP_ABOAN;
END;

CREATE TEMPORARY TABLE TMP_ABOAN (numéro INT, identité VARCHAR(40));
open curs1;
FETCH curs1 into v_aboid, v_ident;

WHILE not fincurs1 DO
	CALL sp_abonne_annuel(v_aboid, v_annuel);
    IF v_annuel THEN INSERT INTO TMP_ABOAN VALUES(v_aboid, v_ident);
    END IF;
	FETCH curs1 into v_aboid, v_ident;
END WHILE;
CLOSE curs1;
END