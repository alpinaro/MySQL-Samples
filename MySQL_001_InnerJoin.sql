-- create
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  country CHAR(2) NOT NULL,
  PRIMARY KEY (id)
);

-- insert
INSERT INTO users VALUES (1, 'John', 'Doe', 'j.d@vs.com', 'UK');
INSERT INTO users VALUES (2, 'Mary', 'Fraser', 'm.f@vs.com', 'DE');
INSERT INTO users VALUES (3, 'Jane', 'Smith', 'j.s@vs.com', 'MT');
INSERT INTO users VALUES (12, 'John', 'Jones', 'j.j@vs.com', 'MT');
INSERT INTO users VALUES (13, 'Peter', 'Williams', 'p.w@vs.com', 'UK');
INSERT INTO users VALUES (14, 'Tom', 'Taylor', 't.t@vs.com', 'FR');
INSERT INTO users VALUES (21, 'Kate', 'Davies', 'k.d@vs.com', 'SE');
INSERT INTO users VALUES (27, 'James', 'Brown', 'j.b@vs.com', 'PT');
INSERT INTO users VALUES (35, 'Joe', 'Thames', 'j.t@vs.com', 'SE');
INSERT INTO users VALUES (37, 'Michael', 'Wilson', 'm.w@vs.com', 'DE');

-- create
CREATE TABLE users_creds (
  id INT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  failed_logins INT NOT NULL,
  required_reset_password INT NOT NULL,
  FOREIGN KEY (id) REFERENCES users(id)
);

-- insert
INSERT INTO users_creds VALUES (1, 'user1', 'password1', 0, 0);
INSERT INTO users_creds VALUES (12, 'user12', 'password2', 1, 0);
INSERT INTO users_creds VALUES (13, 'user13', 'password4', 0, 1);
INSERT INTO users_creds VALUES (35, 'user30', 'password9', 1, 1);

-- fetch 

-- 1. Create an SQL Query which retrieves the id, name and surname of all registered users under country Malta.
SELECT id, name, surname FROM users WHERE country='MT';

-- 2. Create an SQL Query which retrieves the id, name, surname of all registered users that are NOT registered under country Portugal and France.
SELECT id, name, surname FROM users WHERE NOT country='PT';

-- 3. Create an SQL Query which retrieves the id, name and surname of all registered users which are still active.
SELECT users.id, users.name, users.surname FROM users INNER JOIN users_creds ON users.id = users_creds.id

-- 4. Create an SQL Query which retrieves the name, surname and emails of all registered users which requires a reset password.
SELECT users.name, users.surname, users.email FROM users INNER JOIN users_creds ON users.id = users_creds.id AND users_creds.required_reset_password = 1;
