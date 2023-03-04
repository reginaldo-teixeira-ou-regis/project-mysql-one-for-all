SELECT musics.name_music AS cancao,
    COUNT(historic.id_music) AS reproducoes
  FROM musics
  INNER JOIN historic ON historic.id_music = musics.id_music
  GROUP BY cancao ORDER BY reproducoes DESC, cancao ASC
  LIMIT 2;
