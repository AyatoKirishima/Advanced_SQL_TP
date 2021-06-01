CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_calcul_prix`(IN jdeb int, IN hdeb int, IN jfin int, IN hfin int, OUT prix DOUBLE(4,2))
BEGIN
	-- Déclaration des variables
	DECLARE duree DOUBLE;
    DECLARE dureeOver DOUBLE;
    DECLARE tarifHoraire DOUBLE;
    DECLARE tarifHoraireOver DOUBLE;
    
    -- Calcul de la durée de stationnement
    SET duree := ((jfin - jdeb) * 1440) - hdeb + hfin;
    
    -- Afficher la durée 
    SELECT duree;
    
    -- Avoir le prix de stationnement pour nb min > 1440
    IF (duree > 1440) 
    THEN
    SET dureeOver := duree DIV(1440);
    SET tarifHoraireOver := (
								SELECT MAX(trfh_tarif * dureeOver)
                                FROM TARIF_HORAIRE
							);
    SET duree := duree - (dureeOver*1440);
    
    -- SELECT tarifHoraireOver;
    ELSE     
    SET tarifHoraireOver := 0;
    END IF;
    
	-- Avoir le prix de stationnement pour nb min < 1440
    SET tarifHoraire := (
						SELECT MIN(trfh_tarif)
						FROM TARIF_HORAIRE
                        WHERE trfh_duree >= duree
                        );
                        
    -- SELECT tarifHoraire;                    
	SET tarifHoraire := tarifHoraire + tarifHoraireOver;
    
    -- Résultat
    SELECT tarifHoraire;
END