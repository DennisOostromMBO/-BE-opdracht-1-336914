-- Selecteer de juiste database voor je stored procedure
USE jamin;

-- Verwijder de oude stored procedure
DROP PROCEDURE IF EXISTS spGetAllLeverantie;

-- Verander even tijdelijk de opdrachtprompt naar //
DELIMITER //

CREATE PROCEDURE spGetAllLeverantie()
BEGIN
    SELECT  LEVE.Id                   AS productperleverancierId,
            LEVE.DatumLevering,
            LEVE.Aantal,
            LEVE.DatumEerstVolgendeLevering,
            PROD.Id                   AS ProductId,
            PROD.Naam
    FROM    productperleverancier AS LEVE
    INNER JOIN Product AS PROD
            ON PROD.Id = LEVE.ProductId;
END //

-- Zet de opdrachtprompt weer terug naar ;
DELIMITER ;

-- Debug code om de stored procedure te testen
CALL spGetAllLeverantie();