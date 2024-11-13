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
        <h1>Overzicht allergenen</h1>
    </div>
    <div class="col-2"></div>
</div>


    <!-- Begin allergenen tabelweergave -->
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <?php if (!empty($data['allergens'])): ?>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Naam</th>
                            <th>Beschrijving</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data['allergens'] as $allergen): ?>
                            <tr>
                                <td><?= htmlspecialchars($allergen->Naam ?? 'Onbekend'); ?></td>
                                <td><?= htmlspecialchars($allergen->Omschrijving ?? 'Geen details beschikbaar'); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken</p>
            <?php endif; ?>
        </div>
        <div class="col-2"></div>
    </div>

    <!-- Terug naar Producten link -->
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <a href="<?= URLROOT; ?>/warehouses/index" class="btn btn-primary mb-3">Terug naar Magazijn</a>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>
