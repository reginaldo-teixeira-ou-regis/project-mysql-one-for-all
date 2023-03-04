SELECT 
    usr.name_user AS "pessoa_usuaria", 
    COUNT(hst.id_music ) AS "musicas_ouvidas", 
    ROUND(SUM(mus.duration_music)/60, 2) AS "total_minutos"
  FROM users usr
  JOIN historic hst ON usr.id_user = hst.id_user
  JOIN musics mus ON hst.id_music = mus.id_music
  GROUP BY usr.name_user
  ORDER BY usr.name_user;
