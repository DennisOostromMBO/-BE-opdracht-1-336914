<?php

class Warehouses extends BaseController
{
    private $warehouseModel;

    public function __construct()
    {
        $this->warehouseModel = $this->model('Warehouse');
    }

    // Main index function to display the list of warehouse products
    public function index()
    {
        $data = [
            'title' => 'Overzicht Magazijn Producten',
            'dataRows' => null,
            'message' => null,
            'messageColor' => null,
            'messageVisibility' => 'display:none'
        ];

        // Call the model method to get all warehouse products
        $result = $this->warehouseModel->getAllMagazijnProduct();

        if (is_null($result)) {
            $data['message'] = 'Er is een fout opgetreden bij het ophalen van gegevens.';
            $data['messageColor'] = 'danger';
            $data['messageVisibility'] = 'display: flex';
            $data['dataRows'] = null;

            // Redirect to homepage if data cannot be retrieved
            header('Refresh:3; ' . URLROOT . '/homepages/index');
        } else {
            $data['dataRows'] = $result;
        }       

        $this->view('warehouses/index', $data);
    }

    // Display allergen details for a specific product

    public function allergenDetails($productId)
    {
        // Retrieve allergen data using the correct parameter
        $allergenData = $this->warehouseModel->getAllergensByProductId($productId);

        $data = [
            'title' => 'Allergenen Overzicht',
            'message' => empty($allergenData) ? 'Geen allergenen informatie gevonden voor dit product.' : null,
            'messageColor' => empty($allergenData) ? 'warning' : null,
            'messageVisibility' => empty($allergenData) ? 'display: flex' : 'display: none',
            'allergens' => $allergenData
        ];

        if (empty($allergenData)) {
            header('Refresh:3; ' . URLROOT . '/warehouses/index');
        }
        
        $this->view('warehouses/allergen_details', $data);
    }

    // Display delivery details for products
    public function leverantie($productId)
    {
        // Haal leverantiegegevens op voor het specifieke product
        $deliveryData = $this->warehouseModel->getLeverantieByProductId($productId);
    
        // Controleer of er voorraad is
        $aantal = false;
        $nextDeliveryDate = null;
    
        if (!empty($deliveryData)) {
            foreach ($deliveryData as $leverantie) {
                if ($leverantie->Aantal != 0 && $leverantie->Aantal !== NULL) {
                    $aantal = true;
                    break;
                } else {
                    $nextDeliveryDate = $leverantie->DatumEerstVolgendeLevering;
                }
            }
        }
    
        $data = [
            'title' => 'Leverantie Overzicht',
            'message' => empty($deliveryData) ? 'Er zijn geen leverantiegegevens beschikbaar voor dit product.' : null,
            'messageColor' => empty($deliveryData) ? 'warning' : null,
            'messageVisibility' => empty($deliveryData) ? 'display: flex' : 'display: none',
            'deliveryRows' => $deliveryData,
            'aantal' => $aantal,
            'nextDeliveryDate' => $nextDeliveryDate
        ];
    
        if (!$aantal) {
            header('Refresh: 4; URL=' . URLROOT . '/warehouses/index');
        }
    
        $this->view('warehouses/leverantie', $data);
    }    

}
