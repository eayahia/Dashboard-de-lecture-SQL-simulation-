drop database if exists jointures_SQL;
create database jointures_SQL;
use jointures_SQL;
CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_birth date not null
    
)COMMENT = 'Table of users';

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL
    
)COMMENT = 'Table of category';

CREATE TABLE Posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    publish_date DATE NOT NULL,
    statu ENUM('published', 'draft'), 
    id_user INT,
    id_category INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_category) REFERENCES category(id_category)
    
)COMMENT = 'Table of artlicles';

CREATE TABLE comments (
    id_comment INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    publish_date DATE,
    id_user INT,
    id_post INT, 
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_post) REFERENCES Posts(id_post)
    
)COMMENT = 'Table de commentaire';


CREATE INDEX idx_email ON users (email);
CREATE INDEX idx_user ON Posts (id_user);
CREATE INDEX idx_article ON comments (id_post);

INSERT INTO users (user_name, email, date_birth) VALUES
('Oussama', 'oussama@gmail.com', '2003-11-06'),
('hasan', 'hasan@gmail.com', '2000-05-20'),
('Ayoub', 'ayoub@gmail.com', '1986-11-08');




INSERT INTO category (category_name) VALUES
('Technologie'),
('Santé'),
('Voyage');

INSERT INTO Posts (title, content, publish_date, statu, id_user) VALUES
('Introduction au SQL', 'Article qui explique les bases du langage SQL.', '2024-01-05', 'published', 1 ),
('Les bases de SELECT', 'Comprendre la commande SELECT en SQL.', '2024-01-10', 'published', 1),
('Utilisation de WHERE', 'Filtrer les données avec WHERE.', '2024-01-15', 'published', 2),
('ORDER BY expliqué', 'Trier les résultats avec ORDER BY.', '2024-01-20', 'published', 1),
('LIMIT en SQL', 'Limiter le nombre de résultats.', '2024-01-25', 'published', 2),

('Introduction au HTML', 'Les bases du langage HTML.', '2024-02-01', 'published', 1),
('Balises HTML importantes', 'Découverte des balises essentielles.', '2024-02-05', 'published', 2),
('Structure d’une page web', 'Organisation HTML correcte.', '2024-02-10', 'published', 1),
('Formulaires HTML', 'Créer des formulaires en HTML.', '2024-02-15', 'published', 3),
('Liens et images', 'Utilisation des liens et images.', '2024-02-20', 'published', 1),

('Introduction au CSS', 'Styliser une page web avec CSS.', '2024-03-01', 'published', 1),
('Sélecteurs CSS', 'Comprendre les sélecteurs CSS.', '2024-03-05', 'published', 2),
('Box Model CSS', 'Margin, padding et border.', '2024-03-10', 'published', 1),
('Flexbox', 'Créer des layouts flexibles.', '2024-03-15', 'published', 2),
('Grid CSS', 'Mise en page avec CSS Grid.', '2024-03-20', 'published', 1),

('Introduction à JavaScript', 'Les bases de JavaScript.', '2024-04-01', 'published', 1),
('Variables JS', 'Déclaration des variables.', '2024-04-05', 'published', 2),
('Conditions en JS', 'If, else et switch.', '2024-04-10', 'published', 1),
('Boucles JS', 'For, while et do while.', '2024-04-15', 'published', 2),
('Fonctions JS', 'Créer et utiliser des fonctions.', '2024-04-20', 'published', 1);

INSERT INTO comments (content, publish_date, id_user, id_post) VALUES
('Excellent article!', '2024-01-11', 1, 1),
('Merci pour ces informations.', '2024-02-16', 2, 2),
('bien article', '2024-03-21', 3, 3);



ALTER TABLE posts
ADD nb_vues INT DEFAULT 0;

UPDATE posts SET nb_vues = 120 WHERE id_post = 1;
UPDATE posts SET nb_vues = 1000000  WHERE id_post = 2;
UPDATE posts SET nb_vues = 200 WHERE id_post = 3;
UPDATE posts SET nb_vues = 120 WHERE id_post = 4;
UPDATE posts SET nb_vues = 986  WHERE id_post = 5;
UPDATE posts SET nb_vues = 200 WHERE id_post = 6;
UPDATE posts SET nb_vues = 120 WHERE id_post = 7;
UPDATE posts SET nb_vues = 88  WHERE id_post = 8;
UPDATE posts SET nb_vues = 200 WHERE id_post = 9;
UPDATE posts SET nb_vues = 120 WHERE id_post = 10;
UPDATE posts SET nb_vues = 809  WHERE id_post = 11;
UPDATE posts SET nb_vues = 200 WHERE id_post = 12;
UPDATE posts SET nb_vues = 120 WHERE id_post = 13;
UPDATE posts SET nb_vues = 8065  WHERE id_post = 14;
UPDATE posts SET nb_vues = 200 WHERE id_post = 15;
UPDATE posts SET nb_vues = 1200 WHERE id_post = 16;
UPDATE posts SET nb_vues = 8000  WHERE id_post = 17;
UPDATE posts SET nb_vues = 200 WHERE id_post = 18;
UPDATE posts SET nb_vues = 120 WHERE id_post = 19;
UPDATE posts SET nb_vues = 800  WHERE id_post = 20;






SELECT p.title, p.publish_date, u.user_name
FROM posts p
INNER JOIN users u ON p.id_post = u.id_user;



SELECT p.title, u.user_name
FROM posts p
INNER JOIN users u ON p.id_post = u.id_user
WHERE u.user_name = 'oussama';



select p.title, u.user_name
from posts p 
left join users u on p.id_user = u.id_user;



select p.title , u.user_name , c.content
from posts p 
inner join users u on p.id_user = u.id_user
inner join comments c on p.id_post = c.id_post;