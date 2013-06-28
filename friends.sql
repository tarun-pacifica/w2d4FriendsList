drop database friendlist;
CREATE DATABASE friendlist;
\c friendlist


CREATE TABLE friends (
  id serial8 primary key,
  name varchar(200),
  description varchar(700),
  interests varchar(800),
  age smallint,
  gender char(1)
);

