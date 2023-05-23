create table if not exists department (
	id serial primary key,
	name varchar(60),
	headcount integer
);

create table if not exists employee (
	id serial primary key,
	name varchar(60),
	department_id integer not null references department(id),
	boss_id integer not null references employee(id)
);