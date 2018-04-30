
create table vendor_info(
vendor_name varchar2(50) not null,
product_id varchar2(20) not null,
vendor_address varchar2(150) not null,
vendor_emp_no number(7,0) not null,
vendor_iso_file varchar2(50) not null,
vendor_cert_file varchar2(50) not null,
vendor_req_date date not null,
vendor_id varchar2(20) primary key,
vendor_valid varchar2(1) not null,
vendor_q_name varchar2(50) not null,
vendor_q_tel varchar2(20) not null,
vendor_q_email varchar2(100) not null,
vendor_s_name varchar2(50) not null,
vendor_s_tel varchar2(20) not null,
vendor_s_email varchar2(100) not null,
audit_next_date date ,
audit_result varchar2(20)
);

create table ncr_info(
ncr_id varchar2(20) primary key,
audit_id varchar2(20) not null,
issuer_id varchar2(20) not null,
issue_date date ,
ncr_comp_date date ,
ncr_comp varchar2(1) not null,
ncr_title varchar2(100) not null,
ncr_discription varchar2(4000) not null,
ncr_grade_id varchar2(20) not null,
);

create table ncr_grade (
ncr_grade_id varchar2(20) primary key,
ncr_grade_name varchar2(50) not null,
ncr_grade_valid varchar2(1) not null
); 

create table audit_info(
audit_id varchar2(20) primary key ,
audit_kind_id varchar2(10) not null,
audit_plan_date date,
audit_comp_date date,
audit_rsinput_date date,
auditor_id varchar2(20)not null,
vendor_id varchar2(20) not null,
audit_score number(3,0),
audit_result varchar2(1),
audit_next_date date
);

create table audit_kind(
audit_kind_id varchar2(20) primary key,
audit_kind varchar2(10),
audit_kind_period number(2,0)
);

create table member_info(
member_id varchar2(20) primary key,
member_name varchar2(50),
member_depart varchar2(50),
member_pass varchar2(50),
member_tel varchar2(50),
member_email varchar2(50),
member_valid varchar2(1)
);

create table audit_result(
audit_result_id varchar2(20) primary key,
audit_id varchar2(20),
checklist_id varchar2(20),
audit_score number(3,0)
);

create table ncr_attach(
ncr_id varchar2(20),
file_num number ,
o_name varchar2(100),
file_name varchar2(100),
file_size number 
);

create table ncr_reply(
ncr_id number,
reply_id varchar2(20) primary key,
reply_date date,
replier_id varchar2(20),
reply_discription varchar2(4000),
reply_from varchar2(20)
);

create table checklist(
checklist_id varchar2(50) primary key,
checklist_discription varchar2(4000),
audit_kind varchar2(20),
checklist_fullscore number(3,0),
checklist_valid varchar2(1)
);


create table category_info(
category_id varchar2(20) primary key,
category_name varchar2(50),
product_valid varchar2(1)
);

create table product_item(
category_id varchar2(20) not null,
product_id varchar2(20) primary key,
product_name varchar2(50),
product_valid varchar2(1)
);

create table reply_attach(

reply_id varchar2(20),
file_num number ,
o_name varchar2(100),
file_name varchar2(100),
file_size number,
ncr_id number
);






