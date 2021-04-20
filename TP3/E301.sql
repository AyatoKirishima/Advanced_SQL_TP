CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `muller851u_appli`@`%` 
    SQL SECURITY DEFINER
VIEW `E301` AS
    SELECT 
        `ABONNE`.`abo_id` AS `numéro`,
        CONCAT(`ABONNE`.`abo_nom`,
                ' ',
                `ABONNE`.`abo_prn`) AS `identité`
    FROM
        `ABONNE`
    ORDER BY `ABONNE`.`abo_id` DESC