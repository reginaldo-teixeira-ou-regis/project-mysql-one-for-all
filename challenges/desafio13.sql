SELECT 
  CASE 
    WHEN users.age_user <= 30 THEN 'Até 30 anos'
    WHEN users.age_user BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
  END AS faixa_etaria,
    COUNT(DISTINCT users.id_user) AS total_pessoas_usuarias,
    COUNT(favorite_musics.id_favorite) AS total_favoritadas
FROM users
LEFT JOIN favorite_musics ON favorite_musics.id_user = users.id_user
GROUP BY faixa_etaria
ORDER BY 
  CASE faixa_etaria 
    WHEN 'Até 30 anos' THEN 1 
    WHEN 'Entre 31 e 60 anos' THEN 2
    ELSE 3 
  END;
