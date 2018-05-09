

create table s_member (
	uid varchar(45) not null,
	name varchar(45) not null,
	passwd varchar(45) not null,
	email varchar(45) default null,
	date datetime not null,
	primary key(uid)
) engine=InnoDB default ChaRSET=utf8;

create table s_message (
	mid int(11) not null auto_increment,
	uid varchar(45) not null,
	msg varchar(200) not null,
	favcount int(11) default '0',
	replycount int(11) default '0',
	date datetime not null,
	primary key(mid)
	)engine=innodb default charset=utf8;

	
create table s_reply(
	rid int(11) not null auto_increment,
	mid int(11) not null,
	uid varchar(45) not null,
	date datetime not null,
	rmsg varchar(45) not null,
	primary key(rid),
	key message_fk_idx (mid),
	constraint message_fk foreign key (mid) references s_message (mid)
	on delete cascade on update no action//지울때 ,업데이트할때 mid관계를 무시하고 지워라.
)engine=innodb auto_increment=134 default charset=utf8;
