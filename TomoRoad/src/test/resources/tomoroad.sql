-- 변경해주세요! profile default 값 --
alter table member modify(profile default '/tomoroad/resources/img/profiles/kakao.jpg')
---------------리뷰 제약조건 수정----------------
ALTER table review_comment
DROP CONSTRAINT fk_review_comment_no;
ALTER TABLE review_comment 
  ADD CONSTRAINT fk_review_comment_no 
  FOREIGN KEY (review_no) 
  REFERENCES review(no) 
  ON DELETE CASCADE;
ALTER table review_recommend
DROP CONSTRAINT fk_review_recommend_no;
ALTER TABLE review_recommend 
  ADD CONSTRAINT fk_review_recommend_no 
  FOREIGN KEY (review_no) 
  REFERENCES review(no) 
  ON DELETE CASCADE;
---------------번개 제약조건 수정----------------
ALTER table burn_comment
DROP CONSTRAINT fk_burn_comment_no;
ALTER TABLE burn_comment 
  ADD CONSTRAINT fk_burn_comment_no 
  FOREIGN KEY (burn_no) 
  REFERENCES burn_board(no) 
  ON DELETE CASCADE;
------------------------------------------------
  select * from member

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
drop table station;
drop table member;
drop table manager;
drop table bucket;
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
	tel varchar2(100) not null,
	profile varchar2(100) default '/tomoroad/resources/img/profiles/kakao.jpg' not null
);

create table manager(
	id varchar2(100) primary key,
	password varchar2(100) not null
);

--station 테이블 컬럼추가(0607).
create table station(
	name varchar2(100) primary key, --역 이름
	simple_detail varchar2(100) not null, --역 간단 설명
	detail clob not null, --역 설명
	section varchar2(100) not null, --행정구역
	img varchar2(100) not null, --이미지 파일명
	lat number not null,
	lng number not null
);

create table place(
	no number primary key,
	name varchar2(100) not null,
	station_name varchar2(100) not null,
	constraint fk_station_name foreign key(station_name) references station(name),
	area varchar2(100) not null
);
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
	recomment number default 0,
	review_no number, 
	member_id varchar2(100) not null,
	constraint fk_review_comment_no foreign key(review_no) references review(no) ON DELETE CASCADE,
	constraint fk_review_comment_member_id foreign key(member_id) references member(id),
	state varchar2(100) default 'comment' not null
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
	constraint fk_review_recommend_no foreign key(review_no) references review(no) ON DELETE CASCADE
);

create sequence burn_board_seq nocache;

create table burn_comment(
	no number primary key,
	content clob not null,
	posted_time date not null,
	recomment number default 0,
	burn_no number not null,
	member_id varchar2(100) not null,
	constraint fk_burn_comment_no foreign key(burn_no) references burn_board(no) ON DELETE CASCADE,
	constraint fk_burn_comment_id foreign key(member_id) references member(id)	
);
create sequence burn_comment_seq nocache;

create table advertisement(
	no number primary key,
	link varchar2(1000) not null
);
create sequence advertisement_seq nocache;

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

--검색순위테이블
create table station_reported(
  name varchar2(100) primary key,
  hit number default 1, --검색된 수
  constraint fk_station_reported_name foreign key(name) references station(name)  
);
--역들의 지역정보 테이블 (날씨 정보때문에 만듭니다.)
create table stationcityname(
	name varchar2(100) primary key,
	cityname varchar2(100) not null,
	constraint fk_station_cityname foreign key(name) references station(name) 
);

create table bucket(
	id varchar2(100),
	name varchar2(100),
	primary key(id,name),
	constraint fk_bucket_id foreign key(id) references member(id),
	constraint fk_bucket_name foreign key(name) references station(name)
);
--------------------------------------------------연습장-------------------------------------------------

select * from STATION_CONNECT

insert into station_reported (name) values ('서울역');
insert into station_reported (name) values ('부산역');
update station_reported set hit=hit+1 where name = '서울역';

--저는 테이블을 다 삭제한 상태에서 다시 작성하는 거라서 테이블 내용 자체를 바꿨는데
--테이블 다 삭제하지 않은 상태이시면 station 테이블만 지우고 아래 것들만 실행해주세요~
alter table station drop column administrative_district;
alter table station drop column stayed_time;
alter table station add simple_detail varchar2(100) not null;
alter table station add img varchar2(100) not null;
alter table station add lat number not null; --추가부탁드려요 테이블비우고. //위도
alter table station add lng number not null; --추가부탁드려요 테이블비우고. //경도


