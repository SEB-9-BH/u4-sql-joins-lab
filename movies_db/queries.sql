\connect movies_lab_db;
-- Test query!!
SELECT * FROM users;

-- 1. List all the movie titles and their corresponding directors.

select movies.title ,directors.name from movies join directors on movies.director_id = directors.director_id;

-- 2. Select the movie title and user name for all of the "favorites" represented by the `users_movies` table.

select movies.title , users.name from movies join users_movies on users_movies.movie_id = movies.movie_id join users on users_movies.user_id = users.user_id ;

-- 3. List the movies with the number of favorites they have.

select movies.title , count(*) as favourites from movies join users_movies on users_movies.movie_id = movies.movie_id join users on users_movies.user_id = users.user_id  group by movies.movie_id;

-- 4. List the names of directors along with the number of favorites that exist for all of the movies they've made, ordered by number of favorites descending.

select directors.name , count(*) as favourites from directors left join movies on directors.director_id = movies.director_id join users_movies on movies.movie_id = users_movies.movie_id group by directors.name order by favourites desc;

-- 5. List the user name, director name and favorite count of all of the user/director combinations (based on the `users_movies` table).

select users.name , directors.name , count(*) as favourites from users join users_movies on users.user_id = users_movies.user_id join movies on movies.movie_id = users_movies.movie_id join directors on directors.director_id= movies.director_id group by users.name , directors.name;
