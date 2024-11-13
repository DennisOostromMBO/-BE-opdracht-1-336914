<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <!-- Berichtweergave -->
    <div class="row mt-3" style='<?= $data['messageVisibility']; ?>'>
        <div class="col-2"></div>
        <div class="col-8 text-center">
            <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                <?= $data['message']; ?>
            </div>
        </div>
        <div class="col-2"></div>
    </div>

    <!-- Titel sectie -->
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h1>Leverantie Informatie</h1>
        </div>
        <div class="col-2"></div>
    </div>

    <!-- Begin leverantie tabelweergave -->
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <?php if (!empty($data['deliveryRows'])): ?>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Product naam</th>
                            <th>Datum laatste levering</th>
                            <th>Aantal</th>
                            <th>Volgende Leverantie Datum</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data['deliveryRows'] as $leverantie): ?>
                            <tr>
                                <td><?= htmlspecialchars($leverantie->Naam ?? 'Onbekend'); ?></td>
                                <td><?= htmlspecialchars($leverantie->DatumLevering ?? 'Niet beschikbaar'); ?></td>
                                <td>
                                    <?php 
                                        // Als het aantal NULL of 0 is, geef dan de melding weer in de else
                                        if ($leverantie->Aantal != 0 && $leverantie->Aantal !== NULL) {
                                            echo htmlspecialchars($leverantie->Aantal ?? 'Niet beschikbaar');
                                        } else {
                                            // Als Aantal NULL of 0 is, toon de foutmelding en de verwachte leverdatum
                                            echo "Er is op dit moment geen voorraad aanwezig.";
                                            echo "<br><strong>De verwachte eerstvolgende levering is:</strong> " . htmlspecialchars($leverantie->DatumEerstVolgendeLevering ?? 'Niet beschikbaar');
                                        }
                                    ?>
                                </td>
                                <td><?= htmlspecialchars($leverantie->DatumEerstVolgendeLevering ?? 'Niet beschikbaar'); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>Er zijn geen leverantiegegevens beschikbaar voor dit product.</p>
            <?php endif; ?>
        </div>
        <div class="col-2"></div>
    </div>

    <!-- Terug naar Magazijn link -->
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <a href="<?= URLROOT; ?>/warehouses/index" class="btn btn-primary mb-3">Terug naar Magazijn</a>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>
