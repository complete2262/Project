create table puser (
num int not null primary key,
id varchar2(30) not null,
password varchar2(30) not null,
nickname varchar2(20) not null,
email varchar2(30) not null,
interest  varchar2(20) not null
);

CREATE SEQUENCE seq_puser
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;
------------------------------------------------------------------------

create table pboard (
num int,
seq int not null primary key,
title varchar2(30) not null,
nickname varchar2(20) not null,
content varchar2(150) not null,
cnt  int DEFAULT 0,
regdate date DEFAULT sysdate,
tag varchar2(30) not null
);

CREATE SEQUENCE seq_pboard
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

alter table pboard add
(CONSTRAINT fk_pboard  foreign key (num) REFERENCES puser(num));

------------------------------------------------------------------------

CREATE TABLE preply(
num int,
seq int,
content varchar2(100) not null,
nickname varchar2(20) not null,
regdate date DEFAULT sysdate
);

alter table preply add
(CONSTRAINT fk_preply  foreign key (num) REFERENCES puser(num));
alter table preply add
(CONSTRAINT fk_preply2  foreign key (seq) REFERENCES pboard(seq));


----------------------------------------------------------------------------
