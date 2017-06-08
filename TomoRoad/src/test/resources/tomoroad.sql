-- member 테이블 프로필경로 컬럼 추가
alter table member add(profile varchar2(100))
update member set profile = '${pageContext.request.contextPath}/resources/images/profile/kakao.jpg'
select * from member
update member set profile = 'java' where id = 'java'

update member set profile = null

select * from station
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

--station 테이블 컬럼추가(0607).
create table station(
	name varchar2(100) primary key, --역 이름
	simple_detail varchar2(100) not null, --역 간단 설명
	detail clob not null, --역 설명
	section varchar2(100) not null, --행정구역
	img varchar2(100) not null --이미지 파일명
);
--저는 테이블을 다 삭제한 상태에서 다시 작성하는 거라서 테이블 내용 자체를 바꿨는데
--테이블 다 삭제하지 않은 상태이시면 station 테이블만 지우고 아래 것들만 실행해주세요~
alter table station add simple_detail varchar2(100) not null;
alter table station add administrative_district varchar2(100) not null;
alter table station add img varchar2(100) not null;

delete from station

drop table station

select * from station

delete from place

drop table place

create table place(
	no number primary key,
	name varchar2(100) not null,
	station_name varchar2(100) not null,
	constraint fk_station_name foreign key(station_name) references station(name),
	area varchar2(100) not null
);
alter table place add lat number not null; --추가부탁드려요 테이블비우고. //위도
alter table place add lng number not null; --추가부탁드려요 테이블비우고. //경도
create sequence place_seq nocache;

select * from review_comment

delete from review

delete from hashtag

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

delete from burn_board
 
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

--------------------------------------------------연습장-------------------------------------------------


-----< member >-----
insert into member values('java','1234','아이유','여자','112');
insert into MEMBER values('java','123','홍길동','여','01012341234');

select * from member
select id from member where password='aaaa' and name='aaaa' and tel='aaaa'
select distinct station distinct station_name;  


-----< Station 정보 >-----
insert into station values('서울','하나의 특별시, 대한민국의 중심','주소: 서울특별시 용산구 한강대로 405 서울역 지번-서울특별시 용산구 동자동 43-205 서울역','Capital','서울');

insert into station values('광주','민주화의 횃불을 밝힌 도시, 광주','주소: 광주광역시 북구 무등로 235 광주역 지번-광주광역시 북구 중흥동 611-2 광주역','Honam','광주');
insert into station values('여수','국제 해양관광의 중심, 여수','주소: 전라남도 여수시 망양로 2 여수역 지번-전라남도 여수시 덕충동 61-7','Honam','여수');

insert into station values('구미','희망과 꿈이 이루어지는 긍정의 도시','주소: 경상북도 구미시 구미중앙로 76 지번-경상북도 구미시 원평동 1008-1','Youngnam','구미');
insert into station values('부산','젊음의 도시','주소: 부산광역시 동구 중앙대로 206 지번-부산광역시 동구 초량동 1187-1','Youngnam','부산');
insert into station values('대구','컬러풀 대구','주소: 대구광역시 북구 태평로 161 대구민자역사 지번-대구광역시 북구 칠성동2가 302-155','Youngnam','대구');
insert into station values('울산','울산은 당신을 위한다','주소: 울산광역시 울주군 삼남면 울산역로 177 울산역 지번-울산광역시 울주군 삼남면 신화리 88','Youngnam','울산');

insert into station values('동해','국내 최고의 일출명소','주소: 강원도 동해시 동해역길 69 지번-강원도 동해시 송정동 산24-22','Gwandong','동해');

insert into station values('대전','가장 살기 좋은 도시가 바로 대전','주소: 경상북도 구미시 구미중앙로 76 지번-경상북도 구미시 원평동 1008-1','Chungcheong','대전');

select name,simple_detail,section,img from station;

-----< place 정보 >-----
insert into place values(place_seq.nextval,'5·18 민주화운동 기록관','광주','Honam',100,40);
insert into place values(place_seq.nextval,'동대문','서울','Capital',320,500);
insert into place values(place_seq.nextval,'해운대','부산','Youngnam',400,200);

