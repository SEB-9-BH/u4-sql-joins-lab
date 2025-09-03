\connect movies_lab_db;

-- Test 
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT mv.title, dir.name AS director_name
FROM directors dir
JOIN movies mv ON dir.director_id = mv.director_id
ORDER BY mv.title;

-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT mv.title, usr.name AS user_name
FROM movies mv
JOIN users_movies um ON mv.movie_id = um.movie_id
JOIN users usr ON um.user_id = usr.user_id
ORDER BY usr.name, mv.title;

-- 3. List the movies with the number of favorites they have.
SELECT mv.title, COUNT(um.user_id) AS favorite_count
FROM movies mv
LEFT JOIN users_movies um ON mv.movie_id = um.movie_id
GROUP BY mv.movie_id, mv.title
ORDER BY favorite_count DESC, mv.title;

-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT dir.name AS director_name, COUNT(um.user_id) AS total_favorites
FROM movies mv
JOIN directors dir ON mv.director_id = dir.director_id
LEFT JOIN users_movies um ON mv.movie_id = um.movie_id
GROUP BY dir.director_id, dir.name
ORDER BY total_favorites DESC, dir.name;

-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT usr.name AS user_name,
       dir.name AS director_name,
       COUNT(um.movie_id) AS favorite_count
FROM users usr
JOIN users_movies um ON usr.user_id = um.user_id
JOIN movies mv ON um.movie_id = mv.movie_id
JOIN directors dir ON mv.director_id = dir.director_id
GROUP BY usr.user_id, usr.name, dir.director_id, dir.name
ORDER BY usr.name, favorite_count DESC;
