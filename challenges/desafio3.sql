SELECT 
    usr.nome_usuario AS "pessoa_usuaria", 
    COUNT(hst.id_musica ) AS "musicas_ouvidas", 
    ROUND(SUM(mus.duracao_musica)/60, 2) AS "total_minutos"
  FROM usuario usr
  JOIN historico hst ON usr.id_usuario = hst.id_usuario
  JOIN musicas mus ON hst.id_musica = mus.id_musica
  GROUP BY usr.nome_usuario
  ORDER BY usr.nome_usuario;
