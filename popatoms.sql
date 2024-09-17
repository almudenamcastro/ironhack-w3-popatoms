CREATE DATABASE IF NOT EXISTS popatoms;

USE popatoms;

DROP TABLE IF EXISTS track, artist, chart, chart_update, chart_entry;

CREATE TABLE chart (
chart_id INT auto_increment PRIMARY KEY, 
name VARCHAR(50), 
description VARCHAR(400), 
country VARCHAR(50),
frequency VARCHAR(20)
);

CREATE TABLE artist (
artist_id INT auto_increment PRIMARY KEY, 
name VARCHAR(50)
);

CREATE TABLE track (
track_id INT auto_increment PRIMARY KEY, 
sp_id VARCHAR(50),
title VARCHAR(50),
album VARCHAR(50),
title_spotify VARCHAR(50),
artist_id INT,
colab BOOL,
release_date DATE,
release_year INT,
peak_rank INT,
peak_date DATE,
peak_year INT,
weeks INT,
sp_popularity FLOAT,
lustrum VARCHAR(50),
danceability FLOAT, 
energy FLOAT,
speechiness FLOAT, 
loudness FLOAT,
valence FLOAT,
acousticness FLOAT,
instrumentalness FLOAT,
liveness FLOAT,
tempo FLOAT,
duration FLOAT,
track_key FLOAT,
track_mode FLOAT,
FOREIGN KEY(artist_id) references artist(artist_id)
);

CREATE TABLE chart_update (
update_id INT PRIMARY KEY auto_increment,
chart_id INT,
update_date DATE,
FOREIGN KEY(chart_id) references chart(chart_id)
);

CREATE TABLE chart_entry (
update_id INT,
rank_nr TINYINT NOT NULL,
track_id INT NOT NULL,
FOREIGN KEY(update_id) references chart_update(update_id),
FOREIGN KEY(track_id) references track(track_id)
);

-- Add the Chart info: 
INSERT INTO chart (name, description, country, frequency)
VALUES ('hot 100',	'The week’s most popular current songs across all genres, ranked by streaming activity from digital music sources tracked by luminate, radio airplay audience impressions as measured by luminate and sales data as compiled by luminate.', 'USA', 'week');



