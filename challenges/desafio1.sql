DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(75) NOT NULL,
    valor_plano DECIMAL(6,2) NOT NULL
  );

CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(75) NOT NULL,
    idade_usuario INT NOT NULL,
    id_plano INT NOT NULL,
    data_assinatura_usuario DATE NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
  );

CREATE TABLE artistas(
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(75) NOT NULL
  );

CREATE TABLE albuns(
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(75) NOT NULL,
    id_artista INT NOT NULL,
    ano_lancamento_album YEAR NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
  );

CREATE TABLE musicas(
    id_musica INT PRIMARY KEY AUTO_INCREMENT,
    nome_musica VARCHAR(100) NOT NULL,
    id_album INT NOT NULL,
    duracao_musica INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albuns(id_album)
  );

CREATE TABLE seguindo_artistas(
    id_usuario INT NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
  );

CREATE TABLE historico(
    id_usuario INT NOT NULL,
    id_musica INT NOT NULL,
    data_reproducao_historico DATETIME NOT NULL,
    PRIMARY KEY (id_usuario, id_musica),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_musica) REFERENCES musicas(id_musica)
  );

INSERT INTO planos (nome_plano, valor_plano) VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO usuario (nome_usuario, idade_usuario, id_plano, data_assinatura_usuario) VALUES
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

INSERT INTO artistas (nome_artista) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

    
INSERT INTO albuns (nome_album, id_artista, ano_lancamento_album) VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO musicas (nome_musica, id_album, duracao_musica) VALUES
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

INSERT INTO seguindo_artistas (id_usuario, id_artista) VALUES
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

INSERT INTO historico (id_usuario, id_musica, data_reproducao_historico) VALUES 
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
