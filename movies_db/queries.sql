\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.
SELECT
  m.title,
  d.name AS director
FROM movies m
JOIN directors d ON d.director_id = m.director_id
ORDER BY m.title;


-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.
SELECT
  m.title,
  u.name AS user_name
FROM users_movies um
JOIN users  u ON u.user_id  = um.user_id
JOIN movies m ON m.movie_id = um.movie_id
ORDER BY u.name, m.title;


-- 3. List the movies with the number of favorites they have.
SELECT
  mo.title,
  COUNT(um.user_id) AS favorites_count_by_user
FROM movies mo
LEFT JOIN users_movies um ON um.movie_id = mo.movie_id
GROUP BY mo.movie_id, mo.title
ORDER BY favorites_count_by_user DESC, mo.title;


-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.
SELECT
  di.name AS director_name,
  COUNT(um.user_id) AS favorites_count_by_user
FROM directors di
JOIN movies m ON di.director_id = m.director_id
LEFT JOIN users_movies um ON um.movie_id = m.movie_id
GROUP BY di.director_id, di.name
ORDER BY favorites_count_by_user DESC;


-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).
SELECT
  u.name AS user_name,
  d.name AS director_name,
  COUNT(um.movie_id) AS favorites_count
FROM users u
JOIN users_movies um ON u.user_id = um.user_id
JOIN movies m ON m.movie_id = um.movie_id
JOIN directors d ON d.director_id = m.director_id
GROUP BY u.user_id, d.director_id
ORDER BY favorites_count DESC;

