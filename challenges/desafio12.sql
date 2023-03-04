SELECT art.name_artist AS artista,
    CASE
      WHEN COUNT(fav.id_favorite) >= 5 THEN 'A'
      WHEN COUNT(fav.id_favorite) >= 3 THEN 'B'
      WHEN COUNT(fav.id_favorite) >= 1 THEN 'C'
      ELSE '-'
    END AS ranking
  FROM artists art
  JOIN albums alb ON art.id_artist = alb.id_artist
  JOIN musics mus on alb.id_album = mus.id_album
  LEFT JOIN favorite_musics fav ON mus.id_music = fav.id_music
  GROUP BY art.id_artist
  ORDER BY COUNT(fav.id_favorite) DESC, art.name_artist;
