\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT m.title, d.name AS director
FROM movies AS m
LEFT JOIN directors AS d ON m.director_id = d.director_id
ORDER BY m.title;


-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT u.name AS user_name, m.title AS movie_title
FROM users_movies AS um
JOIN users AS u USING (user_id)
JOIN movies AS m USING (movie_id)
ORDER BY u.name, m.title;


-- 3. List the movies with the number of favorites they have.
SELECT m.title,
       COUNT(um.user_id) AS favorite_count
FROM movies AS m
LEFT JOIN users_movies AS um USING (movie_id)
GROUP BY m.movie_id, m.title
ORDER BY favorite_count DESC, m.title;


-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT d.name AS director_name,
       COUNT(um.user_id) AS total_favorites
FROM directors AS d
LEFT JOIN movies AS m ON m.director_id = d.director_id
LEFT JOIN users_movies AS um ON um.movie_id = m.movie_id
GROUP BY d.director_id, d.name
ORDER BY total_favorites DESC, d.name;


-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT u.name  AS user_name,
       d.name  AS director_name,
       COUNT(*) AS favorite_count
FROM users_movies AS um
JOIN users  AS u USING (user_id)
JOIN movies AS m USING (movie_id)
JOIN directors AS d ON d.director_id = m.director_id
GROUP BY u.user_id, u.name, d.director_id, d.name
ORDER BY favorite_count DESC, user_name, director_name;
