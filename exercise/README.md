# Many to many relationships: Using join tables!

## Introduction

In this lab you will be writing queries to gain insight into our movies database. The `movies_lab_db` consists of four tables.

- The `movies` table is comprised of several movie instances which have a `title`, `synopsis` and `director_id`.
- The `directors` table is a collection of directors, storing only their `name` as a string.
- The `users` table simply holds user records. Like the `directors` table, these records only store a `name` string of a user. 
- The `users_movies` table represents a many to many relationship between the users table and the movies table. These types of tables are sometimes referred to as "join tables". 

The naming of the table ("`users_movies`") might sound strange, but it is a common naming convention you will certainly come across. This is just a concatenation of the two table names that it is joining. 

Sometimes, the join table represents an idea that lends itself to a better name. In this case, you could alternatively name the table `favorites`, but it is good practice to become familiar with this naming convention.

## Getting Started
1. From the current lab folder you will need to make sure the database, tables, and seed data have been created:

1. First run the `seed.sql` file to setup the database: `psql -f seed.sql` (from the movies_db folder!)

2.  Then you need to create the `directors`, `movies`, `users` & `users_movies` tables.
- `psql -f directors.sql`
- `psql -f movies.sql`
- `psql -f users.sql`
- `psql -f users_movies.sql`

After that, you are all set to write the queries requested in `queries.sql`.

## Instructions
For this lab, you are expected to use the psql command line interface.

See the `queries.sql` file inside of the movies_db directory.

You can run your queries in the psql shell with the `\i` command: `\i ./queries.sql` or directly in the terminal:

**`psql -f queries.sql`**

Here is an example:

```
$ psql movies_lab_db

movies_lab_db=# \i queries.sql
 id |  name
 ----+---------
 1 | John
 2 | Ari
 3 | Ramsey
 4 | Drew
 5 | J
 6 | Dominic
(6 rows)

movies_lab_db=#
```

Based on the output above, the `queries.sql` file includes a `SELECT * FROM users;` query.

**Remember to run the SQL file in the terminal or shell as you solve each query.**
