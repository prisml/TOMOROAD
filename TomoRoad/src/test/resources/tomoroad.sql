-- member 테이블 프로필경로 컬럼 추가
alter table member add(profile varchar2(100))
update member set profile = '${pageContext.request.contextPath}/resources/profile/kakao.jpg'

---------- drop table ------------
drop table station_connect;
drop table review_comment;
drop table advertisement;
drop table burn_comment;
drop table burn_board;
drop table check_in;
drop table friend;
drop table hashtag;
drop table interested_place;
drop table review;
drop table place;
drop table station;
drop table member;
drop table manager;
---------- drop sequence -----------
drop sequence place_seq;
drop sequence review_seq;
drop sequence review_comment_seq;
drop sequence hashtag_seq;
drop sequence burn_board_seq;
drop sequence burn_comment_seq;
drop sequence advertisement_seq;

------------ create ------------
create table member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	name varchar2(100) not null,
	sex varchar2(100) not null,
	tel varchar2(100) not null
);

create table station(
	name varchar2(100) primary key,
	detail clob not null,
	stayed_time number default 0
);

create table place(
	no number primary key,
	name varchar2(100) not null,
	station_name varchar2(100) not null,
	constraint fk_station_name foreign key(station_name) references station(name),
	area varchar2(100) not null
);
alter table place add lat number not null; --추가부탁드려요 테이블비우고.
alter table place add lng number not null; --추가부탁드려요 테이블비우고.  
create sequence place_seq nocache;


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
	constraint fk_place_no foreign key(place_no) references place(no),
	constraint fk_member_id foreign key(member_id) references member(id)	
);

create sequence review_seq nocache;

create table review_comment(
	no number primary key,	
	content clob not null,
	posted_time date not null,
	recommend number default 0,
	review_no number, 
	member_id varchar2(100) not null,
	constraint fk_review_comment_no foreign key(review_no) references review(no),
	constraint fk_review_comment_member_id foreign key(member_id) references member(id)	
);
create sequence review_comment_seq nocache;

create table hashtag(
	no number primary key,
	word varchar2(100) not null,
	review_no number not null,
	constraint fk_hashtag_review_no foreign key(review_no) references review(no)
);
create sequence hashtag_seq nocache;

create table burn_board(
	no number primary key,
	title varchar2(100) not null,
	posted_time date not null,
	content clob not null,
	station_name varchar2(100) not null,
	member_id varchar2(100) not null,
	hits number default 0,	 
	constraint fk_burn_station_name foreign key(station_name) references station(name),
	constraint fk_burn_board_id foreign key(member_id) references member(id)	
); 
 
create table review_recommend(
	member_id varchar2(100),
	review_no number,
	primary key(member_id, review_no),
	constraint fk_reivew_recommend_id foreign key(member_id) references member(id),
	constraint fk_review_recommend_no foreign key(review_no) references review(no)	
)

drop table review_recommend

create sequence burn_board_seq nocache;


create table burn_comment(
	no number primary key,
	content clob not null,
	posted_time date not null,
	recomment number default 0,
	burn_no number not null,
	member_id varchar2(100) not null,
	constraint fk_burn_comment_no foreign key(burn_no) references burn_board(no),
	constraint fk_burn_comment_id foreign key(member_id) references member(id)	
);
create sequence burn_comment_seq nocache;
alter table burn_comment add state varchar2(100) default 'comment'; --추가부탁드려요 테이블비우고.

create table advertisement(
	no number primary key,
	link varchar2(1000) not null
);
create sequence advertisement_seq nocache;


create table manager(
	id varchar2(100) primary key,
	password varchar2(100) not null
);

create table friend(
	sender_id varchar2(100) not null,
	receiver_id varchar2(100) not null,
	state varchar2(100) not null,
	put_date date not null,
	constraint fk_sender_id foreign key(sender_id) references member(id),
	constraint fk_receiver_id foreign key(receiver_id) references member(id),
	primary key(sender_id,receiver_id)
);

create table interested_place(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_interested_id foreign key(member_id) references member(id),
	constraint fk_interested_no foreign key(place_no) references place(no)	
);

create table check_in(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_check_id foreign key(member_id) references member(id),
	constraint fk_check_no foreign key(place_no) references place(no)	
);

create table station_connect(
	depart varchar2(100),
	arrived varchar2(100),
	spent_time number default 0,
	constraint fk_connect_depart foreign key(depart) references station(name),	
	constraint fk_connect_arrived foreign key(arrived) references station(name),
	primary key (depart,arrived)	
);

--------------연습장-------------


insert into member values('java','1234','아이유','여자','112');


