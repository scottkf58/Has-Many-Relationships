-- SELECT * FROM users;

-- SELECT * FROM posts
-- WHERE users_id = 100;

SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.users_id = users.id
WHERE users_id = 200;