select * from place where name LIKE '%해운대%'; 


-----< burn >-----
insert into burn_board values(burn_board_seq.nextval,'연습제목',sysdate,'연습내용','서울','java',0);
delete from BURN_BOARD where no='2'

select * from BURN_COMMENT;


select A.* from(select b.no, b.title, b.station_name, b.member_id, b.posted_time, c.commentcount 
from BURN_BOARD b, (select burn_no, count(*) as commentcount from burn_comment where state='comment' group by burn_no) c
where b.no = c.burn_no) A
where rnum between 1 and 5



select burn_no,count(*) from burn_comment where state='comment' group by burn_no;


select * from (select row_number() over(order by no desc) rnum, no, title, station_name, member_id, posted_time, hits
from (select * from BURN_BOARD where station_name = '서울')) where rnum between 1 and 5

	
-----< review >-----
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'동대문 후기','ㅎㅎ',sysdate,3,'1','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'부산 해운대 후기입니다','ㅎㅎㅎㅎ재밌어요',sysdate,2,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'얼른 보세요ㅎㅎ','부산재밌어요',sysdate,3,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'재밌어요재밌어!!!!','부산 재밌어요. 재밌는데요 부산이 재밌는데 재밌어요',sysdate,3,'2','java');
insert into REVIEW(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'부산역에 관하여','부산역 갔다왔는데요. 유명한거 부산호떡,부산갈매기,밀면,해운대,좋아좋아',sysdate,3,'2','java');
insert into review(no,title,content,posted_time,star,place_no,member_id) values(review_seq.nextval,'test','test',sysdate,5,1,'java');

update review set hits=hits+1 where no=4;

select no,title,member_id,to_char(posted_time,'YYYY/MM/DD'),hits,star from review where title like '%전주%' or content like '%전주%';
select title from review where title like '%전주%' or content like '%전주%'
select content from review where content like '%부%';

select * from review_recommend

SELECT      TRIM(REGEXP_SUBSTR(ORG_DATA, '[^,]+', 1, LEVEL)) AS SPLIT_DATA
FROM        (select content AS ORG_DATA from review where content like '%부%';)
CONNECT BY  INSTR(ORG_DATA, '부산', 1, LEVEL - 1) > 0;


select content from review where content like '%부산%';

select * from review where title like '%부산%' and content like '%부산%';
select content from review where content like '%부산%';
select title from review where content like '%부산%';


select * from REVIEW;

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

update member set profile = '/tomoroad/resources/img/profiles/java.jpg' where id = 'java'
update member set profile = '/tomoroad/resources/img/profiles/kakao.jpg'

select * from member
		
update review set hits=hits+1 where no=4;
select * from review;
select * from place; 

select r.no, r.title, r.content, r.posted_time, r.star, r.place_no, r.member_id, r.hits, p.name 
from review r, place p
where   r.no=4 and r.place_no=p.no
select * from friend 
		
		
insert into review_recommend values('java',3)
select count(*) from review_recommend where review_no = 3
select * from review_recommend

select sender_id from friend where sender_id in ('java1','goni') and receiver_id in ('java1','goni') and state = '수락'

select member_id id, review_no no from review_recommend where member_id='java' and review_no='16']


select A.*, re.recommend
		from(select row_number() over(order by r.no
		desc) rnum,
		r.no, r.title, r.member_id, r.place_no, p.name, r.hits, r.content, m.name member_name, p.name place_name,
		to_char(posted_time,'YYYY/MM/DD HH24:MM') as posted_time
		from review r, place p, member m where r.place_no = p.no and r.member_id=m.id) A, 
		(select count(*) recommend,review_no from REVIEW_RECOMMEND group by review_no) re
		where rnum between 1 and 5 and A.no=re.review_no(+)


-----< dual >-----
select sysdate from dual

-----< friend >-----
insert into friend values('java','goni','수락',sysdate);

select sender_id from friend where sender_id in ('java1','goni') and receiver_id in ('java1','goni') and state = '수락'
