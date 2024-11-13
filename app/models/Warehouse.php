<?php

class Warehouse  
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }


    public function getAllMagazijnProduct()
    {
        $sql = "CALL spGetAllMagazijnProduct();";
        $this->db->query($sql);
        return $this->db->resultSet();
    }
  
 //geen tijd gehad om stored procedure te maken helaas.
    public function getAllergensByProductId($productId)
{
    $sql = "SELECT a.Id, a.Naam, a.Omschrijving 
            FROM Allergeen a
            JOIN ProductPerAllergeen ppa ON a.Id = ppa.AllergeenId
            WHERE ppa.ProductId = :productId";
    $this->db->query($sql);
    $this->db->bind(':productId', $productId);
    return $this->db->resultSet();
}

public function getLeverantieByProductId($productId)
{
    // als ik de stored procedure hier aanroep, komen alle leverancie dingen, niet alleen van dat product. vandaar dat ik het voor nu ff zo heb gedaan.
    $sql = "SELECT 
                LEVE.Id AS productperleverancierId,
                LEVE.DatumLevering,
                LEVE.Aantal,
                LEVE.DatumEerstVolgendeLevering,
                PROD.Id AS ProductId,
                PROD.Naam
            FROM 
                productperleverancier AS LEVE
            INNER JOIN Product AS PROD ON PROD.Id = LEVE.ProductId
            WHERE PROD.Id = :productId";

    // Query uitvoeren en resultSet ophalen
    $this->db->query($sql);
    $this->db->bind(':productId', $productId);
    return $this->db->resultSet();
}

}
