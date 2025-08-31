drop table if exists movie;
drop table if exists participation;
drop table if exists cinema;


create table movie ( 
title varchar(50) not null constraint p_k_movie primary key, 
stock_video integer, 
stock_dvd integer, 
production_company varchar(50), 
price_video integer, 
price_dvd integer 
); 




create table participation ( 
movie_title varchar(50) not null, 
actor_last_name varchar(50) not null, 
actor_first_name varchar(50), 
constraint p_k_participation primary key (movie_title, actor_last_name) 
); 


create table cinema ( 
hall varchar(50) not null, 
movie_title varchar(50) not null, 
weeks integer, 
constraint p_k_cinema primary key (hall, movie_title) 
); 




insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('A night at the opera', 5, 24, 'Fox', 40, 25);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('Pretty woman', 10, 18, 'TouchStone', 45, 32);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('Prince of Tides', 5, 10, 'Columbia', 35, 30);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('The way we were', 15, 20, 'Columbia', 41, 37);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('American Made', 10, 12, 'Universal', 38, 32);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('The Godfather', 18, 20, 'Paramaount', 47, 40);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('Schindler’s List', 28, 19, 'Universal', 50, 42);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('Apocalypse Now', 8, 8, 'Universal', 47, 34);
insert into movie(title, stock_video, stock_dvd, production_company, price_video, price_dvd) values ('Blade Runner 2049', 10, 10, 'Columbia', 29, 22);

insert into participation  (movie_title, actor_last_name, actor_first_name) values ('A night at the opera', 'Marx Brothers', '-');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Pretty woman', 'Alexander', 'Jason');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Pretty woman', 'Gere', 'Richard');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Pretty woman', 'Roberts', 'Julia');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Prince of Tides', 'Streisand', 'Barbra');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Prince of Tides', 'Nolte', 'Nick');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Prince of Tides', 'Danner', 'Blythe');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The way we were', 'Redford', 'Robert');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The way we were', 'Dillman', 'Bradford');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The way we were', 'Streisand', 'Barbra');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('American Made', 'Cruise', 'Tom');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('American Made', 'Wright', 'Sarrah');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('American Made', 'Gleeson', 'Domhnall');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The Godfather', 'Brando', 'Marlon');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The Godfather', 'Pacino', 'Al');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('The Godfather', 'Can', 'James');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Schindler’s List', 'Neeson', 'Liam');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Schindler’s List', 'Fiennes', 'Ralph');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Schindler’s List', 'Kinglsley', 'Ben');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Apocalypse Now', 'Sheen', 'Martin');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Apocalypse Now', 'Brando', 'Marlon');
insert into participation  (movie_title, actor_last_name, actor_first_name) values ('Apocalypse Now', 'Duvall', 'Robert');

insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'A night in the opera', 24);
insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'Pretty woman', 35);
insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'Prince of Tides', 10);
insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'The way we were', 20);
insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'American Made', 12);
insert into cinema (hall, movie_title, weeks) values ('STER CENTURY', 'The Godfather', 20);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'Schindler’s List', 5);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'Apocalypse Now', 6);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'Blade Runner 2049', 14);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'A night in the opera', 28);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'Pretty woman', 28);
insert into cinema (hall, movie_title, weeks) values ('VILLAGE', 'Prince of Tides', 15);
insert into cinema (hall, movie_title, weeks) values ('ASSOS ODEON', 'The way we were', 31);
insert into cinema (hall, movie_title, weeks) values ('ASSOS ODEON', 'American Made', 5);
insert into cinema (hall, movie_title, weeks) values ('ASSOS ODEON', 'The Godfather', 35);
insert into cinema (hall, movie_title, weeks) values ('ASSOS ODEON', 'Schindler’s List', 41);
insert into cinema (hall, movie_title, weeks) values ('ASSOS ODEON', 'Apocalypse Now', 22);
insert into cinema (hall, movie_title, weeks) values ('METROPOLITAN', 'Blade Runner 2049', 12);
insert into cinema (hall, movie_title, weeks) values ('METROPOLITAN', 'A night in the opera', 18);
insert into cinema (hall, movie_title, weeks) values ('METROPOLITAN', 'Pretty woman', 16);
insert into cinema (hall, movie_title, weeks) values ('METROPOLITAN', 'Prince of Tides', 5);
insert into cinema (hall, movie_title, weeks) values ('METROPOLITAN', 'The way we were', 17);
insert into cinema (hall, movie_title, weeks) values ('TITANIA', 'American Made', 15);
insert into cinema (hall, movie_title, weeks) values ('TITANIA', 'The Godfather', 36);
insert into cinema (hall, movie_title, weeks) values ('TITANIA', 'Schindler’s List', 3);
insert into cinema (hall, movie_title, weeks) values ('TITANIA', 'Apocalypse Now', 8);
insert into cinema (hall, movie_title, weeks) values ('TITANIA', 'Blade Runner 2049', 7);


