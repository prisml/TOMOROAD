create table message(
	m_no number primary key,
	m_sender varchar2(100) not null,
	m_receiver varchar2(100) not null,
	m_time date not null,
	m_content clob not null,
	m_checked number default 1,
	constraint fk_m_sender foreign key(m_sender) references member(id) ON DELETE CASCADE,
	constraint fk_m_receiver foreign key(m_receiver) references member(id) ON DELETE CASCADE
)
create sequence message_sequence nocache;

drop table message
drop sequence message_sequence

insert into message values(message_sequence.nextval,'goni','java',sysdate,'ddf',1);
insert into message values(message_sequence.nextval,'santa','java',sysdate,'즐',1);

select count(*) from message where m_receiver='goni' and m_checked =1


select * from message where m_sender in('java','santa') and m_receiver in ('java','santa') and m_checked=1 order by m_time asc
update message set m_checked = 0 where m_checked=1 and m_sender='goni' and m_receiver='java'

insert into message(m_no, m_sender, m_receiver, m_time, m_content, m_checked) values(message_sequence.nextval,'java','goni',sysdate,'와이',1)


select m_no,m_sender,m_receiver,m_time,m_content,m_checked 
from message 
where m_sender ='java' or m_receiver = 'java' order by m_time desc

select * from MESSAGE where m_sender = 'goni' and m_receiver = 'java' and m_checked = 1
select m_sender, count(*) as m_checked from message where m_receiver = 'java' and m_checked = 1 group by m_sender

elect A.* from(select b.no, b.title, b.station_name, b.member_id, b.posted_time, c.commentcount 
from BURN_BOARD b, (select burn_no, count(*) as commentcount from burn_comment where state='comment' group by burn_no) c
where b.no = c.burn_no) A
where rnum between 1 and 5

