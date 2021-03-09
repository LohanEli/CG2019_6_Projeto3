// Inicializa documento
$(document).ready(runIndex);

// Função que processa o documento
function runIndex() {
  $(document).on("click", ".article", clickArticle);
}

// Ação de clicar em um artigo
function clickArticle() {
  // Obtém o id do atriburo 'data-id' da div.article
  id = $(this).attr("data-id");

  // Redireciona para a página que exibe um artigo
  location.href = "/article.php?" + id;
}
