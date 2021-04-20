CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `muller851u_appli`@`%` 
    SQL SECURITY DEFINER
VIEW `E306` AS
    SELECT 
        CONCAT(`ABONNE`.`abo_nom`,
                ' ',
                `ABONNE`.`abo_prn`) AS `identité`,
        COUNT(0) AS `nb abonnement`
    FROM
        (`ABONNE`
        JOIN `ABONNEMENT`)
    WHERE
        `ABONNEMENT`.`abo_id` = `ABONNE`.`abo_id`
    GROUP BY `ABONNE`.`abo_id`
    ORDER BY 2 DESC
    # 2 comme deuxième colonne