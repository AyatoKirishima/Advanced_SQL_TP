CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_caisse_market`(IN ACHAT int, IN REGLEMENT int)
BEGIN
	#Déclaration des variables
	DECLARE v_monnaie, v_b10, v_b5, v_pc2, v_pc1 INT DEFAULT 0;
    DECLARE v_rendu VARCHAR(80) DEFAULT '';
	
    #cas 1&2
    IF ACHAT < REGLEMENT
    THEN
		SET v_monnaie := (REGLEMENT-ACHAT);
		SET v_b10 := v_monnaie DIV 10; 
        IF v_b10 > 0
        THEN 
			SET v_rendu := CONCAT(v_rendu, v_b10, ' billet');
            IF v_b10 > 1
            THEN
            SET v_rendu := CONCAT(v_rendu,'s');
		END IF;
        SET v_rendu := CONCAT(v_rendu,' de 10€, ');
		END IF;
    
    
		SET v_monnaie := v_monnaie - (v_b10 * 10);
		SET v_b5 := v_monnaie DIV 5; 
        IF v_b5 > 0
        THEN 
			SET v_rendu := CONCAT(v_rendu, v_b10, ' billet');
            IF v_b5 > 1
            THEN
            SET v_rendu := CONCAT(v_rendu,'s');
			END IF;
        SET v_rendu := CONCAT(v_rendu,' de 5€, ');
		END IF;
    
    
		SET v_monnaie := (v_monnaie - (v_b10 * 10)) - (v_b5 * 5);
		SET v_pc2 := v_monnaie DIV 2; 
        IF v_pc2 > 0
        THEN 
			SET v_rendu := CONCAT(v_rendu, v_b10, ' pièce');
            IF v_pc2 > 1
            THEN
            SET v_rendu := CONCAT(v_rendu,'s');
			END IF;
			SET v_rendu := CONCAT(v_rendu,' de 2€, ');
		END IF;
    
    
		SET v_monnaie := ((v_monnaie - (v_b10 * 10)) - (v_b5 * 5)) - (v_pc2 * 2);
		SET v_pc1 := v_monnaie; 
        IF v_pc1 > 0
        THEN 
			SET v_rendu := CONCAT(v_rendu, v_b10, ' pièce');
            IF v_pc1 > 1
            THEN
				SET v_rendu := CONCAT(v_rendu,'s');
			END IF;
			SET v_rendu := CONCAT(v_rendu,' de 1€, ');
		END IF;
    
    #cas 3
    ELSEIF ACHAT > REGLEMENT 
    THEN 
        SET v_b10 := NULL; #NULL = 0 <> String !!
		SET v_b5 := NULL;
        SET v_pc2 := NULL;
        SET v_pc1 := NULL;
        SET v_rendu := "Vous n'avez pas assez d'argent, vous déposez vos achats et vous partez";
	
    ELSE
        SET v_rendu := "Le compte est bon";
    END IF;
    
    SELECT v_b10 AS 'Billets de 10', 
    v_b5 AS 'Billets de 5',
    v_pc2 AS 'Pièces de 2',
    v_pc1 AS 'Pièces de 1',
    v_rendu AS 'Rendu';
END