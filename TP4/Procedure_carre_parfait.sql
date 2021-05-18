CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_carre_parfait`(IN nombre INT, OUT parfait BOOLEAN, OUT racine INT)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE v_res VARCHAR(80);
    IF nombre < 0
    THEN
		SET racine := 1;
		SET parfait := false;
		SET v_res := CONCAT('le nombre ',nombre,' est invalide. Le nombre doit être positif');
    ELSE
		WHILE (i*i < nombre) DO SET i := i+1;
        END WHILE;
        IF i*i = nombre
        THEN
			SET parfait := true;
            SET v_res := CONCAT(nombre,' est un carré parfait de racine');
		ELSE
			SET parfait := false;
            SET i := i-1;
            SET v_res := CONCAT(nombre,' n\'est pas un carré parfait, la racine immédiatement inférieure est');
       END IF;
       SET racine := i;
       SET v_res := CONCAT(v_res,' ',racine);
	END IF;
SELECT v_res AS résultat;
END