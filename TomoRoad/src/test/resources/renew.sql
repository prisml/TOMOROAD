---------- drop table ------------
drop table travel;
drop table message;
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
drop sequence message_sequence;





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


insert into station values('서울역','하나의 특별시 대한민국의 중심','주소: 서울특별시 용산구 한강대로 405, 서울특별시 중구 한강대로 405','Capital','서울.jpg',37.554917, 126.970756);
insert into station values('양평역','생태 행복도시 희망의 양평','주소: 경기도 양평군 양평읍 역전길 30','Capital','양평.jpg',37.492840, 127.491761);
insert into station values('용산역', '서울의 중심 세계의 중심','주소: 서울특별시 용산구 한강대로23길 55','Capital','용산.jpg',37.530077, 126.964689);
insert into station values('청량리역','동대문 패션 도시','주소: 서울특별시 동대문구 왕산로 214 (전농동)','Capital','동대문.jpg',37.580375, 127.046828);
insert into station values('원주역','건강한 관광 문화 원주','주소: 강원도 원주시 평원로 158','Gwandong','원주.jpg',37.357086, 127.944841);
insert into station values('제천역','자연 치유 도시 제천','주소: 충청북도 제천시 의림대로','Chungcheong','제천.jpg',37.128250, 128.205257);
insert into station values('영주역','힐링 중심 행복 영주','주소: 경상북도 영주시 선비로 64','Youngnam','영주.jpg',36.811130, 128.625056);
insert into station values('경주역','품격있는 도시, 존경받는 경주','주소: 경상북도 경주시 원화로 266 경주역','Youngnam','경주.jpg',35.844583, 129.217902);
insert into station values('포항역','함께하는 변화, 도약하는 포항','주소: 경상북도 포항시 북구 흥해읍 포항역로 1','Youngnam','포항.jpg',36.071978, 129.341936);
insert into station values('부전역','사람과 기술, 문화로 융성하는 부산','주소: 부산광역시 부산진구 부전로 181','Youngnam','부전.jpg',35.164922, 129.060131);
insert into station values('부산역','사람과 기술, 문화로 융성하는 부산','주소: 부산광역시 동구 중앙대로 206','Youngnam','부산.jpg',35.115389, 129.042195);
insert into station values('삼랑진역','열린 행복도시, 힘찬 미래도시','주소: 경상남도 밀양시 삼랑진읍 천태로 72','Youngnam','삼랑진.jpg', 35.399625,128.843228);
insert into station values('밀양역','열린 행복도시, 힘찬 미래도시','주소: 경상남도 밀양시 중앙로 62','Youngnam','밀양.jpg',35.474696, 128.771146);
insert into station values('동대구역','오로지 시민행복, 반드시 창조대구','주소: 대구광역시 동구 동대구로 550 동대구역','Youngnam','동대구.jpg',35.879850, 128.628476);
insert into station values('대전역','가장 살기 좋은 도시, 바로 대전','주소: 경상북도 구미시 구미중앙로 76 지번-경상북도 구미시 원평동 1008-1','Chungcheong','대전.jpg',36.3603063,127.3393904);
insert into station values('대구역','컬러풀 대구','주소: 대구광역시 북구 태평로 161 대구민자역사 지번-대구광역시 북구 칠성동2가 302-155','Youngnam','대구.png',35.87646,128.5940243);
insert into station values('김천역','행복도시 김천','주소: 경상북도 김천시 김천로 111 김천역','Youngnam','김천역.gif',36.123648, 128.114656);
insert into station values('영동역','영동군','주소: 충청북도 영동군 영동읍 계산로 87','Chungcheong','영동역.gif',36.172376, 127.786233);
insert into station values('조치원역','조치원','주소: 세종특별자치시 조치원읍 으뜸길 215','Chungcheong','조치원역.jpg',36.601360, 127.296260);
insert into station values('천안역','시민중심 행복천안','주소: 충청남도 천안시 동남구 대흥로 239 천안역','Chungcheong','천안역.png',36.809507, 127.146231);
insert into station values('수원역','휴먼시티 수언','주소: 경기도 수원시 팔달구 덕영대로 924 수원역','Capital','수원역.png', 37.266213,126.999842);
insert into station values('영등포역','행복이 넘쳐나는 공간, 영등포','주소: 서울특별시 영등포구 경인로102길 13 영등포역', 'Capital', '영등포.jpg',37.515977, 126.907399);
insert into station values('온양온천역','노는 물이 달라','주소: 충청남도 아산시 온천대로 1496 온양온천역','Chungcheong','온양온천.jpg',36.780642, 127.003739);
insert into station values('대천역','1','주소: 충청남도 보령시 대해로 116','Chungcheong','대천.jpg',36.341862, 126.586735);
insert into station values('군산역','Dream Hub GUNSAN','주소: 전라북도 군산시 내흥동 455','Honam','군산.jpg',35.999450, 126.759768);
insert into station values('익산역','위대하고 경이로운 도시','주소: 전라북도 익산시 익산대로 153 익산역','Honam','익산.jpg',35.940476,126.946330);
insert into station values('정읍역','미래를 향한 아름다운 단품의 고장','주소: 전라북도 정읍시 서부산업도로 305 정읍역','Honam','정읍.jpg',35.575833, 126.843040);
insert into station values('광주송정역','민주화의 횃불을 밝힌 도시, 광주','주소: 광주광역시 광산구 상무대로 201 광주송정역','Honam','광주송정.jpg',35.137717, 126.791546);
insert into station values('나주역','천년고도 나주','주소: 전라남도 나주시 나주역길 56','Honam','나주.jpg',35.014490, 126.717093);
insert into station values('목포역','청정도시 목포','주소: 전라남도 목포시 영산로 98','Honam','목포.jpg',34.791210, 126.386518);
insert into station values('보성역','녹차라면 역시 보성녹차!','주소: 전라남도 보성군 보성읍 현충로 90','Honam','목포.jpg',34.767108, 127.081635);
insert into station values('순천역','전통과 역사가 숨쉬는 도시, 순천','주소: 전라남도 순천시 팔마로 135 순천역','Honam','순천.jpg', 34.945753,127.503347);
insert into station values('여수엑스포역','아름다운 물의 도시, 여수','주소: 전라남도 여수시 망양로 2 여수역','Honam','여수엑스포.png',34.752846, 127.745975);
insert into station values('진주역','국제도시조명연맹의 도시','주소: 경상남도 진주시 개양로116번길 33 진주역','Youngnam','진주.jpg',35.150958, 128.118006);
insert into station values('철암역','탄광마을','주소: 강원도 태백시 동태백로 389','Gwandong','철암.png',37.113226, 129.036532);
insert into station values('동해역','동트는 동해!','주소: 강원도 동해시 동해역길 69 지번-강원도 동해시 송정동 산24-22','Gwandong','동해.png',37.498192,129.1216143);
insert into station values('정동진역','정동진! 다들 아시죠?','주소: 강원도 강릉시 강동면 정동진리 303','Gwandong','정동진.png',37.691714, 129.032618);
insert into station values('서대전역','Its Seo-Daejeon!','주소: 대전광역시 중구 오류동 74 서대전역','Chungcheong','서대전역.png', 36.322636,127.403868);
insert into station values('오송역','다섯그루 소나무가 있는 오송역','주소: 충청북도 청주시 흥덕구 오송읍 봉산리 370-31 오송역','Chungcheong','오송역.png',36.620729, 127.327399);
insert into station values('영천역','STAR 영천','주소: 경상북도 영천시 완산동 891','Youngnam','영천역.png',35.959640, 128.939260);
insert into station values('안동역','안동 역사가 있는 도시','주소: 경상북도 안동시 운흥동 178-3','Youngnam','안동역.png',36.563066, 128.732955);
insert into station values('전주역','세계를 비빈다 전주','주소: 전라북도 전주시 덕진구 우아동3가 235','Honam','전주역.jpg',35.849944, 127.161766);

