CREATE TABLE SpotifyClone.favorite_musics(
    id_favorite INT NOT NULL AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_music INT NOT NULL,
    PRIMARY KEY (id_favorite, id_user, id_music),
    FOREIGN KEY (id_user) REFERENCES SpotifyClone.users(id_user),
    FOREIGN KEY (id_music) REFERENCES SpotifyClone.musics(id_music)
);

INSERT INTO SpotifyClone.favorite_musics(id_music, id_user) VALUES
  (10, 1), 
  (6, 1), 
  (3, 1),
  (4, 2),
  (1, 3), 
  (3, 3),
  (7, 4), 
  (4, 4), 
  (10, 5),
  (2, 5), 
  (4, 8), 
  (7, 9), 
  (3, 10);
