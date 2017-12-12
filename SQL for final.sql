create table registration(
  id serial primary key,
  registration varchar(100) not null);

 create table shows (
   id serial primary key,
   show_title varchar(100) not null,
   composer varchar(100) not null,
   lyricist varchar(100) not null,
   year integer not null,
   era varchar(100) not null
 );

 create table songs (
  id serial primary key,
  title varchar(100) not null,
  show_id integer not null references shows(id),
  range varchar(100) not null
);

create table song_registrations(
  id serial primary key,
  song_id integer references songs(id),
  registration_id integer references registration(id)
);



insert into registration (registration) values ('Classical Soprano');
insert into registration (registration) values ('Classical Turn');
insert into registration (registration) values ('Speech Mix');
insert into registration (registration) values ('Open Vowel Belt');
insert into registration (registration) values ('Closed Vowel Belt');
insert into registration (registration) values ('Pop Mix');
insert into registration (registration) values ('Pop Soprano');
insert into registration (registration) values ('Falsetto');

insert into shows (show_title, composer, lyricist, year, era) values ('Carousel', 'Richard Rodgers', 'Oscar Hammerstein II', 1945, 'Golden Age');
insert into shows (show_title, composer, lyricist, year, era) values ('Phantom of the Opera', 'Andrew Lloyd Webber', 'Charles Hart', 1986, 'Mega Musical');
insert into shows (show_title, composer, lyricist, year, era) values ('Spring Awakening', 'Duncan Sheik', 'Steven Sater', 2006, 'Pop/Rock');

insert into songs (title, show_id, range) values ('If I Loved You', 1, 'Bb3-Gb5');
insert into songs (title, show_id, range) values ('Soliloquy', 1, 'B2-G4');
insert into songs (title, show_id, range) values ('Mama Who Bore Me', 3, 'G3-A4');
insert into songs (title, show_id, range) values ('Left Behind', 3, 'D3-B4');
insert into songs (title, show_id, range) values ('Wishing You Were Somehow Here Again', 2, 'A3-G5');
insert into songs (title, show_id, range) values ('The Music of the Night', 2, 'Ab3-Ab5');

insert into song_registrations (song_id, registration_id) values (1, 8);
insert into song_registrations (song_id, registration_id) values (1, 2);

insert into song_registrations (song_id, registration_id) values (2, 1);
insert into song_registrations (song_id, registration_id) values (2, 2);

insert into song_registrations (song_id, registration_id) values (3, 3);
insert into song_registrations (song_id, registration_id) values (3, 6);
insert into song_registrations (song_id, registration_id) values (3, 2);

insert into song_registrations (song_id, registration_id) values (4, 2);
insert into song_registrations (song_id, registration_id) values (4, 7);

insert into song_registrations (song_id, registration_id) values (5, 8);
insert into song_registrations (song_id, registration_id) values (5, 2);

insert into song_registrations (song_id, registration_id) values (6, 1);
insert into song_registrations (song_id, registration_id) values (6, 2);
insert into song_registrations (song_id, registration_id) values (6, 3);
insert into song_registrations (song_id, registration_id) values (6, 7);