-----< member >-----
insert into member(id,password,name,sex,tel,profile) values('java','1234','아이유','여자','010','/tomoroad/resources/img/profiles/java.jpg');
insert into member(id,password,name,sex,tel,profile) values('abcd','1234','윤다혜','여자','010','/tomoroad/resources/img/profiles/abcd.png');
insert into member(id,password,name,sex,tel,profile) values('spring','1234','김문일','남자','010','/tomoroad/resources/img/profiles/spring.png');
insert into member(id,password,name,sex,tel,profile) values('asdf','1234','김성환','남자','010','/tomoroad/resources/img/profiles/asdf.png');
insert into member(id,password,name,sex,tel,profile) values('qwer','1234','오남준','남자','010','/tomoroad/resources/img/profiles/qwer.jpg');
insert into member(id,password,name,sex,tel,profile) values('qaz','1234','송준영','남자','010','/tomoroad/resources/img/profiles/qaz.jpg');
insert into member(id,password,name,sex,tel,profile) values('zxcv','1234','박영덕','남자','010','/tomoroad/resources/img/profiles/zxcv.jpg');

update member set name ='송준영' where id = 'qaz'

alter table member add(profile varchar2(100))
delete from member where id='java';
delete from member where id='abcd';
delete from member where id='spring';
delete from member where id='asdf';


select * from member
select id from member where password='aaaa' and name='aaaa' and tel='aaaa'
select distinct station distinct station_name;  

-- member 테이블 프로필경로 컬럼 추가
insert into MEMBER values('java','123','홍길동','여','01012341234','${pageContext.request.contextPath}/resources/images/profile/kakao.jpg');
update member set profile = '${pageContext.request.contextPath}/resources/images/profile/kakao.jpg'
select * from member
update member set profile = 'java' where id = 'java'

update member set profile = null

update member set profile = null

select sender_id,profile from friend where receiver_id = 'java' and state = '대기'

select f.sender_id,m.profile from friend f,member m where f.sender_id=m.id and f.receiver_id = 'java'

select f.sender_id,m.profile from friend f,member m where f.receiver_id = 'java' and f.sender_id = m.id

select * from member


-----< Station 정보 >-----
insert into station values('서울역','하나의 특별시, 대한민국의 중심','주소: 서울특별시 용산구 한강대로 405 서울역 지번-서울특별시 용산구 동자동 43-205 서울역','Capital','서울',37.554925,126.970831);
insert into station values('양평역','생태 행복도시 희망의 양평','주소: 경기도 양평군 양평읍 역전길 30 지번-경기도 양평군 양평읍 양근리 130-37','Capital','양평',37.4926782,127.4896693);

insert into station values('광주역','민주화의 횃불을 밝힌 도시, 광주','주소: 광주광역시 북구 무등로 235 광주역 지번-광주광역시 북구 중흥동 611-2 광주역','Honam','광주',35.1653428,126.9070116);
insert into station values('여수역','국제 해양관광의 중심, 여수','주소: 전라남도 여수시 망양로 2 여수역 지번-전라남도 여수시 덕충동 61-7','Honam','여수',34.7525732,127.7437975);

insert into station values('구미역','희망과 꿈이 이루어지는 긍정의 도시','주소: 경상북도 구미시 구미중앙로 76 지번-경상북도 구미시 원평동 1008-1','Youngnam','구미',36.1283608,128.3287943);
insert into station values('부산역','젊음의 도시','주소: 부산광역시 동구 중앙대로 206 지번-부산광역시 동구 초량동 1187-1','Youngnam','부산',35.115433,129.042259);
insert into station values('대구역','컬러풀 대구','주소: 대구광역시 북구 태평로 161 대구민자역사 지번-대구광역시 북구 칠성동2가 302-155','Youngnam','대구',35.87646,128.5940243);
insert into station values('울산역','울산은 당신을 위한다','주소: 울산광역시 울주군 삼남면 울산역로 177 울산역 지번-울산광역시 울주군 삼남면 신화리 88','Youngnam','울산',35.550946,129.1357823);

insert into station values('동해역','국내 최고의 일출명소','주소: 강원도 동해시 동해역길 69 지번-강원도 동해시 송정동 산24-22','Gwandong','동해',37.498192,129.1216143);
insert into station values('강릉역','관광휴양도시','주소: 강원 강릉시 용지로 176 강릉역','Gwandong','강릉',37.76236,128.8974883);

insert into station values('대전역','가장 살기 좋은 도시, 바로 대전','주소: 경상북도 구미시 구미중앙로 76 지번-경상북도 구미시 원평동 1008-1','Chungcheong','대전',36.3603063,127.3393904);
insert into station values('남원역','춘향이와 몽룡이의 도시','주소: 전북 남원시 교룡로 71','Chungcheong','남원',35.411252,127.3591693);


