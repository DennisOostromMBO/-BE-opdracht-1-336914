<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <div class="row mt-3" style='<?= $data['messageVisibility']; ?>'>
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                <?= $data['message']; ?>
            </div>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h3><?= $data['title']; ?></h3>
            <p><a href="<?= URLROOT; ?>/products/create">Nieuw product toevoegen</a></p> <!-- Voeg hier eventueel een link toe voor nieuwe producten -->
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a>
        </div>
        <div class="col-2"></div>
    </div>

    <!-- Begin tabelweergave -->
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Barcode</th>
                        <th>Naam</th>
                        <th>VerpakkingsEenheid</th>
                        <th>Aantal Aanwezig</th>
                        <th>Allergenen Info</th>
                        <th>Leverantie Info</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($data['dataRows']): ?>
                        <?php foreach ($data['dataRows'] as $row): ?>
                            <tr>
                                <td><?= htmlspecialchars($row->Barcode); ?></td>
                                <td><?= htmlspecialchars($row->Naam); ?></td>
                                <td><?= htmlspecialchars($row->VerpakkingsEenheid); ?></td>
                                <td><?= htmlspecialchars($row->AantalAanwezig); ?></td>
                                <td><?= htmlspecialchars($row->AllergenenInfo); ?></td>
                                <td><?= htmlspecialchars($row->LeverantieInfo); ?></td> 
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="6" class="text-center">Geen gegevens gevonden.</td> 
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>
