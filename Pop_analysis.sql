-- Duración Promedio de las Canciones por Año con 2 decimales  
SELECT release_year, ROUND(AVG(duration), 2) AS avg_duration
FROM track
GROUP BY release_year
ORDER BY release_year;

-- Tempo Promedio de las Canciones por Año con 2 decimales  
SELECT release_year, ROUND(AVG(tempo)) AS avg_tempo
FROM track
GROUP BY release_year
ORDER BY release_year;

-- Duración Promedio de las Canciones por lustro con 2 decimales 
SELECT 
    lustrum,
    ROUND(AVG(duration), 2) AS avg_duration
FROM track
GROUP BY lustrum
ORDER BY lustrum;

-- Tempo Promedio de las Canciones por Lustro con 2 decimales  
SELECT 
	lustrum, 
	ROUND(AVG(tempo)) AS avg_tempo
FROM track
GROUP BY lustrum
ORDER BY lustrum;

-- Popularidad relacionada con energía y danceability 
-- Hay que tener en cuenta que la popularidad es a día de hoy, 
-- asíque claro que las canciones antiguas son menos populares, 
-- además de que no estamos cogiendo en los dos primeros lustros 
-- solamente las más populares sino muchas populares.
SELECT 
    lustrum,
    ROUND(AVG(danceability),2) AS avg_danceability,
    ROUND(AVG(energy),2) AS avg_energy,
    ROUND(AVG(sp_popularity),2) AS avg_popularity
FROM 
    track
GROUP BY 
    lustrum
ORDER BY 
    lustrum;