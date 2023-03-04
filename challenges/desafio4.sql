SELECT usr.name_user as pessoa_usuaria,
    IF(YEAR(MAX(hst.reproduction_date_historic)) >= '2021', 'Ativa', 'Inativa')
    AS status_pessoa_usuaria
  FROM users usr
  JOIN historic hst ON hst.id_user = usr.id_user
  GROUP BY pessoa_usuaria
  ORDER BY pessoa_usuaria;
