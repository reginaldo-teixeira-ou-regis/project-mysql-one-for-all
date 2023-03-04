DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    name_plan VARCHAR(75) NOT NULL,
    price_plan DECIMAL(6,2) NOT NULL
  );

CREATE TABLE users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(75) NOT NULL,
    age_user INT NOT NULL,
    id_plan INT NOT NULL,
    signature_date_user DATE NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES plans(id_plan)
  );

CREATE TABLE artists(
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    name_artist VARCHAR(75) NOT NULL
  );

CREATE TABLE albums(
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    name_album VARCHAR(75) NOT NULL,
    id_artist INT NOT NULL,
    release_year_album YEAR NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
  );

CREATE TABLE musics(
    id_music INT PRIMARY KEY AUTO_INCREMENT,
    name_music VARCHAR(100) NOT NULL,
    id_album INT NOT NULL,
    duration_music INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albums(id_album)
  );

CREATE TABLE following_artists(
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
    PRIMARY KEY (id_user, id_artist),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
  );

CREATE TABLE historic(
    id_user INT NOT NULL,
    id_music INT NOT NULL,
    reproduction_date_historic DATETIME NOT NULL,
    PRIMARY KEY (id_user, id_music),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_music) REFERENCES musics(id_music)
  );

INSERT INTO plans (name_plan, price_plan) VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO users (name_user, age_user, id_plan, signature_date_user) VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler', 46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 2, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander', 85, 3, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO artists (name_artist) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

    
INSERT INTO albums (name_album, id_artist, release_year_album) VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO musics (name_music, id_album, duration_music) VALUES
  ('BREAK MY SOUL', 1, 279),
  ('VIRGOS GROOVE', 1, 369),
  ('ALIEN SUPERSTAR', 1, 116),
  ('Dont Stop Me Now', 2, 203),
  ('Under Pressure', 3, 152),
  ('Como Nossos Pais', 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
  ('Samba em Paris', 6, 267),
  ('The Bards Song', 7, 244),
  ('Feeling Good', 8, 100);

INSERT INTO following_artists (id_user, id_artist) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO historic (id_user, id_music, reproduction_date_historic) VALUES 
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
