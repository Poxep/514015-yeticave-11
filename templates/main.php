<section class="promo">
    <h2 class="promo__title">Нужен стафф для катки?</h2>
    <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
    <ul class="promo__list">
    <?php foreach($categories as $category): ?>

        <li class="promo__item promo__item--boards">
            <a class="promo__link" href="pages/all-lots.html"><?= htmlspecialchars($category); ?></a>
        </li>

    <?php endforeach; ?>
    </ul>
</section>
<section class="lots">
    <div class="lots__header">
        <h2>Открытые лоты</h2>
    </div>
    <ul class="lots__list">
    <?php foreach ($goods as $card_element): ?>

        <li class="lots__item lot">
            <div class="lot__image">
                <img src="<?= htmlspecialchars($card_element['url']); ?>" width="350" height="260" alt="">
            </div>
            <div class="lot__info">
                <span class="lot__category"><?= htmlspecialchars($card_element['category']); ?></span>
                <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= htmlspecialchars($card_element['name']); ?></a></h3>
                <div class="lot__state">
                    <div class="lot__rate">
                        <span class="lot__amount">Стартовая цена</span>
                        <span class="lot__cost"><?= htmlspecialchars(price_formatting($card_element['price'])); ?></span>
                    </div>
                <?php if (count_time_remaining($card_element['timer'])[0] < 1): ?>

                    <div class="lot__timer timer timer--finishing">
                        <?= count_time_remaining($card_element['timer'])[0]; ?>:<?= count_time_remaining($card_element['timer'])[1]; ?>
                    </div>

                <?php else: ?>

                    <div class="lot__timer timer">
                        <?= count_time_remaining($card_element['timer'])[0]; ?>:<?= count_time_remaining($card_element['timer'])[1]; ?>
                    </div>

                <?php endif; ?>
                </div>
            </div>
        </li>

    <?php endforeach; ?>
    </ul>
</section>