insert into place values(place_seq.nextval,'명동거리','서울역','Capital');
insert into place values(place_seq.nextval,'서울역 고가 거리','서울역','Capital');
insert into place values(place_seq.nextval,'남한강 자전거길','양평역','Capital');
insert into place values(place_seq.nextval,'양수리 두물머리 장소','양평역','Capital');
insert into place values(place_seq.nextval,'이태원거리','용산역','Capital');
insert into place values(place_seq.nextval,'국립중앙박물관','용산역','Capital');
insert into place values(place_seq.nextval,'동대문거리','청량리역','Capital');
insert into place values(place_seq.nextval,'흥인지문','청량리역','Capital');
insert into place values(place_seq.nextval,'치악산 등산로','원주역','Gwandong');
insert into place values(place_seq.nextval,'연세대 원주 박물관','원주역','Gwandong');
insert into place values(place_seq.nextval,'충주호','제천역','Chungcheong');
insert into place values(place_seq.nextval,'청풍 문화재 단지','제천역','Chungcheong');
insert into place values(place_seq.nextval,'부석사','영주역','Youngnam');
insert into place values(place_seq.nextval,'소수서원','영주역','Youngnam');
insert into place values(place_seq.nextval,'불국사','경주역','Youngnam');
insert into place values(place_seq.nextval,'첨성대','경주역','Youngnam');
insert into place values(place_seq.nextval,'보경사','포항역','Youngnam');
insert into place values(place_seq.nextval,'호미곶','포항역','Youngnam');
insert into place values(place_seq.nextval,'광안리','부전역','Youngnam');
insert into place values(place_seq.nextval,'용두산공원','부전역','Youngnam');
insert into place values(place_seq.nextval,'광안리','부산역','Youngnam');
insert into place values(place_seq.nextval,'용두산공원','부산역','Youngnam');
insert into place values(place_seq.nextval,'영남루','삼랑진역','Youngnam');
insert into place values(place_seq.nextval,'표충사','삼랑진역','Youngnam');
insert into place values(place_seq.nextval,'영남루','밀양역','Youngnam');
insert into place values(place_seq.nextval,'표충사','밀양역','Youngnam');
insert into place values(place_seq.nextval,'김광석길','동대구역','Youngnam');
insert into place values(place_seq.nextval,'근대골목','동대구역','Youngnam');
insert into place values(place_seq.nextval,'계족산','대전역','Chungcheong');
insert into place values(place_seq.nextval,'한밭수목원','대전역','Chungcheong');
insert into place values(place_seq.nextval,'김광석길','대구역','Honam');
insert into place values(place_seq.nextval,'근대골목','대구역','Honam');
insert into place values(place_seq.nextval,'천부항댐','김천역','Youngnam');
insert into place values(place_seq.nextval,'직지사','김천역','Youngnam');
insert into place values(place_seq.nextval,'옥계폭포','영동역','Chungcheong');
insert into place values(place_seq.nextval,'제2경 강선대','영동역','Chungcheong');
insert into place values(place_seq.nextval,'고복저수지','조치원역','Capital');
insert into place values(place_seq.nextval,'벽화마을','조치원역','Capital');
insert into place values(place_seq.nextval,'화홍문','수원역','Capital');
insert into place values(place_seq.nextval,'벽화마을','수원역','Capital');
insert into place values(place_seq.nextval,'독립기념관','천안역','Chungcheong');
insert into place values(place_seq.nextval,'왕지봉배꽃','천안역','Chungcheong');
insert into place values(place_seq.nextval,'여의도 한강공원','영등포역','Capital');
insert into place values(place_seq.nextval,'선유도공원','영등포역','Capital');
insert into place values(place_seq.nextval,'온양온천','온양온천역','Chungcheong');
insert into place values(place_seq.nextval,'공세리성당','온양온천역','Chungcheong');
insert into place values(place_seq.nextval,'대천해수욕장','대천역','Chungcheong');
insert into place values(place_seq.nextval,'보령머드축제','대천역','Chungcheong');
insert into place values(place_seq.nextval,'은파유원지','군산역','Honam');
insert into place values(place_seq.nextval,'철길마을','군산역','Honam');
insert into place values(place_seq.nextval,'미륵사지','익산역','Honam');
insert into place values(place_seq.nextval,'덕양정','익산역','Honam');
insert into place values(place_seq.nextval,'정읍사공원','정읍역','Honam');
insert into place values(place_seq.nextval,'쌍화차거리','정읍역','Honam');
insert into place values(place_seq.nextval,'518광장','광주송정역','Honam');
insert into place values(place_seq.nextval,'무등산','광주송정역','Honam');
insert into place values(place_seq.nextval,'영상테마파크','나주역','Honam');
insert into place values(place_seq.nextval,'불회사','나주역','Honam');
insert into place values(place_seq.nextval,'김대중 노벨평화상 기념관 ','목포역','Honam');
insert into place values(place_seq.nextval,'유달산 조각 공원','목포역','Honam');
insert into place values(place_seq.nextval,'보성 녹차밭','보성역','Honam');
insert into place values(place_seq.nextval,'한국차박물관','보성역','Honam');
insert into place values(place_seq.nextval,'순천만습지','순천역','Honam');
insert into place values(place_seq.nextval,'순천만 국가정원','순천역','Honam');
insert into place values(place_seq.nextval,'아쿠아플라넷','여수엑스포역','Honam');
insert into place values(place_seq.nextval,'오동도','여수엑스포역','Honam');
insert into place values(place_seq.nextval,'촉석루','진주역','Youngnam');
insert into place values(place_seq.nextval,'진주성','진주역','Youngnam');
insert into place values(place_seq.nextval,'철암탄광역사촌 ','순천역','Honam');
insert into place values(place_seq.nextval,'삼방동 벽화 스튜디오 ','순천역','Honam');
insert into place values(place_seq.nextval,'만경대','동해역','Gwandong');
insert into place values(place_seq.nextval,'감추해수욕장','동해역','Gwandong');
insert into place values(place_seq.nextval,'정동진해변','정동진역','Gwandong');
insert into place values(place_seq.nextval,'모래시계공원','정동진역','Gwandong');
insert into place values(place_seq.nextval,'평리공원','서대전역','Chungcheong');
insert into place values(place_seq.nextval,'서대전공원','서대전역','Chungcheong');
insert into place values(place_seq.nextval,'오송호수공원','오송역','Chungcheong');
insert into place values(place_seq.nextval,'만수공원','오송역','Chungcheong');
insert into place values(place_seq.nextval,'영천시민가족공원','영천역','Youngnam');
insert into place values(place_seq.nextval,'영천역급수탑','영천역','Youngnam');
insert into place values(place_seq.nextval,'신세동벽화마을','안동역','Youngnam');
insert into place values(place_seq.nextval,'안동문화의거리','안동역','Youngnam');
insert into place values(place_seq.nextval,'토림식물원','전주역','Honam');
insert into place values(place_seq.nextval,'전주역사갤러리','전주역','Honam');

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
insert into STATION_CONNECT(depart,arrived,spent_time) values('전주역','익산역',20);
insert into STATION_CONNECT(depart,arrived,spent_time) values('순천역','전주역',73);
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

insert into MEMBER values('java','1234','아이유','여','01012341234','${pageContext.request.contextPath}/resources/images/profile/kakao.jpg');

insert into manager values('tomo',1234);