\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.

SELECT title, name FROM movies JOIN directors ON directors.director_id = movies.director_id;

-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.

SELECT title, name FROM users_movies INNER JOIN users ON users.user_id = users_movies.user_id INNER JOIN movies ON movies.movie_id = users_movies.movie_id;

-- 3. List the movies with the number of favorites they have.

SELECT title, COUNT(*) FROM users_movies JOIN movies ON movies.movie_id = users_movies.movie_id GROUP BY users_movies.movie_id, movies.title;

-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.

SELECT name, COUNT(*) FROM directors JOIN movies ON movies.director_id = directors.director_id JOIN users_movies ON users_movies.movie_id = movies.movie_id GROUP BY directors.name;

-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).

SELECT users.name, directors.name, COUNT(*) FROM users_movies JOIN movies ON movies.movie_id = users_movies.movie_id JOIN directors ON directors.director_id = movies.director_id JOIN users ON users.user_id = users_movies.user_id GROUP BY users.name, directors.name;
