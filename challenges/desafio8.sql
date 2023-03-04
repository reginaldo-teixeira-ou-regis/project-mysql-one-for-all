SELECT artists.name_artist AS artista, albums.name_album AS album
  FROM artists
  INNER JOIN albums ON albums.id_artist = artists.id_artist
  WHERE artists.name_artist = 'Elis Regina'
  ORDER BY album;
