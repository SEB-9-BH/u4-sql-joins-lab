\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT m.title AS movie_title, d.name AS director_name
FROM movies m
JOIN directors d ON m.director_id = d.id;

-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT u.name AS user_name, m.title AS movie_title
FROM users_movies um
JOIN users u ON um.user_id = u.id
JOIN movies m ON um.movie_id = m.id;

-- 3. List the movies with the number of favorites they have.
SELECT m.title AS movie_title, COUNT(um.user_id) AS favorite_count
FROM movies m
LEFT JOIN users_movies um ON m.id = um.movie_id
GROUP BY m.title
ORDER BY favorite_count DESC;

-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT d.name AS director_name, COUNT(um.user_id) AS total_favorites
FROM directors d
JOIN movies m ON m.director_id = d.id
LEFT JOIN users_movies um ON m.id = um.movie_id
GROUP BY d.name
ORDER BY total_favorites DESC;

-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT u.name AS user_name, d.name AS director_name, COUNT(*) AS favorite_count
FROM users_movies um
JOIN users u ON um.user_id = u.id
JOIN movies m ON um.movie_id = m.id
JOIN directors d ON m.director_id = d.id
GROUP BY u.name, d.name
ORDER BY u.name, favorite_count DESC;
