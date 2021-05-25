CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_fibonacci_exceptions`()
BEGIN
	DECLARE v_nmoins2 INT DEFAULT 0;
    DECLARE v_nmoins1 INT DEFAULT 1;
    DECLARE v_n INT DEFAULT 1;
    DECLARE i INT DEFAULT 0;
    
    DECLARE flagNotFound BOOLEAN DEFAULT false;
    BEGIN
		DECLARE EXIT HANDLER FOR 1051 SET flagNotFound := true;
        DROP TABLE TMP_FIBO;
	END;
    #Commenter le drop pour le premier lancement de la requete seulement
    DROP TABLE TMP_FIBO;
    
    CREATE TEMPORARY TABLE TMP_FIBO(indice INT, valeur INT);
    INSERT INTO TMP_FIBO VALUES(i,1);
    WHILE i<nombre DO
		SET i := i+1;
        SET v_n := v_nmoins1 + v_nmoins2;
        INSERT INTO TMP_FIBO VALUES(i,v_n);
        SET v_nmoins2 := v_nmoins1;
        SET v_nmoins1 := v_n;
	END WHILE;
    
SELECT 'Fin de la création' AS 'Résultat';
END