select name,simple_detail,section,img from station;
-----<station cityname 정보>-----
insert into stationcityname values ('서울역','seoul');

-----< place 정보 >-----
insert into place values(place_seq.nextval,'5·18 민주화운동 기록관','광주역','Honam');
insert into place values(place_seq.nextval,'동대문','서울역','Capital');
insert into place values(place_seq.nextval,'해운대','부산역','Youngnam');
insert into place values(place_seq.nextval,'오죽헌','강릉역','Gwandong');
insert into place values(place_seq.nextval,'금오산','구미역','Youngnam');

select * from place where name LIKE '%해운대%'; 


-----< burn >-----
insert into burn_board values(burn_board_seq.nextval,'연습제목',sysdate,'연습내용','서울역','java',0);
delete from BURN_BOARD where no='2'

select c.no, c.content, c.posted_time, c.recomment, burn_no, member_id, state from BURN_COMMENT;


select A.* from(select b.no, b.title, b.station_name, b.member_id, b.posted_time, c.commentcount 
from BURN_BOARD b, (select burn_no, count(*) as commentcount from burn_comment where state='comment' group by burn_no) c
where b.no = c.burn_no) A
where rnum between 1 and 5



select burn_no,count(*) from burn_comment where state='comment' group by burn_no;


select * from (select row_number() over(order by no desc) rnum, no, title, station_name, member_id, posted_time, hits
from (select * from BURN_BOARD where station_name = '서울')) where rnum between 1 and 5

	
-----< review >-----
update review set hits=hits+1 where no=4;

select no,title,member_id,to_char(posted_time,'YYYY/MM/DD'),hits,star from review where title like '%전주%' or content like '%전주%';
select title from review where title like '%전주%' or content like '%전주%'
select content from review where content like '%부%';

select * from review_recommend

select content from review where content like '%부산%';

select * from review where title like '%부산%' and content like '%부산%';
select content from review where content like '%부산%';
select title from review where content like '%부산%';

select A.*, re.recommend
		from(select row_number() over(order by r.no
			desc) rnum,
			r.no, r.title, r.member_id, r.place_no, p.name, r.hits, r.content, m.name member_name, p.name place_name,
			to_char(posted_time,'YYYY/MM/DD HH24:MM') as posted_time
			from review r, place p, member m where r.place_no = p.no and r.member_id=m.id and r.member_id='java') A, 
			(select count(*) recommend,review_no from REVIEW_RECOMMEND group by review_no) re
		where rnum between 1 and 5 and A.no=re.review_no(+)


select * from member;

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



select * from member
select A.* from(select row_number() over (order by b.no desc) as rnum, b.no, b.title, b.station_name, b.member_id, b.posted_time, c.commentcount, b.hits 
		from BURN_BOARD b, (select burn_no, count(*) as commentcount from burn_comment where state='comment' group by burn_no) c
		where b.no = c.burn_no) A 
		where rnum between 1 and 5
		
update review set hits=hits+1 where no=4;
select * from review;
select * from place; 

select r.no, r.title, r.content, r.posted_time, r.star, r.place_no, r.member_id, r.hits, p.name 
from review r, place p
where   r.no=4 and r.place_no=p.no
select * from friend 
		
		
select * from review_recommend
insert into review_recommend values('java',3)
select count(*) from review_recommend where review_no = 3
select * from review_recommend

select sender_id from friend where sender_id in ('java1','goni') and receiver_id in ('java1','goni') and state = '수락'

select member_id id, review_no no from review_recommend where member_id='java' and review_no='16']

--추천수를 넣기위해서 페이징빈이랑 한 조인한 테이블
select A.*, re.recommend
		from(select row_number() over(order by r.no
		desc) rnum,
		r.no, r.title, r.member_id, r.place_no, p.name, r.hits, r.content, m.name member_name, p.name place_name,
		to_char(posted_time,'YYYY/MM/DD HH24:MM') as posted_time
		from review r, place p, member m where r.place_no = p.no and r.member_id=m.id) A, 
		(select count(*) recommend,review_no from REVIEW_RECOMMEND group by review_no) re
		where rnum between 1 and 5 and A.no=re.review_no(+)

select r.no,r.title,to_char(posted_time,'YYYY.MM.DD'),r.recommend,r.place_no,r.member_id
from review r,place p,member m
where r.member_id=m.id and r.place_no=p.no and r.place_no=7;
		
