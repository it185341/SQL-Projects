drop table if exists reservation;
drop table if exists marina;
drop table if exists boat;
drop table if exists sailor;

-- create table boat
create table boat
    (bid integer not null constraint c_bid primary key,
     bname varchar(40),
     color varchar(40) 
     constraint c_color check (color in ('Red','Blue','Light Green','Yellow')));

-- create table marina
create table marina
    (mid integer not null constraint m_key primary key,
     name varchar(40) not null,
    capacity integer);

-- create table sailor
create table sailor 
    (sid integer not null constraint c_sid primary key,
     sname varchar(40),
     rating integer constraint c_rating check (rating between 1 and 10),
     age real constraint c_age check (age < 18 OR age = 18));

-- create table reservation.
create table reservation(
    sid integer not null constraint f_key1 references sailor(sid) on delete cascade on update cascade,
    bid integer not null constraint f_key2 references boat(bid) on delete restrict on update restrict
                         constraint c_bid check (bid not in (999)),
    mid integer constraint f_key3 references marina(mid) on delete set null on update set null, 
    r_date date not null constraint c_date check (r_date > '02/04/1998'), 
    constraint p_key primary key(sid,bid,r_date));

-- inserting rows into the sailor table
INSERT INTO sailor(sid,sname,rating,age) VALUES (2, 'John', 6, 17);
INSERT INTO sailor(sid,sname,rating,age) VALUES (11, 'Maria', 10, 18);
INSERT INTO sailor(sid,sname,rating,age) VALUES (12, 'Thanos', 7, 14);
INSERT INTO sailor(sid,sname,rating,age) VALUES (13, 'John', 9, 18);
INSERT INTO sailor(sid,sname,rating,age) VALUES (1, 'Xristina', 10, 17);
INSERT INTO sailor(sid,sname,rating,age) VALUES (15, 'Theo', 10, 13);
INSERT INTO sailor(sid,sname,rating,age) VALUES (16, 'Leo', 5, 13);
INSERT INTO sailor(sid,sname,age) VALUES (17,'Eleftheria',17);
INSERT INTO sailor(sid,sname,rating,age) VALUES (19,'Polycarp',1,16);
INSERT INTO sailor(sid,sname,rating,age) VALUES (27,'Marianthi',8,15);
INSERT INTO sailor(sid,sname,rating,age) VALUES (37,'Kostas',8,14);


-- inserting rows into the marina table
INSERT INTO marina(mid,name,capacity) VALUES(33,'Porto Carras',300);
INSERT INTO marina(mid,name,capacity) VALUES(5,'Kalamaria',105);
INSERT INTO marina(mid,name,capacity) VALUES(1,'Platamonas',32);
INSERT INTO marina(mid,name,capacity) VALUES(7,'Poseidi',19);
INSERT INTO marina(mid,name,capacity) VALUES(2,'Ouranoupolis',105);

-- inserting rows into the boat table
INSERT INTO boat(bid,bname,color) VALUES(88,'Sofia','Blue');
INSERT INTO boat(bid,bname,color) VALUES(17,'Agia Aikaterini','Light Green');
INSERT INTO boat(bid,bname,color) VALUES(13,'Panagis','Yellow');
INSERT INTO boat(bid,bname,color) VALUES(1,'Agios Nikolas','Red');
INSERT INTO boat(bid,bname,color) VALUES(72,'Christinaki','Red');
INSERT INTO boat(bid,bname,color) VALUES(19,'Delos','Light Green');
INSERT INTO boat(bid,bname,color) VALUES(77,'Agios Georgios','Blue');

-- inserting rows into the reservation table
-- data format '04/27/2001' = 'MM/DD/YYYY'
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(2,88,7,'1999-02-17');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(12,17,2,'1998-05-17');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(11,17,2,'1999-01-17');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(13,13,7,'2003-01-13');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(11,13,33,'2000-05-05');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,1,33,'2000-05-05');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,13,33,'2000-05-06');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,17,33,'2000-05-07');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,19,33,'2000-05-08');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,72,33,'2000-05-09');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,88,33,'2000-05-10');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(1,77,2,'2000-08-10');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(19,13,33,'1999-10-12');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(27,88,7,'2000-06-11');
INSERT INTO reservation(sid,bid,mid,r_date) VALUES(37,72,2,'2001-04-27');
