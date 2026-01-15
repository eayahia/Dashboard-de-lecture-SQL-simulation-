##### \# la rockete 1 : **Afficher tous les articles (title, publish_date);**





 SELECT title, publish_date 

 FROM Posts;



+---------------------------+--------------+

| title                     | publish\_date |

+---------------------------+--------------+

| Apprendre SQL             | 2025-05-10   |

| Bases de Données          | 2025-05-20   |

| Le futur du Web           | 2025-12-15   |

| Sécurité Informatique     | 2025-03-12   |

| Post de test 222          | 2025-04-10   |

| Autre post 222            | 2025-04-15   |

| Santé Mentale             | 2025-01-10   |

| Recette Pizza             | 2025-02-05   |

| Voyage à Bali             | 2025-02-20   |

| Python pour débutants     | 2025-06-15   |

| Entrainement Cardio       | 2025-07-22   |

| Intelligence Artificielle | 2025-12-25   |

| Actualité du Jour         | 2026-01-08   |

| Météo du 8 Janvier        | 2026-01-08   |

+---------------------------+--------------+

14 rows in set (0.00 sec)



##### \# la rockete 2 : **Afficher les users dont le nom commence par 'EL';**



 SELECT * 

 FROM users 

 WHERE user_name LIKE 'EL%';



**+---------+-------------+-------------------+------------+**

**| id\_user | user\_name   | email             | date\_birth |**

**+---------+-------------+-------------------+------------+**

**|       3 | EL Mansouri | mansouri@mail.com | 1988-02-20 |**

**|       4 | EL Idrissi  | idrissi@mail.com  | 1992-12-12 |**

**|       6 | EL Amrani   | amrani@mail.com   | 1985-08-30 |**

**+---------+-------------+-------------------+------------+**

**3 rows in set (0.00 sec)**


##### # la rockete 3 :  **Afficher les posts de users "id_user : 3"ordonnées par priorité par date croissant;**




 SELECT *

FROM Posts 

WHERE id_user = 3 

 ORDER BY publish_date ASC;



+---------+-----------------------+------------+--------------+-----------+---------+-------------+

| id\_post | title                 | content    | publish\_date | statu     | id\_user | id\_category |

+---------+-----------------------+------------+--------------+-----------+---------+-------------+

|       9 | Voyage à Bali         | Contenu... | 2025-02-20   | published |       3 |           3 |

|       4 | Sécurité Informatique | Contenu... | 2025-03-12   | published |       3 |           1 |

|       2 | Bases de Données      | Contenu... | 2025-05-20   | draft     |       3 |           1 |

+---------+-----------------------+------------+--------------+-----------+---------+-------------+

3 rows in set (0.00 sec)



##### \# la rockete 4 : **Afficher les posts publiés le mois dernier;**


select  * 
from posts
     where month(date_add(curdate(), interval -1 month)) = month(publish_date) and year(date_add(curdate(), interval -1 month)) = year(publish_date);
+---------+---------------------------+------------+--------------+-----------+---------+-------------+
| id_post | title                     | content    | publish_date | statu     | id_user | id_category |
+---------+---------------------------+------------+--------------+-----------+---------+-------------+
|       3 | Le futur du Web           | Contenu... | 2025-12-15   | published |       1 |           1 |
|      12 | Intelligence Artificielle | Contenu... | 2025-12-25   | published |       2 |           1 |
+---------+---------------------------+------------+--------------+-----------+---------+-------------+
2 rows in set (0.00 sec)



##### \# la rockete 5 : **Afficher tous les posts postés aujourd'hui.$;**


 select * from posts where publish_date =  curdate();
+---------+--------------------+---------------------+--------------+-----------+---------+-------------+
| id_post | title              | content             | publish_date | statu     | id_user | id_category |
+---------+--------------------+---------------------+--------------+-----------+---------+-------------+
|      13 | Actualité du Jour  | Posté aujourdhui... | 2026-01-11   | published |       6 |           1 |
|      14 | Météo du 8 Janvier | Il fait beau...     | 2026-01-11   | published |       7 |           2 |
+---------+--------------------+---------------------+--------------+-----------+---------+-------------+
2 rows in set (0.00 sec)



