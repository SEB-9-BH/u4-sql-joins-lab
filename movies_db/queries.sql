\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT movies.title, directors.name AS director
FROM movies
JOIN directors ON movies.director_id = directors.director_id;


-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT users.name AS user, movies.title AS movie
FROM users
JOIN users_movies ON users.user_id = users_movies.user_id
JOIN movies ON movies.movie_id = users_movies.movie_id;


-- 3. List the movies with the number of favorites they have.
SELECT movies.title, COUNT(users_movies.user_id) AS favorite_count
FROM movies
LEFT JOIN users_movies ON movies.movie_id = users_movies.movie_id
GROUP BY movies.title
ORDER BY favorite_count DESC;


-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT directors.name AS director, COUNT(users_movies.user_id) AS favorite_count
FROM directors
JOIN movies ON directors.director_id = movies.director_id
LEFT JOIN users_movies ON movies.movie_id = users_movies.movie_id
GROUP BY directors.name
ORDER BY favorite_count DESC;


-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT users.name AS user, directors.name AS director, COUNT(*) AS favorite_count
FROM users
JOIN users_movies ON users.user_id = users_movies.user_id
JOIN movies ON users_movies.movie_id = movies.movie_id
JOIN directors ON movies.director_id = directors.director_id
GROUP BY users.name, directors.name
ORDER BY favorite_count DESC;

