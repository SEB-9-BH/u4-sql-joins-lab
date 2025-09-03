\connect movies_lab_db;

-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT movies.title, directors.name FROM movies 
JOIN directors ON movies.director_id = directors.director_id;

-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT movies.title, users.name FROM users_movies
JOIN movies ON users_movies.movie_id = movies.movie_id
JOIN users ON users_movies.user_id = users.user_id;


-- 3. List the movies with the number of favorites they have.
SELECT movies.title, COUNT(users_movies.user_id) AS favorites_count
FROM movies
LEFT JOIN users_movies ON movies.movie_id = users_movies.movie_id
GROUP BY movies.title;



-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT directors.name, COUNT(users_movies.user_id) AS favorites_count
FROM directors
JOIN movies ON directors.director_id = movies.director_id
LEFT JOIN users_movies ON movies.movie_id = users_movies.movie_id
GROUP BY directors.name
ORDER BY favorites_count DESC;

-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT users.name AS user_name, directors.name AS director_name, COUNT(users_movies.movie_id) AS favorites_count
FROM users_movies
JOIN users ON users_movies.user_id = users.user_id
JOIN movies ON users_movies.movie_id = movies.movie_id
JOIN directors ON movies.director_id = directors.director_id
GROUP BY users.name, directors.name
ORDER BY favorites_count DESC;


-- SELECT selects the needed data for displaying
-- FROM takes from that table
-- AS defines COUNT(users_movies.user_id) to an alias called favorites_count
-- ON sets the condition to which join will work which in our case is matching the id's
-- GROUPS BY the given filter