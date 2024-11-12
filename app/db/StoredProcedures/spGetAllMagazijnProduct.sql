/******************************************************
-- Doel: Opvragen van alle records uit de tabel magazijn en product
-- Versie: 01
-- Datum: 26-09-2024
-- Auteur: Dennis Oostrom
******************************************************/

-- Selecteer de juiste database voor je stored procedure
use `jamin`;

-- Verwijder de oude stored procedure
DROP PROCEDURE IF EXISTS spGetAllMagazijnProduct;

-- Verander even tijdelijk de opdrachtprompt naar //
DELIMITER //

CREATE PROCEDURE spGetAllMagazijnProduct()
BEGIN

    SELECT  MAGA.Id                   AS MagazijnId,
         
            MAGA.VerpakkingsEenheid,
            MAGA.AantalAanwezig,
            PROD.Id                   AS ProductId,
            PROD.Naam,                 
            PROD.Barcode
    FROM    Magazijn AS MAGA

    INNER JOIN Product AS PROD
            ON PROD.Id = MAGA.ProductId

    ORDER BY PROD.Id ASC;

END //
DELIMITER ;

/************* debug code stored procedure **************

CALL spGetAllMagazijnProduct();

********************************************************/