##### \# la rockete 6 : **Afficher les posts archivés de users 'id_user = 3';**


select *
 from posts
  where id_user = 3 and statu = 'published';
+---------+-----------------------+------------+--------------+-----------+---------+-------------+
| id_post | title                 | content    | publish_date | statu     | id_user | id_category |
+---------+-----------------------+------------+--------------+-----------+---------+-------------+
|       4 | Sécurité Informatique | Contenu... | 2025-03-12   | published |       3 |           1 |
|       9 | Voyage à Bali         | Contenu... | 2025-02-20   | published |       3 |           3 |
+---------+-----------------------+------------+--------------+-----------+---------+-------------+
2 rows in set (0.00 sec)



##### \# la rockete 7 : **Afficher le nombre posts 'published' de users 'Ahmed Alami';


SELECT COUNT(*) AS total_published
  FROM posts p JOIN users u ON p.id_user = u.id_user WHERE u.user_name = 'Ahmed Alami' AND p.statu = 'published';
+-----------------+
| total_published |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.00 sec)



##### \# la rockete 8 : **Combien posts ont été published par mois dans l'année 2025;


select month(publish_date) as month,
    -> count(*) as posts_count
    -> from posts
    -> where year(publish_date) = 2025 and statu = 'published'
    -> group by month(publish_date)
    -> order by month(publish_date);

+-------+-------------+
| month | posts_count |
+-------+-------------+
|     1 |           1 |
|     2 |           2 |
|     3 |           1 |
|     4 |           2 |
|     5 |           1 |
|     6 |           1 |
|     7 |           1 |
|    12 |           2 |
+-------+-------------+
8 rows in set (0.01 sec)





##### \# la rockete 9 : **Modifier la date de publidh_date de posts 4 par "02/01/2026";

update posts set publish_date = '2026-01-02' where id_post = 4;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

 select * from posts ;
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
| id_post | title                     | content             | publish_date | statu     | id_user | id_category |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
|       1 | Apprendre SQL             | Contenu...          | 2025-05-10   | published |       2 |           1 |
|       2 | Bases de Données          | Contenu...          | 2025-05-20   | draft     |       3 |           1 |
|       3 | Le futur du Web           | Contenu...          | 2025-12-15   | published |       1 |           1 |
|       4 | Sécurité Informatique     | Contenu...          | 2026-01-02   | published |       3 |           1 |   <<<<<<<<<<<<<<<<<
|       5 | Post de test 222          | A supprimer...      | 2025-04-10   | published |       4 |           2 |
|       6 | Autre post 222            | A supprimer...      | 2025-04-15   | published |       7 |           3 |
|       7 | Santé Mentale             | Contenu...          | 2025-01-10   | published |       6 |           2 |
|       8 | Recette Pizza             | Contenu...          | 2025-02-05   | published |       5 |           4 |
|       9 | Voyage à Bali             | Contenu...          | 2025-02-20   | published |       3 |           3 |
|      10 | Python pour débutants     | Contenu...          | 2025-06-15   | published |       4 |           1 |
|      11 | Entrainement Cardio       | Contenu...          | 2025-07-22   | published |       5 |           5 |
|      12 | Intelligence Artificielle | Contenu...          | 2025-12-25   | published |       2 |           1 |
|      13 | Actualité du Jour         | Posté aujourdhui... | 2026-01-09   | published |       6 |           1 |
|      14 | Météo du 8 Janvier        | Il fait beau...     | 2026-01-09   | published |       7 |           2 |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
14 rows in set (0.00 sec)




##### \# la rockete 10 : **Modifier statu de l'article 8  "Archivé";

