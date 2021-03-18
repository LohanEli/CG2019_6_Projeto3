<?php

/**
 * Arquivo de configuração global do site.
 */

/* Conexão com MySQL */
if ($_SERVER['SERVER_NAME'] == 'projeto3.localhost') {

    // Se estou no XAMPP (servidor, usuário, senha e database)
    $conn = new mysqli('localhost', 'root', '', 'intranet');
} else {

    // Se estou no provedor de hospedagem
    $conn = new mysqli('', '', '', '');
}

// Se der erro na conexão
if ($conn->connect_error) {
    die("Falha de conexão: " . $conn->connect_error);
}

/* Configurações adicionais da conexão */

// Transações MySQL em UTF-8
$conn->query("SET NAMES 'utf8'");
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');

// MySQL com nomes dos dias da semana e dos meses em português
$conn->query("SET GLOBAL lc_time_names=pt_BR");
$conn->query("SET lc_time_names = 'pt_BR'");

/* Variáveis de configuração do tema ($T[]) */

// Obtém configuração do tema do banco de dados
$res = $conn->query("SELECT * FROM config");

// 'Monta' variável $T[]
while($var = $res->fetch_assoc()) {
    
    if (stristr($var['variable'], 'social_')) {
        
        // Se for uma rede social, inclui em T$['social']
        $social = str_ireplace('social_', '', $var['variable']);
        $T['social'][$social] = $var['value'];
    } else if (stristr($var['variable'], 'contact_')) {

        // Se for um contato, inclui em T$['contact']
        $contact = str_ireplace('contact_', '', $var['variable']);
        $T['contact'][$contact] = $var['value'];
    } else {
        // Outras configurações
        $T[$var['variable']] = $var['value'];
    }
}