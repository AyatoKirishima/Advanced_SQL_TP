CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `muller851u_appli`@`%` 
    SQL SECURITY DEFINER
VIEW `E302` AS
    SELECT 
        `ABONNEMENT`.`abo_num` AS `abo_num`,
        CONCAT(`ABONNE`.`abo_nom`,
                ' ',
                `ABONNE`.`abo_prn`) AS `identité`,
        `ABONNE`.`abo_tel` AS `téléphone`,
        `ABONNE`.`abo_mel` AS `mel`
    FROM
        ((`ABONNEMENT`
        JOIN `ABONNE`)
        JOIN `TARIF_ABONNE`)
    WHERE
        `ABONNEMENT`.`abo_id` = `ABONNE`.`abo_id`
            AND `ABONNEMENT`.`trfa_id` = `TARIF_ABONNE`.`trfa_id`
            AND `ABONNEMENT`.`abo_debut` - 1 + `TARIF_ABONNE`.`trfa_periode` = MONTH(CURRENT_TIMESTAMP()) + 2