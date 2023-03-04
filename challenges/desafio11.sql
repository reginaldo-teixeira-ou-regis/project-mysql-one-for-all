SELECT alb.name_album as album,
    COUNT(mus.id_music) AS favoritadas
  FROM albums alb
  JOIN musics mus ON alb.id_album = mus.id_album
  JOIN favorite_musics fav ON mus.id_music = fav.id_music
  GROUP BY album
  ORDER BY favoritadas DESC
  LIMIT 3;
