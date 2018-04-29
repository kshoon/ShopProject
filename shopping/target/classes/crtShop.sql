CREATE TABLE `member` (
   `member_no` INT(11) NOT NULL AUTO_INCREMENT,
   `member_category` CHAR(1) NOT NULL,
   `member_id` VARCHAR(15) NOT NULL,
   `member_pw` VARCHAR(20) NOT NULL,
   `member_name` VARCHAR(5) NOT NULL,
   `member_email` VARCHAR(30) NOT NULL,
   `member_phone` VARCHAR(13) NOT NULL,
   `member_birth` VARCHAR(6) NOT NULL,
   `member_gender` CHAR(1) NOT NULL,
   `addr_si` VARCHAR(10) NOT NULL,
   `addr_gu` VARCHAR(10) NOT NULL,
   `addr_dong` VARCHAR(10) NOT NULL,
   `addr_bunzi` VARCHAR(10) NOT NULL,
   `fcmToken` TEXT NULL DEFAULT NULL,
   PRIMARY KEY (`member_no`),
   UNIQUE INDEX `member_id` (`member_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
create table category (
category_no int auto_increment primary key,
category_big varchar(30) not null,
category_middle varchar(30) not null,
category_small varchar(30) not null
)
create table product (
product_no int auto_increment primary key,
product_name varchar(20) not null,
)

create table shop (
shop_no int auto_increment primary key,
member_no int not null,
shop_name varchar(40),
product_no int not null,
soldout_check char(1) not null default 0,
product_cob varchar(10) not null,
addr_si varchar(10) not null,
addr_gu varchar(10) not null,
addr_dong varchar(10) not null,
addr_bunzi varchar(10) not null,
shop_homepage varchar(70),
shop_hours varchar(30),
shop_explain text,
constraint foreign key (member_no) references member(member_no),
constraint foreign key (product_no) references product(product_no)
)

create table wishList (
wishList_no int auto_increment primary key,
member_no int not null,
product_no int not null,
wishList_date timestamp default now(),
alarm_check char(1) default 0,
constraint foreign key (member_no) references member(member_no),
constraint foreign key (product_no) references product(product_no)
)