insert into STATION(name,detail)
values('서울역','주소 : 서울특별시 용산구 한강대로 405 서울역
							지번-서울특별시 용산구 동자동 43-205 서울역
				전화번호 : 1544-7788
				관련정보 : 승차권 예매, 승차권 이용안내, 기차시간 및 운임표
				부가정보 : 기차역 검색, 고객센터, 유실물 찾기');



insert into burn_board values(burn_board_seq.nextval,'연습제목',sysdate,'연습내용','서울역','java',0);
delete from BURN_BOARD where no='2'


insert into station values('밀양역','미르피아',10);

select * from member;
select * from BURN_BOARD;
select * from STATION;
select * from place;


select * from BURN_COMMENT;


select A.* from(select b.no, b.title, b.station_name, b.member_id, b.posted_time, c.commentcount 
from BURN_BOARD b, (select burn_no, count(*) as commentcount from burn_comment where state='comment' group by burn_no) c
where b.no = c.burn_no) A
where rnum between 1 and 5



select burn_no,count(*) from burn_comment where state='comment' group by burn_no;


insert into station(name,detail) values('전주','주소 : 전라북도 전주시 덕진구 동부대로 680 전주역
														지번-전라북도 전주시 덕진구 우아동3가 235
												전화번호 : 1544-7788
												관련정보 : 승차권 예매, 승차권 이용안내, 기차시간 및 운임표
												부가정보 : 기차역 검색, 고객센터, 유실물 찾기');
												
insert into place values(place_seq.nextval,'한옥마올','전주','전라도');
insert into place values(place_seq.nextval,'동대문','서울역','서울');

select sysdate from dual
	
insert into MEMBER values('java','123','홍길동','여','01012341234');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'전주 한옥마을 후기','한번도 가본 적 없음ㅎㅎ',sysdate,3,'1','java');


insert into station(name,detail) values('부산','주소 : 부산광역시 동구 중앙대로 206 한국철도공사부산지역본부
													지번-부산광역시 동구 초량동 1187-1
												전화번호 : 1544-7788');
insert into place values(place_seq.nextval,'해운대','부산','영남지방');
select * from place where name LIKE '%해운대%'; 
select no,title,member_id,to_char(posted_time,'YYYY/MM/DD'),hits,star from review where title like '%전주%' or content like '%전주%';
select title from review where title like '%전주%' or content like '%전주%'
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'전주 한옥마을 후기','한번도 가본 적 없음ㅎㅎ',sysdate,3,'1','java');

insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'부산 해운대 후기입니다','ㅎㅎㅎㅎ재밌어요',sysdate,2,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'얼른 보세요ㅎㅎ','부산재밌어요',sysdate,3,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'재밌어요재밌어!!!!','부산 재밌어요. 재밌는데요 부산이 재밌는데 재밌어요',sysdate,3,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'부산역에 관하여','부산역 갔다왔는데요. 유명한거 부산호떡,부산갈매기,밀면,해운대,좋아좋아졸ㅇ나라ㅓㅈㅋㅋㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ길이테스틍ㅇㅇㅇㅇ길어도 이게 올라갈까?ㅠㅠㅠ지금 잠와죽겠음ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ하ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ안녕나연ㄴㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ',sysdate,3,'2','java');

select content from review where content like '%부%';

SELECT      TRIM(REGEXP_SUBSTR(ORG_DATA, '[^,]+', 1, LEVEL)) AS SPLIT_DATA
FROM        (select content AS ORG_DATA from review where content like '%부%';)
CONNECT BY  INSTR(ORG_DATA, '부산', 1, LEVEL - 1) > 0;


select content from review where content like '%부산%';

select * from review where title like '%부산%' and content like '%부산%';
select title from review where title like '%부산%';
select content from review where content like '%부산%';
select title from review where content like '%부산%';

select 

insert into friend values('java','goni','수락',sysdate);


		
select * from (select row_number() over(order by no desc) rnum, no, title, station_name, member_id, posted_time, hits
from (select * from BURN_BOARD where station_name = '서울역')) where rnum between 1 and 5


insert into review(no,title,content,posted_time,star,place_no,member_id)
values(review_seq.nextval,'test','test',sysdate,5,1,'java');

select * from REVIEW 

insert into review_recommend values('java',3)

select count(*) from review_recommend where review_no = 3
select * from review_recommend

select * from REVIEW 

select * from member
select id from member where password='aaaa' and name='aaaa' and tel='aaaa'
select distinct station distinct station_name;  

select A.*
		from(select row_number()
		over(order by no desc)
		rnum, no, title, member_id, place_no, content,
		to_char(posted_time,'YYYY/MM/DD HH24:MM')
		as posted_time from review r)
		A
		where rnum between 1 and 5
		
		

select row_number() over(order by re.no desc) rnum, 
		re.no, re.title, re.member_id, p.name, p.no, re.content, to_char(posted_time,'YYYY/MM/DD HH24:MM')
		as posted_time 
		from review re, place p
		where re.place_no=p.no
		
		
update review set hits=hits+1 where no=4;
select * from review;
select * from place; 

select r.no, r.title, r.content, r.posted_time, r.star, r.place_no, r.member_id, r.hits, p.name 
from review r, place p
where   r.no=4 and r.place_no=p.no
select * from friend 

select sender_id from friend where sender_id in ('java1','goni') and receiver_id in ('java1','goni') and state = '수락'
