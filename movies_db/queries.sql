\connect movies_lab_db;

-- Quick check
SELECT * FROM users;

-- 1. Show every movie title paired with its director
SELECT m.title, d.name AS director_name
FROM movies m
JOIN directors d ON m.director_id = d.director_id;

-- 2. Show each user's favorites: movie title + user name
SELECT u.name AS user_name, m.title AS movie_title
FROM users_movies um
JOIN users u   ON um.user_id = u.user_id
JOIN movies m  ON um.movie_id = m.movie_id;

-- 3. Count how many favorites each movie has
SELECT m.title,
       COUNT(um.user_id) AS favorites_total
FROM movies m
LEFT JOIN users_movies um ON m.movie_id = um.movie_id
GROUP BY m.movie_id, m.title
ORDER BY favorites_total DESC;

-- 4. Count how many favorites each director has across all their films
SELECT d.name AS director_name,
       COUNT(um.user_id) AS total_favorites
FROM directors d
JOIN movies m       ON d.director_id = m.director_id
LEFT JOIN users_movies um ON m.movie_id = um.movie_id
GROUP BY d.director_id, d.name
ORDER BY total_favorites DESC;

-- 5. For each user/director combo, count how many favorites exist
SELECT u.name AS user_name,
       d.name AS director_name,
       COUNT(*) AS favorites_count
FROM users_movies um
JOIN users u     ON um.user_id = u.user_id
JOIN movies m    ON um.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
GROUP BY u.user_id, u.name, d.director_id, d.name
ORDER BY favorites_count DESC, user_name;
