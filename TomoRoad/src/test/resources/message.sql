create table message(
	m_no number primary key,
	m_sender varchar2(100) not null,
	m_receiver varchar2(100) not null,
	m_time date not null,
	m_content clob not null,
	m_checked number default 1
)
create sequence message_sequence nocache;

insert into message values(message_sequence.nextval,'java','goni',sysdate,'ㅎ2',1);
insert into message values(message_sequence.nextval,'goni','java',sysdate,'즐',1);

select count(*) from message where m_receiver='goni' and m_checked =1


select * from message where m_sender in('java','goni') and m_receiver in ('java','goni') order by m_time asc;

insert into message(m_no, m_sender, m_receiver, m_time, m_content, m_checked) values(message_sequence.nextval,'java','goni',sysdate,'와이',1)

