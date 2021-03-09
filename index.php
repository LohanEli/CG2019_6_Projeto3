<?php

/**
 * Modelo de página do site.
 * Copie este modelo para gerar novas páginas para o site.
 */

/* Carrega as configurações da página */
require '_config.php';

/* Configura esta página */

// Define o <title></title> desta página.
// Deixe vazio para a 'index'.
$T['pageTitle'] = '';

// Define as folhas de estilo desta página.
// Deixe vazio para não usar CSS adicional nesta página.
$T['pageCSS'] = '/css/index.css';

// Define o JavaScript desta página.
// Deixe vazio para não usar JavaScript adicional nesta página.
$T['pageJS'] = '/js/index.js';

/* Aqui entram todos os seus códigos PHP desta página */

// Obtém todos os artigos do DB
$sql = <<<SQL
SELECT `art_id`, `art_image`, `art_title`, `art_intro`
    FROM articles
    WHERE `art_status` = 'ativo'
        AND art_date <= NOW()
    ORDER BY `art_date` DESC
SQL;
$res = $conn->query($sql);

// Conta quantos artigos obteve
$total = $res->num_rows;

// Contém view dos artigos
$articles = '';

// Loop com os artigos
if ($total > 0) {

    while($art = $res->fetch_assoc()) {

        // Gera a view dos artigos
        $articles .= <<<HTML

<div class="article" title="{$art['art_title']}" data-id="{$art['art_id']}">
    <img src="{$art['art_image']}" alt="Imagem de {$art['art_title']}">
    <div>
        <h3>{$art['art_title']}</h3>
        {$art['art_intro']}
    </div>
</div>

HTML;

    }

} else {

    // Se não tem artigos
    $articles = <<<HTML

<h3>Ooooops!</h3>
<p>Não encontramos artigos para exibir!</p>

HTML;
}

/* Aqui terminam todos os seus códigos PHP desta página */

/* Carrega o header e o nav da página */
require '_header.php';

?>

            <article>
                <!-- Exibe artigos na view -->
                <h2>Artigos Recentes</h2>
                <small>Mais recentes primeiro.</small>
                <?php echo $articles ?>
            </article>

            <aside>

                <h3>Sidebar</h3>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident necessitatibus atque.</p>

            </aside>

<?php

require '_footer.php';