---------- drop table ------------
drop table station_connect;
drop table station_reported;
drop table review_comment;
drop table review_recommend;
drop table advertisement;
drop table burn_comment;
drop table burn_board;
drop table check_in;
drop table friend;
drop table hashtag;
drop table interested_place;
drop table review;
drop table place;
drop table manager;
drop table bucket;
drop table station;
drop table member;
---------- drop sequence -----------
drop sequence place_seq;
drop sequence review_seq;
drop sequence review_comment_seq;
drop sequence hashtag_seq;
drop sequence burn_board_seq;
drop sequence burn_comment_seq;
drop sequence advertisement_seq;






----member--------
create table member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	name varchar2(100) not null,
	sex varchar2(100) not null,
	tel varchar2(100) not null,
	profile varchar2(100) default '/tomoroad/resources/img/profiles/kakao.jpg' not null
);

create table manager(
	id varchar2(100) primary key,
	password varchar2(100) not null
);

------- station -------
create table station(
	name varchar2(100) primary key, --역 이름
	simple_detail varchar2(100) not null, --역 간단 설명
	detail clob not null, --역 설명
	section varchar2(100) not null, --행정구역
	img varchar2(100) not null, --이미지 파일명
	lat number not null,
	lng number not null
);


------ place --------
create table place(
	no number primary key,
	name varchar2(100) not null,
	station_name varchar2(100) not null,
	area varchar2(100) not null,
	constraint fk_station_name foreign key(station_name) references station(name) on delete cascade
);
create sequence place_seq nocache;


-------- review ----------
create table review(
	no number primary key,
	title varchar2(100) not null,
	content clob not null,
	posted_time date not null,
	recommend number default 0,
	hits number default 0,
	star number not null,
	place_no number not null,
	member_id varchar2(100) not null,
	constraint fk_place_no foreign key(place_no) references place(no) on delete cascade,
	constraint fk_member_id foreign key(member_id) references member(id) on delete cascade
);

create sequence review_seq nocache;



----------- review comment ---------------
create table review_comment(
	no number primary key,	
	content clob not null,
	posted_time date not null,
	recomment number default 0,
	review_no number, 
	state varchar2(100) default 'comment' not null,
	member_id varchar2(100) not null,
	constraint fk_review_comment_no foreign key(review_no) references review(no) ON DELETE CASCADE,
	constraint fk_review_comment_member_id foreign key(member_id) references member(id) on delete cascade
);
create sequence review_comment_seq nocache;


------------ review recommend -----------------
create table review_recommend(
	member_id varchar2(100),
	review_no number,
	primary key(member_id, review_no),
	constraint fk_reivew_recommend_id foreign key(member_id) references member(id) on delete cascade,
	constraint fk_review_recommend_no foreign key(review_no) references review(no) ON DELETE CASCADE
);



----------- hashtag-----------------
create table hashtag(
	no number primary key,
	word varchar2(100) not null,
	review_no number not null,
	constraint fk_hashtag_review_no foreign key(review_no) references review(no) on delete cascade
);
create sequence hashtag_seq nocache;



------------ burn board --------------
create table burn_board(
	no number primary key,
	title varchar2(100) not null,
	posted_time date not null,
	content clob not null,
	station_name varchar2(100) not null,
	member_id varchar2(100) not null,
	hits number default 0,	 
	constraint fk_burn_station_name foreign key(station_name) references station(name) on delete cascade,
	constraint fk_burn_board_id foreign key(member_id) references member(id) on delete cascade	
); 
create sequence burn_board_seq nocache;


-------------- burn comment ------------
create table burn_comment(
	no number primary key,
	content clob not null,
	posted_time date not null,
	recomment number default 0,
	burn_no number not null,
	member_id varchar2(100) not null,
	state varchar2(100) default 'comment',
	constraint fk_burn_comment_no foreign key(burn_no) references burn_board(no) ON DELETE CASCADE,
	constraint fk_burn_comment_id foreign key(member_id) references member(id) on delete cascade	
);
create sequence burn_comment_seq nocache;


------------------ advertisement --------------
create table advertisement(
	no number primary key,
	link varchar2(1000) not null
);
create sequence advertisement_seq nocache;


-------------------- friend --------------------
create table friend(
	sender_id varchar2(100) not null,
	receiver_id varchar2(100) not null,
	state varchar2(100) not null,
	put_date date not null,
	constraint fk_sender_id foreign key(sender_id) references member(id) on delete cascade,
	constraint fk_receiver_id foreign key(receiver_id) references member(id) on delete cascade,
	primary key(sender_id,receiver_id)
);


--------------- interested place -------------
create table interested_place(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_interested_id foreign key(member_id) references member(id) on delete cascade,
	constraint fk_interested_no foreign key(place_no) references place(no) on delete cascade	
);


create table check_in(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_check_id foreign key(member_id) references member(id) on delete cascade,
	constraint fk_check_no foreign key(place_no) references place(no) on delete cascade	
);

create table station_connect(
	depart varchar2(100),
	arrived varchar2(100),
	spent_time number default 0,
	constraint fk_connect_depart foreign key(depart) references station(name) on delete cascade,	
	constraint fk_connect_arrived foreign key(arrived) references station(name) on delete cascade,
	primary key (depart,arrived)	
);


--검색순위테이블
create table station_reported(
  name varchar2(100) primary key,
  hit number default 1, --검색된 수
  constraint fk_station_reported_name foreign key(name) references station(name) on delete cascade 
);


create table bucket(
	id varchar2(100),
	name varchar2(100),
	primary key(id,name),
	constraint fk_bucket_id foreign key(id) references member(id) on delete cascade,
	constraint fk_bucket_name foreign key(name) references station(name) on delete cascade
);

create table travel(
 	id varchar2(100),
 	route varchar2(100),
	flag varchar2(100) not null ,
 	constraint fk_travel_id foreign key(id) references member(id) on delete cascade,
 	primary key (id,route)
);


create table message(
	m_no number primary key,
	m_sender varchar2(100) not null,
	m_receiver varchar2(100) not null,
	m_time date not null,
	m_content clob not null,
	m_checked number default 1,
	constraint fk_m_sender foreign key(m_sender) references member(id) ON DELETE CASCADE,
	constraint fk_m_receiver foreign key(m_receiver) references member(id) ON DELETE CASCADE
);
create sequence message_sequence nocache;
