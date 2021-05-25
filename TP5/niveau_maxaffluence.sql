CREATE PROCEDURE `sp_niveau_maxaffluence` ()
BEGIN
	 DECLARE v_nivid, v_pos INT;
     DECLARE v_nivlib VARCHAR(20);
     DECLARE v_res VARCHAR(20);
     DECLARE v_affluence INT;
     DECLARE flagNotFound BOOLEAN DEFAULT false;
     DECLARE fincurs1 BOOLEAN DEFAULT 0;
     DECLARE curs1 CURSOR FOR
		SELECT DISTINCT niv_id, niv_lib
        FROM niveau;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fincurs := 1;
    
    BEGIN
		DECLARE EXIT HANDLER FOR 1051 SET flagNotFound := true;
        DROP TABLE TMP_AFFLU_NIVEAU;
	END;
    
    CREATE TEMPORARY TABLE TMP_AFFLU_NIVEAU; #A FINIR
END
