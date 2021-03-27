CREATE database if not exists user_data;

USE user_data;
DROP table if exists comment;
DROP table if exists post;
DROP table if exists user; 

CREATE TABLE user(
	id int(11) not null auto_increment,
	username varchar(50) not null,
	password varchar(50) not null, 
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	email varchar(30) not null,
	dob date not null, 
	primary key (id),
	unique (username)
);

CREATE TABLE post(
	id int (11) not null auto_increment,
	user_id int(11) not null,
	published_at timestamp default current_timestamp not null,
	post_text text not null,
	primary key (id),
	foreign key (user_id) references user(id) 
);

CREATE TABLE comment(
	id int(11) not null auto_increment, 
	user_id int(11) not null,
	post_id int(11) not null,
	published_at timestamp default current_timestamp not null,
	comment_text text not null,
	primary key (id),
	foreign key(user_id) references user(id),
	foreign key (post_id) references post(id)
);