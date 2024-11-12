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
}
