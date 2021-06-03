CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_calcul_prix`(IN jdeb int, IN hdeb int, IN jfin int, IN hfin int, OUT prix DOUBLE(4,2))
BEGIN
-- Ecrire la procédure sp_calcul_prix qui à partir d’un jour et heure d’entrée et d’un jour et heure
-- de sortie du parking d’un véhicule, retourne le prix calculé correspondant à la durée de
-- stationnement. Attention les paramètres jfin et hfin peuvent être nuls

	-- Déclaration des variables
	DECLARE duree DOUBLE;
    DECLARE dureeOver DOUBLE;
    DECLARE tarifHoraire DOUBLE;
    DECLARE tarifHoraireOver DOUBLE;
    
    -- Calcul de la durée de stationnement
    SET duree := ((jfin - jdeb) * 1440) - hdeb + hfin;
    
    -- Afficher la durée 
    -- /!\ à commenter car non demandé !
    SELECT duree AS 'Durée';
    
    -- Avoir le prix de stationnement pour nb min > 1440
    IF (duree > 1440) 
    THEN
    
	-- On divise la durée totale par le nombre de min max (prix) ici 1440
    SET dureeOver := duree DIV(1440);
    
    -- On sélectionne le tarif associé : soit le maximum
    SET tarifHoraireOver := (
								SELECT MAX(trfh_tarif * dureeOver)
                                FROM TARIF_HORAIRE
							);
                            
	-- On associe le prix du temps passé au max et on passe au calcul du reste
    SET duree := duree - (dureeOver*1440);
    
    -- Sinon tarifHoraireOver n'a pas lieu d'exister
    ELSE     
    SET tarifHoraireOver := 0;
    END IF;
    
	-- Avoir le prix de stationnement pour nb min < 1440
    SET tarifHoraire := (
						SELECT MIN(trfh_tarif)
						FROM TARIF_HORAIRE
                        WHERE trfh_duree >= duree
                        -- Sélectionner le minimum de la colonne pour cette condition revient à choisir la première valeur
                        );
                        
    -- SELECT tarifHoraire;                    
	SET tarifHoraire := tarifHoraire + tarifHoraireOver;
    
    -- Résultat
    SELECT tarifHoraire AS Prix;
END