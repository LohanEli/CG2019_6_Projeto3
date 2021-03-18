-- Atenção! 
-- Apague este arquivo quando o site entrar em produção!

DROP DATABASE IF EXISTS intranet;
CREATE DATABASE intranet CHARACTER SET utf8 COLLATE utf8_general_ci;
USE intranet;

CREATE TABLE authors (
    aut_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    aut_name VARCHAR(127) NOT NULL,
    aut_image VARCHAR(255) NOT NULL,
    aut_email VARCHAR(255) NOT NULL,
    aut_site VARCHAR(255) NOT NULL,
    aut_status ENUM('inativo', 'ativo') DEFAULT 'ativo'
);

CREATE TABLE articles (
    art_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_image VARCHAR(255) NOT NULL,
    art_title VARCHAR(127) NOT NULL,
    art_intro VARCHAR(255) NOT NULL,
    art_text LONGTEXT NOT NULL,
    art_author INT NOT NULL,
    art_status ENUM('inativo', 'ativo') DEFAULT 'ativo',
    FOREIGN KEY (art_author) REFERENCES authors(aut_id)
);

CREATE TABLE contacts (
    id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message LONGTEXT NOT NULL,
    status ENUM('recebida', 'lida', 'respondida', 'apagada') DEFAULT 'recebida'
);

CREATE TABLE config (
    id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    variable VARCHAR(63) NOT NULL,
    value TEXT NOT NULL
);

INSERT INTO authors (aut_id, aut_name, aut_image, aut_email, aut_site) VALUES
('1', 'André Luferat', 'https://randomuser.me/api/portraits/lego/5.jpg', 'andre@luferat.net', 'http://luferat.net/'),
('2', 'Joca da Silva', 'https://randomuser.me/api/portraits/lego/7.jpg', 'joca@silva.com', 'http://jocasilva.com/'),
('3', 'Setembrina Trocatapas', 'https://randomuser.me/api/portraits/lego/3.jpg', 'set@brina.com', 'http://setbrina.com/');

INSERT INTO articles (art_date, art_image, art_title, art_intro, art_text, art_author) VALUES
(
    '2021-01-12 12:15:17',
    'https://picsum.photos/198',
    'Primeiro artigo da Tilojo',
    'Este é o artigo de inauguração da nossa intranet.',
    '<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam neque culpa, vero natus asperiores reprehenderit soluta nobis exercitationem quaerat fugiat voluptates, dolore eos repellat. Doloremque blanditiis velit soluta nam odit.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi odit consequatur nam, repellendus sapiente dicta molestias. In odit saepe dolorum et est at voluptatibus, fuga quo unde impedit, rem voluptate.</p><img src="https://picsum.photos/400/300" alt="imagem aleatória"><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus minima doloribus consequatur ad itaque? Rem neque id temporibus vel, atque magnam saepe dolores consequatur consectetur odit? Optio cupiditate voluptas unde?</p><h3>Lista de links</h3><ul>    <li><a href="http://luferat.net" target="_blank">Site do Fessô</a></li>    <li><a href="http://githun.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa nemo animi, consequatur at est modi assumenda culpa earum molestias ea. Asperiores quidem sint placeat reiciendis in architecto ut, deserunt blanditiis.</p>',
    '1'
),
(
    '2021-02-17 15:16:17',
    'https://picsum.photos/199',
    'Como usar a máscara na Tilojo',
    'Aprenda a guardar, usar, descartar e reciclar suas máscaras.',
    '<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam neque culpa, vero natus asperiores reprehenderit soluta nobis exercitationem quaerat fugiat voluptates, dolore eos repellat. Doloremque blanditiis velit soluta nam odit.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi odit consequatur nam, repellendus sapiente dicta molestias. In odit saepe dolorum et est at voluptatibus, fuga quo unde impedit, rem voluptate.</p><img src="https://picsum.photos/400/300" alt="imagem aleatória"><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus minima doloribus consequatur ad itaque? Rem neque id temporibus vel, atque magnam saepe dolores consequatur consectetur odit? Optio cupiditate voluptas unde?</p><h3>Lista de links</h3><ul>    <li><a href="http://luferat.net" target="_blank">Site do Fessô</a></li>    <li><a href="http://githun.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa nemo animi, consequatur at est modi assumenda culpa earum molestias ea. Asperiores quidem sint placeat reiciendis in architecto ut, deserunt blanditiis.</p>',
    '3'
),
(
    '2021-02-28 21:22:23',
    'https://picsum.photos/200',
    'Construindo com segurança',
    'A Tilojo te ensina a não parar sua obra durante a pandemia.',
    '<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam neque culpa, vero natus asperiores reprehenderit soluta nobis exercitationem quaerat fugiat voluptates, dolore eos repellat. Doloremque blanditiis velit soluta nam odit.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi odit consequatur nam, repellendus sapiente dicta molestias. In odit saepe dolorum et est at voluptatibus, fuga quo unde impedit, rem voluptate.</p><img src="https://picsum.photos/400/300" alt="imagem aleatória"><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus minima doloribus consequatur ad itaque? Rem neque id temporibus vel, atque magnam saepe dolores consequatur consectetur odit? Optio cupiditate voluptas unde?</p><h3>Lista de links</h3><ul>    <li><a href="http://luferat.net" target="_blank">Site do Fessô</a></li>    <li><a href="http://githun.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa nemo animi, consequatur at est modi assumenda culpa earum molestias ea. Asperiores quidem sint placeat reiciendis in architecto ut, deserunt blanditiis.</p>',
    '2'
),
(
    '2021-03-10 12:00:12',
    'https://picsum.photos/201',
    'Artigo do Futuro',
    'Este artigo só vai ser publicado em um futuro próximo.',
    '<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam neque culpa, vero natus asperiores reprehenderit soluta nobis exercitationem quaerat fugiat voluptates, dolore eos repellat. Doloremque blanditiis velit soluta nam odit.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sequi odit consequatur nam, repellendus sapiente dicta molestias. In odit saepe dolorum et est at voluptatibus, fuga quo unde impedit, rem voluptate.</p><img src="https://picsum.photos/400/300" alt="imagem aleatória"><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus minima doloribus consequatur ad itaque? Rem neque id temporibus vel, atque magnam saepe dolores consequatur consectetur odit? Optio cupiditate voluptas unde?</p><h3>Lista de links</h3><ul>    <li><a href="http://luferat.net" target="_blank">Site do Fessô</a></li>    <li><a href="http://githun.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa nemo animi, consequatur at est modi assumenda culpa earum molestias ea. Asperiores quidem sint placeat reiciendis in architecto ut, deserunt blanditiis.</p>',
    '1'
);

INSERT INTO config (variable, value) VALUES
('siteName', 'Tilojo'),
('siteSlogan', 'Com os pés no chão'),
('fullSiteName', 'A Tilojo'),
('siteLogo', '/img/logo02.png'),
('favIcon', '/img/logo02.png'),
('pageTitle', ''),
('pageCSS', ''),
('pageJS', ''),
('social_facebook', 'https://facebook.com/tilojo'),
('social_youtube', 'https://youtube.com/tilojo'),
('social_twitter', 'https://twitter.com/tilojo'),
('social_instagram', 'https://instagram.com/tilojo'),
('contact_phone', '(21) 9876-54321'),
('contact_whatsapp', '(21) 9876-54321'),
('contact_envelope', 'tilojo@tilojo.com');