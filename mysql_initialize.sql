drop database app;
create database app;
USE app;
create table user_table (
	userid varchar(30) primary key,
    passwd varchar(30) NOT NULL,
    name varchar(30) not null,
    phone varchar(20) not null,
    email varchar(30) not null,
    alarm boolean default False,
    leave_date datetime null
);
create table group_table (
	groupid int auto_increment primary key,
    theme varchar(30) not null,
    area varchar(30) not null,
    group_startdate varchar(30) not null,
    group_duedate varchar(30) not null,
    group_location varchar(30) not null,
    group_location2 varchar(30) not null,
    group_title varchar(100) not null,
    group_details varchar(1000) not null,
    group_owner varchar(30) null,
    foreign key(group_owner) references user_table(userid) on delete set null
);
create table member_table(
	memberid int auto_increment primary key,
    groupid int not null,
    userid varchar(30) not null,
    stats varchar(10) not null,
    foreign key(groupid) references group_table(groupid) on delete cascade,
    foreign key(userid) references user_table(userid) on delete cascade
);
create table message_table(
	chatid int auto_increment primary key,
	groupid int not null,
    userid varchar(30) not null,
    msg varchar(1000) not null,
    date_t varchar(25) not null
);
create table notice_table(
	noticeid int auto_increment primary key,
    groupid int not null,
	n_date varchar(30) null,
    n_loc varchar(50) null,
    n_book varchar(30) null,
    n_text varchar(500) null,
    foreign key(groupid) references group_table(groupid) on delete cascade
);
create table present_table(
	presentid int auto_increment primary key,
    groupid int not null,
    noticeid int not null,
    userid varchar(30) not null,
    fname varchar(100) null,
    foreign key(groupid) references group_table(groupid) on delete cascade,
    foreign key(noticeid) references notice_table(noticeid) on delete cascade,
    foreign key(userid) references user_table(userid) on delete cascade
);
create table vote_table(
	voteid int auto_increment primary key,
    groupid int not null,
    v_title varchar(50) not null,
    v_enddate varchar(30) not null,
    foreign key(groupid) references group_table(groupid) on delete cascade
);
create table vitem_table(
	vpk int auto_increment primary key,
	vitemid int,
    voteid int not null,
    vcontent varchar(100) not null,
    vtotal int not null,
    foreign key(voteid) references vote_table(voteid) on delete cascade
);