CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_abonne_annuel`(IN num INT, OUT abo_annuel BOOLEAN)
BEGIN
	DECLARE v_moisdeb, v_duree, v_moisfin INT DEFAULT 0;
    -- déclarer variable curseur
    DECLARE fincurs1 BOOLEAN DEFAULT 0;
    -- définition curseur
    DECLARE curs1 CURSOR FOR
		SELECT abo_debut, trfa_periode
        FROM ABONNEMENT ad, TARIF_ABONNE ta
        WHERE ta.trfa_id = ad.trfa_id
        AND abo_id = num
        ORDER BY abo_debut, trfa_periode;
	-- erreur sur curseur
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fincurs1 := 1;
    OPEN curs1;
		FETCH curs1 INTO v_moisdeb, v_duree;
        IF NOT fincurs1 THEN
			IF v_moisdeb = 1 THEN
				SET v_moisfin := v_moisdeb + v_duree;
				FETCH curs1 INTO v_moisdeb, v_duree;
			ELSE
				SET fincurs1 := 1;
		END IF;
	END IF;
    
    WHILE NOT fincurs1 AND v_moisfin>13 DO
		IF v_moisdeb > v_moisfin THEN
			SET fincurs1 := 1;
		ELSE IF (v_moisdeb + v_duree) > v_moisfin THEN
			SET v_moisfin := v_moisdeb + v_duree;
			END IF;
        END IF;
        FETCH curs1 INTO v_moisdeb, v_duree;
	END WHILE;
    CLOSE curs1;
END