-----< dual >-----
select sysdate from dual

-----< friend >-----


update member set profile = '/tomoroad/resources/img/profiles/qwer.png' where id = 'qwer'
update member set profile = '/tomoroad/resources/img/profiles/spring.png' where id = 'spring'

select * from member

delete from member where id = 'onon22'

select m.profile,f.receiver_id as friend from member m,friend f where f.receiver_id = m.id and sender_id = 'java' and state = '수락'

select m.profile,f.sender_id as friend from member m,friend f where f.sender_id = m.id and receiver_id = 'java' and state = '수락'


select * from member

select receiver_id as friend from friend where sender_id = 'java' and state = '수락'

select sender_id as friend from friend where receiver_id = 'java' and state = '수락'

insert into friend values('abcd','qwer','수락',sysdate)

insert into friend values(#{senderID},#{receiverID},'대기',sysdate)

insert into friend values('abcd','java','대기',sysdate);
insert into friend values('asdf','java','대기',sysdate);
insert into friend values('qaz','java','대기',sysdate);
insert into friend values('qwer','java','대기',sysdate);
insert into friend values('spring','java','대기',sysdate);
insert into friend values('zxcv','java','대기',sysdate);

select * from friend where semder_Id = 'asdf'

select sender_id from friend where receiver_id = 'java' and state = '대기'

select * from friend

update friend set sender_id = 'spring', receiver_id='java', state = '차단' where receiver_id = 'spring' and sender_id = 'java' and state = '대기'

delete from friend

select count(*) from friend where sender_id in ('java','qwer') and receiver_id in('java','qwer') and state in('대기','차단')

update friend set state = '대기' where sender_id = 'asdf'

update friend set state = '차단' where receiver_id = 'java' and sender_id = 'abcd' and state = '대기'

select sender_id from friend where receiver_id = 'java' and sender_id = 'abcd' and state = '대기'

select f.sender_id,m.profile from friend f,member m where f.receiver_id = 'java' and f.state = '대기' and f.sender_id (+)= m.id

select f.sender_id,m.profile from friend f,member m where f.receiver_id = 'java' and f.sender_id = m.id and f.state = '대기'

select * from friend where sender_id in ('abcd','java') and receiver_id in('abcd','java') and state = '수락'

update friend set state = '차단' where sender_id in ('abcd','java') and receiver_id in('abcd','java')

delete from friend where sender_id in ('abcd','java') and receiver_id in('abcd','java')

delete from friend where sender_id = 'asdf'

select * from friend where receiver_id = 'onon22'

select sender_id from friend where sender_id in ('java1','goni') and receiver_id in ('java1','goni') and state = '수락'

select * from station_connect


insert into station values('월내역','1','1','1','1',35.326520,129.275440);
insert into station values('음성역','1','1','1','1',36.926244,127.703838);
insert into station values('의성역','1','1','1','1',36.354076,128.693501);
insert into station values('이양역','1','1','1','1',34.891760,126.989816);
insert into station values('이원역','1','1','1','1',36.244362,127.617986);
insert into station values('일로역','1','1','1','1',34.848603,126.477714);
insert into station values('일신역','1','1','1','1',37.445695,127.688264);
insert into station values('임기역','1','1','1','1',36.903875,128.999305);
insert into station values('임성리역','1','1','1','1',34.820867,126.435069);
insert into station values('임실역','1','1','1','1',35.633167,127.289824);
insert into station values('장성역','1','1','1','1',35.300217, 126.780216);
insert into station values('장항역','1','1','1','1',36.040302, 126.715438);
insert into station values('전의역','1','1','1','1',36.678644, 127.203144);
insert into station values('전주역','1','1','1','1',35.849944, 127.161766);
insert into station values('점촌역','1','1','1','1',36.595687, 128.203222);
insert into station values('조성역','1','1','1','1',34.767160, 127.081731);
insert into station values('좌천역','1','1','1','1',35.311913, 129.254886);
insert into station values('주덕역','1','1','1','1',36.973657, 127.802364);
insert into station values('중리역','1','1','1','1',35.249872, 128.518844);
insert into station values('증평역','1','1','1','1',36.778306, 127.583177);
insert into station values('지탄역','1','1','1','1',36.242053, 127.676419);
insert into station values('지평역','1','1','1','1',37.476683, 127.629627);
insert into station values('진례역','1','1','1','1',35.266823, 128.763192);
insert into station values('진상역','1','1','1','1',35.016808, 127.719759);
insert into station values('진영역','1','1','1','1',35.303739, 128.728736);
insert into station values('증평역','1','1','1','1',36.778383, 127.583177);
insert into station values('창원역','1','1','1','1',35.257695, 128.606539);
insert into station values('창원중앙역','1','1','1','1',35.242973, 128.701611);
insert into station values('덕소역','1','1','1','1',37.586969, 127.208877);
insert into station values('덕하역','1','1','1','1',35.495175, 129.305211);
insert into station values('도계역','1','1','1','1',37.229530, 129.043814);
insert into station values('도고온천역','1','1','1','1',36.749641, 126.889677);
insert into station values('동백산역','1','1','1','1',37.155062, 129.034547);
insert into station values('동화역','1','1','1','1',37.342153, 127.859819);
insert into station values('득량역','1','1','1','1',34.761806, 127.170164);
insert into station values('마산역','1','1','1','1',35.236271, 128.577383);
insert into station values('매곡역','1','1','1','1',37.432904, 127.718848);
insert into station values('명봉역','1','1','1','1',34.828032, 127.075462);
insert into station values('몽탄역','1','1','1','1',34.930061, 126.503297);
insert into station values('무안역','1','1','1','1',34.962852, 126.517021);
insert into station values('묵호역','1','1','1','1',37.546926, 129.107672);
insert into station values('물금역','1','1','1','1',35.307179, 128.985323);
insert into station values('민둥산역','1','1','1','1',37.243887, 128.773650);
insert into station values('반곡역','1','1','1','1',37.323213, 127.994290);
insert into station values('반성역','1','1','1','1',35.175010, 128.258172);
insert into station values('백양사역','1','1','1','1',35.431623, 126.808149);
insert into station values('벌교역','1','1','1','1',34.842172, 127.345307);
insert into station values('봉화역','1','1','1','1',36.891689, 128.726867);
insert into station values('부강역','1','1','1','1',36.532387, 127.365474);
insert into station values('북영천역','1','1','1','1',35.966000, 128.917591);
insert into station values('북천역','1','1','1','1',35.113633, 127.893101);
insert into station values('분천역','1','1','1','1',36.932739, 129.058398);
insert into station values('불국사역','1','1','1','1',35.776643, 129.296769);
insert into station values('사곡역','1','1','1','1',36.098351, 128.356230);
insert into station values('각계역','1','1','1','1',36.208116, 127.725439);
insert into station values('강경역','1','1','1','1',36.154430, 127.015598);
insert into station values('강릉역','1','1','1','1',37.762555, 128.899634);
insert into station values('개포역','1','1','1','1',37.489299, 127.066405);
insert into station values('건천역','1','1','1','1',35.854376, 129.097307);
insert into station values('경산역','1','1','1','1',35.819424, 128.727699);
insert into station values('계룡역','1','1','1','1',36.273237, 127.265224);
insert into station values('고한역','1','1','1','1',37.201037, 128.852937);
insert into station values('곡성역','1','1','1','1',35.283805, 127.303615);
insert into station values('광양역','1','1','1','1',34.969357, 127.589667);
insert into station values('광주역','1','1','1','1',35.165509, 126.909211);
insert into station values('광천역','1','1','1','1',36.501982, 126.622488);
insert into station values('구례구역','1','1','1','1',35.163619, 127.452611);
insert into station values('구미역','1','1','1','1',36.128499, 128.330929);
insert into station values('구포역','1','1','1','1',35.205501, 128.997134);
insert into station values('군북역','1','1','1','1',35.251911, 128.350691);
insert into station values('극락강역','1','1','1','1',35.176132, 126.829992);
insert into station values('기장역','1','1','1','1',35.243211, 129.218550);
insert into station values('김제역','1','1','1','1',35.792582, 126.902896);
insert into station values('남성현역','1','1','1','1',35.704844, 128.716302);
insert into station values('남원역','1','1','1','1',35.411234, 127.361369);
insert into station values('남창역','1','1','1','1',35.417630, 129.283260);
insert into station values('논산역','1','1','1','1',36.207271, 127.092420);
insert into station values('능주역','1','1','1','1',34.986771, 126.963996);
insert into station values('다시역','1','1','1','1',35.016898, 126.641006);
insert into station values('단양역','1','1','1','1',36.973343, 128.343597);
insert into station values('대야역','1','1','1','1',35.943683, 126.810957);
insert into station values('청도역','1','1','1','1',35.640227, 128.746495);
insert into station values('청리역','1','1','1','1',36.339285, 128.128885);
insert into station values('청소역','1','1','1','1',36.446176, 126.590878);
insert into station values('청주공항역','1','1','1','1',36.722018, 127.489624);
insert into station values('청주역','1','1','1','1',36.647289, 127.392467);
insert into station values('추풍령역','1','1','1','1',36.213646, 127.996337);
insert into station values('춘양역','1','1','1','1',36.938080, 128.919889);
insert into station values('충주역','1','1','1','1',36.976115, 127.909055);
insert into station values('탑리역','1','1','1','1',36.253172, 128.677317);
insert into station values('태백역','1','1','1','1',37.176415, 128.984217);
insert into station values('태화강역','1','1','1','1',35.539566, 129.353790);
insert into station values('판교역','1','1','1','1',37.395088, 127.111146);
insert into station values('평택역','1','1','1','1',36.990893, 127.085507);
insert into station values('풍기역','1','1','1','1',36.874165, 128.524445);
insert into station values('하동역','1','1','1','1',35.071397, 127.757960);
insert into station values('하양역','1','1','1','1',35.909946, 128.817902);
insert into station values('한림정역','1','1','1','1',35.322689, 128.803684);
insert into station values('함안역','1','1','1','1',35.249669, 128.424854);
insert into station values('함열역','1','1','1','1',36.080513, 126.957000);
insert into station values('함창역','1','1','1','1',36.569845, 128.174896);
insert into station values('함평역','1','1','1','1',35.024193, 126.539017);
insert into station values('현동역','1','1','1','1',36.937037, 129.012069);
insert into station values('호계역','1','1','1','1',35.622866, 129.354270);
insert into station values('홍성역','1','1','1','1',36.599768, 126.680644);
insert into station values('화명역','1','1','1','1',35.234564, 129.007597);
insert into station values('화본역','1','1','1','1',36.127149, 128.694953);
insert into station values('화순역','1','1','1','1',35.051829, 126.961654);
insert into station values('황간역','1','1','1','1',36.224820, 127.911285);
insert into station values('횡천역','1','1','1','1',35.103385, 127.808685);
insert into station values('효천역','1','1','1','1',35.103119, 126.877586);
insert into station values('희방사역','1','1','1','1',36.894758, 128.464987);
insert into station values('안강역','1','1','1','1',35.989684, 129.230998);
insert into station values('안양역','1','1','1','1',35.989684, 129.230998);
insert into station values('약목역','1','1','1','1',36.041011, 128.362999);
insert into station values('양동역','1','1','1','1',37.420599, 127.754494);
insert into station values('양원역','1','1','1','1',36.963475, 129.091151);
insert into station values('여천역','1','1','1','1',34.779417, 127.664153);
insert into station values('연산역','1','1','1','1',36.212531, 127.200790);
insert into station values('영월역','1','1','1','1',37.182664, 128.480735);
insert into station values('예당역','1','1','1','1',34.778844, 127.202288);
insert into station values('예미역','1','1','1','1',37.212640, 128.648191);
insert into station values('예산역','1','1','1','1',36.687736, 126.828508);
insert into station values('예천역','1','1','1','1',37.128293, 128.205321);
insert into station values('오근장역','1','1','1','1',36.700369, 127.478543);
insert into station values('오산역','1','1','1','1',37.151745, 127.067049);
insert into station values('오수역','1','1','1','1',35.543111, 127.320569);
insert into station values('옥산역','1','1','1','1',36.283189, 128.094464);
insert into station values('옥천역','1','1','1','1',36.298328, 127.565550);
insert into station values('완사역','1','1','1','1',35.134580, 127.977458);
insert into station values('왜관역','1','1','1','1',35.992542, 128.400010);
insert into station values('용궁역','1','1','1','1',36.607201, 128.273383);
insert into station values('용문역','1','1','1','1',37.482323, 127.594187);
insert into station values('웅천역','1','1','1','1',36.234591, 126.601897);
insert into station values('원동역','1','1','1','1',35.363229, 128.920505);
insert into station values('사북역','1','1','1','1', 37.226438,128.817023);
insert into station values('사상역','1','1','1','1', 35.162536,128.985760);
insert into station values('삼례역','1','1','1','1', 35.904472,127.066337);
insert into station values('삼산역','1','1','1','1', 37.446335,127.768538);
insert into station values('삼탄역','1','1','1','1', 37.073341,128.038593);
insert into station values('삽교역','1','1','1','1', 36.680710,126.751399);
insert into station values('상동역','1','1','1','1', 37.506066,126.753136);
insert into station values('상주역','1','1','1','1', 36.410507,128.163871);
insert into station values('서경주역','1','1','1','1', 35.868989,129.201153);
insert into station values('서광주역','1','1','1','1', 35.125082,126.846881);
insert into station values('서정리역','1','1','1','1', 37.056476,127.052855);
insert into station values('서천역','1','1','1','1', 36.081596,126.708662);
insert into station values('석불역','1','1','1','1', 37.460265,127.654872);
insert into station values('석포역','1','1','1','1', 37.045499,129.061108);
insert into station values('성환역','1','1','1','1', 36.915891,127.126964);
insert into station values('센텀역','1','1','1','1', 35.169044,129.131616);
insert into station values('소정리역','1','1','1','1', 37.056527,127.052876);
insert into station values('승부역','1','1','1','1', 36.993645,129.083866);
insert into station values('신기역','1','1','1','1', 37.438800,129.095816);
insert into station values('신녕역','1','1','1','1', 36.034198,128.791131);
insert into station values('신동역','1','1','1','1', 35.955732,128.486021);
insert into station values('신례원역','1','1','1','1', 36.727327,126.849691);
insert into station values('신림역','1','1','1','1', 37.217780,128.091346);
insert into station values('신탄진역','1','1','1','1', 36.450164,127.428070);
insert into station values('신태인역','1','1','1','1', 35.688090,126.884356);
insert into station values('신해운대역','1','1','1','1', 35.181814,129.176728);
insert into station values('심천역','1','1','1','1', 36.237790,127.720217);
insert into station values('쌍룡역','1','1','1','1', 36.793934,127.121288);
insert into station values('아산역','1','1','1','1', 36.794727,127.104397);

delete from station;

select count(*) from review where member_id='asdf';
select count(*) from station;

insert into station values('서울역','1','1','1','1', 37.554908,126.970841);
insert into station values('용산역','1','1','1','1',37.530154, 126.964754);
insert into station values('청량리역','1','1','1','1',37.580503, 127.046988);
insert into station values('양평역','1','1','1','1',37.492938, 127.491847);
insert into station values('원주역','1','1','1','1',37.357265, 127.944777);
insert into station values('제천역','1','1','1','1',37.128310, 128.205397);
insert into station values('영주역','1','1','1','1',36.811370, 128.625120);
insert into station values('경주역','1','1','1','1',35.844583, 129.217902);
insert into station values('포항역','1','1','1','1',36.071978, 129.341936);
insert into station values('부전역','1','1','1','1',35.164922, 129.060131);
insert into station values('부산역','1','1','1','1',35.115389, 129.042195);
insert into station values('삼랑진역','1','1','1','1', 35.399625,128.843228);
insert into station values('밀양역','1','1','1','1',35.474696, 128.771146);
insert into station values('동대구역','1','1','1','1',35.879850, 128.628476);
insert into station values('대구역','1','1','1','1',35.943692, 126.811000);
insert into station values('김천역','1','1','1','1',36.123648, 128.114656);
insert into station values('영동역','1','1','1','1',36.172376, 127.786233);
insert into station values('대전역','1','1','1','1',36.331315, 127.433052);
insert into station values('조치원역','1','1','1','1',36.601360, 127.296260);
insert into station values('천안역','1','1','1','1',36.809507, 127.146231);
insert into station values('수원역','1','1','1','1', 37.266213,126.999842);
insert into station values('영등포역','1','1','1','1',37.515977, 126.907399);
insert into station values('온양온천역','1','1','1','1',36.780642, 127.003739);
insert into station values('대천역','1','1','1','1',36.341862, 126.586735);
insert into station values('군산역','1','1','1','1',35.999450, 126.759768);
insert into station values('익산역','1','1','1','1',35.940476,126.946330);
insert into station values('정읍역','1','1','1','1',35.575833, 126.843040);
insert into station values('광주송정역','1','1','1','1',35.137717, 126.791546);
insert into station values('나주역','1','1','1','1',35.014490, 126.717093);
insert into station values('목포역','1','1','1','1',34.791210, 126.386518);
insert into station values('보성역','1','1','1','1',34.767108, 127.081635);
insert into station values('순천역','1','1','1','1', 34.945753,127.503347);
insert into station values('여수엑스포역','1','1','1','1',34.752846, 127.745975);
insert into station values('진주역','1','1','1','1',35.150958, 128.118006);
insert into station values('철암역','1','1','1','1',37.113226, 129.036532);
insert into station values('동해역','1','1','1','1',37.498260, 129.123824);
insert into station values('정동진역','1','1','1','1',37.691714, 129.032618);
insert into station values('서대전역','1','1','1','1', 36.322636,127.403868);
insert into station values('오송역','1','1','1','1',36.620729, 127.327399);
insert into station values('영천역','1','1','1','1',35.959640, 128.939260);
insert into station values('안동역','1','1','1','1',36.563066, 128.732955);
insert into STATION_CONNECT(depart,arrived,spent_time) values('서울역','용산역',5);
insert into STATION_CONNECT(depart,arrived,spent_time) values('청량리역','양평역',35);
insert into STATION_CONNECT(depart,arrived,spent_time) values('양평역','원주역',53);
insert into STATION_CONNECT(depart,arrived,spent_time) values('원주역','제천역',53);
insert into STATION_CONNECT(depart,arrived,spent_time) values('제천역','영주역',60);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영주역','안동역',30);
insert into STATION_CONNECT(depart,arrived,spent_time) values('안동역','영천역',92);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영천역','경주역',49);
insert into STATION_CONNECT(depart,arrived,spent_time) values('경주역','포항역',35);
insert into STATION_CONNECT(depart,arrived,spent_time) values('경주역','부전역',118);
insert into STATION_CONNECT(depart,arrived,spent_time) values('부산역','삼랑진역',49);
insert into STATION_CONNECT(depart,arrived,spent_time) values('삼랑진역','밀양역',10);
insert into STATION_CONNECT(depart,arrived,spent_time) values('밀양역','동대구역',43);
insert into STATION_CONNECT(depart,arrived,spent_time) values('동대구역','대구역',7);
insert into STATION_CONNECT(depart,arrived,spent_time) values('대구역','김천역',53);
insert into STATION_CONNECT(depart,arrived,spent_time) values('김천역','영동역',32);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영동역','대전역',30);
insert into STATION_CONNECT(depart,arrived,spent_time) values('대전역','조치원역',26);
insert into STATION_CONNECT(depart,arrived,spent_time) values('조치원역','천안역',22);
insert into STATION_CONNECT(depart,arrived,spent_time) values('천안역','수원역',31);
insert into STATION_CONNECT(depart,arrived,spent_time) values('수원역','영등포역',21);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영등포역','서울역',11);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영등포역','용산역',8);
insert into STATION_CONNECT(depart,arrived,spent_time) values('천안역','온양온천역',16);
insert into STATION_CONNECT(depart,arrived,spent_time) values('온양온천역','대천역',71);
insert into STATION_CONNECT(depart,arrived,spent_time) values('대천역','군산역',45);
insert into STATION_CONNECT(depart,arrived,spent_time) values('군산역','익산역',21);
insert into STATION_CONNECT(depart,arrived,spent_time) values('익산역','정읍역',33);
insert into STATION_CONNECT(depart,arrived,spent_time) values('정읍역','광주송정역',36);
insert into STATION_CONNECT(depart,arrived,spent_time) values('광주송정역','나주역',11);
insert into STATION_CONNECT(depart,arrived,spent_time) values('나주역','목포역',38);
insert into STATION_CONNECT(depart,arrived,spent_time) values('광주송정역','보성역',82);
insert into STATION_CONNECT(depart,arrived,spent_time) values('보성역','순천역',55);
insert into STATION_CONNECT(depart,arrived,spent_time) values('순천역','여수엑스포역',22);
insert into STATION_CONNECT(depart,arrived,spent_time) values('순천역','진주역',73);
insert into STATION_CONNECT(depart,arrived,spent_time) values('진주역','삼랑진역',88);
insert into STATION_CONNECT(depart,arrived,spent_time) values('영주역','철암역',104);
insert into STATION_CONNECT(depart,arrived,spent_time) values('철암역','동해역',67);
insert into STATION_CONNECT(depart,arrived,spent_time) values('동해역','정동진역',27);
insert into STATION_CONNECT(depart,arrived,spent_time) values('익산역','서대전역',65);
insert into STATION_CONNECT(depart,arrived,spent_time) values('조치원역','서대전역',30);
insert into STATION_CONNECT(depart,arrived,spent_time) values('오송역','조치원역',5);
insert into STATION_CONNECT(depart,arrived,spent_time) values('오송역','제천역',95);
insert into STATION_CONNECT(depart,arrived,spent_time) values('김천역','영주역',134);
select A.*, re.recommend
		from(select row_number() over(order by r.no desc) rnum,
			r.no, r.title, r.member_id, r.place_no, p.name, r.hits, r.content, m.name member_name, p.name place_name,
			to_char(posted_time,'YYYY/MM/DD') as posted_time
			from review r, place p, member m where r.place_no = p.no and r.member_id=m.id and r.member_id='java') A, 
			(select count(*) recommend,review_no from REVIEW_RECOMMEND group by review_no) re
