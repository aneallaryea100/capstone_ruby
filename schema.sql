CREATE DATABASE my_catalog;

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(200),
    PRIMARY KEY (id) ); 

CREATE TABLE source (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(200),
    PRIMARY KEY (id) );

CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(200),
    last_name varchar(200),
    PRIMARY KEY (id) );

CREATE TABLE label (
    id INT GENERATED ALWAYS AS IDENTITY,
    title varchar(200),
    color varchar(200),
    PRIMARY KEY (id) );

CREATE TABLE book (
    id INT GENERATED ALWAYS AS IDENTITY,
    author_id INT,
    label_id INT,
    genre_id INT,
    publisher varchar(200),
    publish_date DATE,
    cover_state varchar(200),
    archived BOOLEAN,
    PRIMARY KEY (id) 
    ADD CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(id),
    ADD CONSTRAINT fk_book_label FOREIGN KEY (label_id) REFERENCES label(id),
    ADD CONSTRAINT fk_book_genre FOREIGN KEY (genre_id) REFERENCES genre(id)
    );

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200),
    author_id INT,
    label_id INT,
    source_id INT,
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    PRIMARY KEY (id),
    ADD CONSTRAINT fk_album_author FOREIGN KEY (author_id) REFERENCES author(id),
    ADD CONSTRAINT fk_album_label FOREIGN KEY (label_id) REFERENCES label(id),
    ADD CONSTRAINT fk_album_source FOREIGN KEY (source_id) REFERENCES source(id)
);

CREATE TABLE movie (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200),
    source_id INT,
    publish_date DATE,
    silent BOOLEAN,
    archived BOOLEAN,
    PRIMARY KEY (id),
    ADD CONSTRAINT fk_movie_source FOREIGN KEY (source_id) REFERENCES source(id)
);

CREATE TABLE game (
     id INT GENERATED ALWAYS AS IDENTITY,
     name VARCHAR(200),
     source_id INT,
     multiplayer BOOLEAN,
     publish_date DATE,
    last_played_at DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    ADD CONSTRAINT fk_game_source FOREIGN KEY (source_id) REFERENCES source(id)
);


    
