<?php

class Warehouses extends BaseController
{
    private $warehouseModel;

    public function __construct()
    {
        $this->warehouseModel = $this->model('Warehouse');
    }

    public function index()
    {
        $data = [
            'title' => 'Overzicht Magazijn Producten',
            'dataRows' => NULL,
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'display:none'
        ];

        $result = $this->warehouseModel->getAllMagazijnProduct();

        if (is_null($result)) {
            $data['message'] = 'Er is een fout opgetreden bij het ophalen van gegevens.';
            $data['messageColor'] = 'danger';
            $data['messageVisibility'] = 'display: flex';
            $data['dataRows'] = NULL;

            header('Refresh:3; ' . URLROOT . '/homepages/index');
        } else {
            $data['dataRows'] = $result;
        }       

        $this->view('warehouses/index', $data);
    }
}
