SELECT artists.name_artist AS artista, albums.name_album AS album,
    COUNT(following_artists.id_user) AS pessoas_seguidoras
  FROM albums
  INNER JOIN artists ON artists.id_artist = albums.id_artist
  INNER JOIN following_artists ON following_artists.id_artist = artists.id_artist
  GROUP BY artista, album 
  ORDER BY pessoas_seguidoras DESC, artista, album;
