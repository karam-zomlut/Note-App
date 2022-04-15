BEGIN;

DROP TABLE IF EXISTS notes, users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE notes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (username, password, email) VALUES ('admin', 'password', 'admin@gmail.com');
INSERT INTO notes (user_id, title, body) VALUES 
(1, 'First Note', 'This is the first note'),
(1, 'Second Note', 'This is the second note'),
(1, 'Third Note', 'This is the third note'),
(1, 'Fourth Note', 'This is the fourth note'),
(1, 'Fifth Note', 'This is the fifth note');

COMMIT;