UPDATE Posts SET statu = 'Archivé' WHERE id_post = 8;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from posts;
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
| id_post | title                     | content             | publish_date | statu     | id_user | id_category |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
|       1 | Apprendre SQL             | Contenu...          | 2025-05-10   | published |       2 |           1 |
|       2 | Bases de Données          | Contenu...          | 2025-05-20   | draft     |       3 |           1 |
|       3 | Le futur du Web           | Contenu...          | 2025-12-15   | published |       1 |           1 |
|       4 | Sécurité Informatique     | Contenu...          | 2025-03-12   | published |       3 |           1 |
|       5 | Post de test 222          | A supprimer...      | 2025-04-10   | published |       4 |           2 |
|       6 | Autre post 222            | A supprimer...      | 2025-04-15   | published |       7 |           3 |
|       7 | Santé Mentale             | Contenu...          | 2025-01-10   | published |       6 |           2 |
|       8 | Recette Pizza             | Contenu...          | 2025-02-05   | Archivé   |       5 |           4 |   <<<<<<<<<<<<<<<<<
|       9 | Voyage à Bali             | Contenu...          | 2025-02-20   | published |       3 |           3 |
|      10 | Python pour débutants     | Contenu...          | 2025-06-15   | published |       4 |           1 |
|      11 | Entrainement Cardio       | Contenu...          | 2025-07-22   | published |       5 |           5 |
|      12 | Intelligence Artificielle | Contenu...          | 2025-12-25   | published |       2 |           1 |
|      13 | Actualité du Jour         | Posté aujourdhui... | 2026-01-09   | published |       6 |           1 |
|      14 | Météo du 8 Janvier        | Il fait beau...     | 2026-01-09   | published |       7 |           2 |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
14 rows in set (0.00 sec)




##### \# la rockete 11 : **Supprimer les posts de id_user '1'; 

delete from posts where id_user = 1;
Query OK, 1 row affected (0.01 sec)

mysql> select * from posts;
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
| id_post | title                     | content             | publish_date | statu     | id_user | id_category |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
|       1 | Apprendre SQL             | Contenu...          | 2025-05-10   | published |       2 |           1 |
|       2 | Bases de Données          | Contenu...          | 2025-05-20   | draft     |       3 |           1 |
|       4 | Sécurité Informatique     | Contenu...          | 2025-03-12   | published |       3 |           1 |
|       5 | Post de test 222          | A supprimer...      | 2025-04-10   | published |       4 |           2 |
|       6 | Autre post 222            | A supprimer...      | 2025-04-15   | published |       7 |           3 |
|       7 | Santé Mentale             | Contenu...          | 2025-01-10   | published |       6 |           2 |
|       8 | Recette Pizza             | Contenu...          | 2025-02-05   | published |       5 |           4 |
|       9 | Voyage à Bali             | Contenu...          | 2025-02-20   | published |       3 |           3 |
|      10 | Python pour débutants     | Contenu...          | 2025-06-15   | published |       4 |           1 |
|      11 | Entrainement Cardio       | Contenu...          | 2025-07-22   | published |       5 |           5 |
|      12 | Intelligence Artificielle | Contenu...          | 2025-12-25   | published |       2 |           1 |
|      13 | Actualité du Jour         | Posté aujourdhui... | 2026-01-09   | published |       6 |           1 |
|      14 | Météo du 8 Janvier        | Il fait beau...     | 2026-01-09   | published |       7 |           2 |
+---------+---------------------------+---------------------+--------------+-----------+---------+-------------+
13 rows in set (0.00 sec)


##### \# la rockete 12 : **Supprimer user  "Ahmed Alami";

DELETE FROM users WHERE user_name = 'Ahmed Alami';
Query OK, 1 row affected (0.01 sec)

mysql> select * from users;
+---------+---------------+-------------------+------------+
| id_user | user_name     | email             | date_birth |
+---------+---------------+-------------------+------------+
|       2 | User 222      | test222@mail.com  | 1995-10-10 |
|       3 | EL Mansouri   | mansouri@mail.com | 1988-02-20 |
|       4 | EL Idrissi    | idrissi@mail.com  | 1992-12-12 |
|       5 | Sara Tazi     | sara@mail.com     | 1998-04-05 |
|       6 | EL Amrani     | amrani@mail.com   | 1985-08-30 |
|       7 | Yassine Fahmi | yassine@mail.com  | 2001-01-25 |
+---------+---------------+-------------------+------------+
6 rows in set (0.00 sec)

