USE popatoms;

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
    
SELECT track_key, COUNT(track_id), 
	CASE 
		WHEN track_key = 1 THEN -5 
		WHEN track_key = 3 THEN -3
		WHEN track_key = 5 THEN -1
		WHEN track_key = 7 THEN 1
		WHEN track_key = 8 THEN -4
		WHEN track_key = 9 THEN 3
		WHEN track_key = 10 THEN -2
		WHEN track_key = 11 THEN 5
		ELSE track_key
		END as norm_key
FROM track
GROUP BY track_key
ORDER BY norm_key;


SELECT DISTINCT LEFT(t.title, 1) AS first_letter
FROM track t
JOIN chart_entry ce ON t.track_id = ce.track_id
JOIN chart_update cu ON ce.update_id = cu.update_id
JOIN chart c ON cu.chart_id = c.chart_id
WHERE t.weeks is not null
ORDER BY first_letter;