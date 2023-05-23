-- Жанры
create table if not exists genre (
	id serial primary key,
	name varchar(60) not null,
	description text
);

-- Исполнители
create table if not exists singer (
	id serial primary key,
	name varchar(60) not null,
	birthday date
);

-- Кросс-таблица жанры-исполнители
create table if not exists genre_singer (
	genre_id integer not null references genre(id),
	singer_id integer not null references singer(id),
	constraint genre_singer_pk primary key (genre_id, singer_id)
);

-- Альбомы
create table if not exists album (
	id serial primary key,
	name varchar(60) not null,
	release_date date
);

-- Кросс-таблица исполнители-альбомы
create table if not exists singer_album (
	album_id integer not null references album(id),
	singer_id integer not null references singer(id),
	constraint singer_album_pk primary key (album_id, singer_id)
);

-- Треки
create table if not exists track (
	id serial primary key,
	name varchar(60) not null,
	avtor varchar(60) not null,
	duration timestamp,
	album_id integer not null references album(id)
);

-- Сборники
create table if not exists collection (
	id serial primary key,
	name varchar(60) not null,
	release_date date
);

-- Кросс-таблица треки-сборники
create table if not exists track_collection (
	track_id integer not null references track(id),
	collection_id integer not null references collection(id),
	constraint track_collection_pk primary key (track_id, collection_id)
);