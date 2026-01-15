DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;
USE blog;

CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_birth DATE NOT NULL
) COMMENT = 'Table of users';

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL
) COMMENT = 'Table of category';

CREATE TABLE Posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    publish_date DATE NOT NULL,
    statu ENUM('published', 'draft','Archivé'), 
    id_user INT,
    id_category INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_category) REFERENCES category(id_category)
) COMMENT = 'Table of articles';

CREATE TABLE comments (
    id_comment INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    publish_date DATE,
    id_user INT,
    id_post INT, 
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_post) REFERENCES Posts(id_post) ON DELETE CASCADE
) COMMENT = 'Table de commentaire';

INSERT INTO users ( user_name, email, date_birth) VALUES
( 'Ahmed Alami', 'ahmed.alami@mail.com', '1990-05-15'),
( 'User 222', 'test222@mail.com', '1995-10-10'),
( 'EL Mansouri', 'mansouri@mail.com', '1988-02-20'),
( 'EL Idrissi', 'idrissi@mail.com', '1992-12-12'),
( 'Sara Tazi', 'sara@mail.com', '1998-04-05'),
( 'EL Amrani', 'amrani@mail.com', '1985-08-30'),
( 'Yassine Fahmi', 'yassine@mail.com', '2001-01-25');

INSERT INTO category (category_name) 
VALUES ('Technologie'), ('Santé'), ('Voyage'), ('Cuisine'), ('Sport');

INSERT INTO Posts ( title, content, publish_date, statu, id_user, id_category) VALUES
( 'Apprendre SQL', 'Contenu...', '2025-05-10', 'published',					 2, 1),
( 'Bases de Données', 'Contenu...', '2025-05-20', 'draft',					3 , 1),
( 'Le futur du Web', 'Contenu...', '2025-12-15', 'published',				 1, 1),
( 'Sécurité Informatique', 'Contenu...', '2025-03-12', 'published',			3 , 1),
( 'Post de test 222', 'A supprimer...', '2025-04-10', 'published',			4 , 2),
( 'Autre post 222', 'A supprimer...', '2025-04-15', 'published',			7 , 3),
( 'Santé Mentale', 'Contenu...', '2025-01-10', 'published', 				6 , 2),
( 'Recette Pizza', 'Contenu...', '2025-02-05', 'published', 			  	 5, 4),
( 'Voyage à Bali', 'Contenu...', '2025-02-20', 'published', 				3 , 3),
( 'Python pour débutants', 'Contenu...', '2025-06-15', 'published', 		4 , 1),
( 'Entrainement Cardio', 'Contenu...', '2025-07-22', 'published', 			5 , 5),
( 'Intelligence Artificielle', 'Contenu...', '2025-12-25', 'published', 	2 , 1),
( 'Actualité du Jour', 'Posté aujourdhui...', CURRENT_DATE, 'published', 	6 , 1),
( 'Météo du 8 Janvier', 'Il fait beau...', CURRENT_DATE, 'published', 		7 , 2);

INSERT INTO comments (content, publish_date, id_user, id_post) VALUES
('Super article!', '2025-05-11', 7, 4),
('Très utile, merci.', '2025-12-16', 6, 9),
('Je ne suis pas d''accord.', CURRENT_DATE, 4, 2);