drop table if exists movies_actors;

create table movies_actors (
  movie_title varchar(50) not null,
  actor_last_name varchar(50) not null,
  actor_first_name varchar(50),
  video_stock integer,
  dvd_stock integer,
  production_company varchar(50),
  video_price integer,
  dvd_price integer,
  constraint p_k_movies_actors primary key (movie_title, actor_last_name)
);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('A night at the opera', 'Marx Brothers', '-', 5, 24, 'Fox', 40, 25);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Pretty woman', 'Gere', 'Richard', 10, 18, 'TouchStone', 45, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Pretty woman', 'Roberts', 'Julia', 10, 18, 'TouchStone', 45, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values('Pretty woman', 'Alexander', 'Jason', 10, 18, 'TouchStone', 45, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Prince of Tides', 'Streisand', 'Barbra', 5, 10, 'Columbia', 35, 30);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Prince of Tides', 'Nolte', 'Nick', 5, 10, 'Columbia', 35, 30);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Prince of Tides', 'Danner', 'Blythe', 5, 10, 'Columbia', 35, 30);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The way we were', 'Redford', 'Robert', 15, 20, 'Columbia', 41, 37);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The way we were', 'Dillman', 'Bradford', 15, 20, 'Columbia', 41, 37);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The way we were', 'Streisand', 'Barbra', 15, 20, 'Columbia', 41, 37);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('American Made', 'Cruise', 'Tom', 10, 12, 'Universal', 38, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('American Made', 'Gleeson', 'Domhnall', 10, 12, 'Universal', 38, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('American Made', 'Wright', 'Sarrah', 10, 12, 'Universal', 38, 32);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The Godfather', 'Brando', 'Marlon', 18, 20, 'Paramount', 47, 40);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The Godfather', 'Pacino', 'Al', 18, 20, 'Paramount', 47, 40);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('The Godfather', 'Can', 'James', 18, 20, 'Paramount', 47, 40);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Schindler’s List', 'Neeson', 'Liam', 28, 19, 'Universal', 50, 42);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Schindler’s List', 'Fiennes', 'Ralph', 28, 19, 'Universal', 50, 42);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Schindler’s List', 'Kinglsley', 'Ben', 28, 19, 'Universal', 50, 42);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Apocalypse Now', 'Sheen', 'Martin',  8, 8, 'ZoeTrope', 47, 34);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Apocalypse Now', 'Brando', 'Marlon',  8, 8, 'ZoeTrope', 47, 34);
insert into movies_actors (movie_title, actor_last_name, actor_first_name, video_stock, dvd_stock, production_company, video_price, dvd_price) values ('Apocalypse Now', 'Duvall', 'Robert',  8, 8, 'ZoeTrope', 47, 34);



