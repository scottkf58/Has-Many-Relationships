CREATE USER has_many_users;

DROP DATABASE IF EXISTS has_many_blogs
CREATE DATABASE has_many_blogs WTIH OWNER has_many_users;
\c has_many_blogs


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(90),
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(180),
  url VARCHAR(510),
  content TEXT,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  user_id int REFERENCES users(id)
);


DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(510),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  user_id int REFERENCES users(id),
  post_id int REFERENCES posts(id)
);

\i scripts/blog_data.sql;