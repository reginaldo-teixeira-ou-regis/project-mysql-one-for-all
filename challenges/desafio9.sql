SELECT COUNT(*) AS musicas_no_historico FROM historic
  INNER JOIN users ON users.id_user = historic.id_user
  WHERE users.name_user = 'Barbara Liskov';
