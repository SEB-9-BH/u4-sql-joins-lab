\connect movies_lab_db;
\x
-- Test query!!
SELECT * FROM users;

-- E1. List all the movie titles and their corresponding directors.
SELECT m.title, d.name AS director
FROM movies m
JOIN directors d ON m.director_id = d.director_id;
-- E2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT u.name AS user_name, m.title AS movie_title
FROM users_movies um
JOIN users u ON um.user_id = u.user_id
JOIN movies m ON um.movie_id = m.movie_id;
-- E3. List the movies with the number of favorites they have.
SELECT m.title, COUNT(um.user_id) AS favorite_count
FROM movies m
LEFT JOIN users_movies um ON m.movie_id = um.movie_id
GROUP BY m.movie_id, m.title
ORDER BY favorite_count DESC, m.title;
-- E4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT d.name AS director, COUNT(um.user_id) AS total_favorites
FROM directors d
JOIN movies m ON d.director_id = m.director_id
LEFT JOIN users_movies um ON m.movie_id = um.movie_id
GROUP BY d.director_id, d.name
ORDER BY total_favorites DESC, d.name;
-- E5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT u.name AS user_name, d.name AS director_name, COUNT(*) AS favorite_count
FROM users_movies um
JOIN users u ON um.user_id = u.user_id
JOIN movies m ON um.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
GROUP BY u.user_id, u.name, d.director_id, d.name
ORDER BY u.name, favorite_count DESC;

\q