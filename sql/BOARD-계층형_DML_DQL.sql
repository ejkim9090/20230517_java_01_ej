--DROP TABLE "BOARD_READ_RECORD";
--DROP TABLE "BOARD";
--DROP TABLE "MEMBER";

--desc member;
insert into MEMBER values ('kh1', '11','kh1name','kh1@a.co.kr')
;
insert into MEMBER values ('admin', 'admin','adminname','admin@a.co.kr')
;
insert into MEMBER values ('biz1', '11','biz1name','biz1@a.co.kr')
;
--desc board;
--COMMENT ON COLUMN "BOARD"."BNO" IS 'SEQ_BOARD_BNO 사용';
--COMMENT ON COLUMN "BOARD"."BTITLE" IS '제목';
--COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
--COMMENT ON COLUMN "BOARD"."BWRITE_DATE" IS '작성시간';
--COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
--COMMENT ON COLUMN "BOARD"."BREF" IS 'BNO=BREF:원본글, BNO<>BREF:답..글';
--COMMENT ON COLUMN "BOARD"."BRE_LEVEL" IS '0:원본글, 1:답글, 2:답답글...';
--COMMENT ON COLUMN "BOARD"."BRE_STEP" IS '0:원본글, 1-N 원본글기준답..글들의순서';
drop sequence SEQ_BOARD_BNO;
create sequence SEQ_BOARD_BNO;
delete from board;
--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, 'title1', 'content1', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, 'title2', 'content2', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, 'title3', 'content3', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, 'title4', 'content4', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
-- 원1 - 답글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 1, 1) ;
-- 원1- 5답-답답글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '5-답', '5-답', default, 'kh1', 1, 2, 2) ;
-- 원1 - 답글
update board set BRE_STEP = BRE_STEP + 1 where BRE_STEP > 0;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 1, 0+1) ;
-- 원1 - 7-답답글
update board set BRE_STEP = BRE_STEP + 1 where BRE_STEP > 1; 
insert into BOARD values (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 1+1, 1+1) ;

------ UI설계서 UI007 게시글 등록
-- n 글의 답글
update board set BRE_STEP = BRE_STEP + 1 
    where BRE_STEP > (select bre_step from board where bno='&n글') 
        and BREF = (select bref from board where bno='&n글')
; 
insert into BOARD values (SEQ_BOARD_BNO.nextval, '&n글 제목', '&n글 내용', default, 'kh1'
    , (select bref from board where bno='&n글')
    , (select bre_level+1 from board where bno='&n글')
    , (select bre_step+1 from board where bno='&n글')
    ) ;

-- JDBC
--원본글
--insert into BOARD values (SEQ_BOARD_BNO.nextval, ?, ?, default, ?, SEQ_BOARD_BNO.nextval, 0,0)
-- n 글의 답글
--update board set BRE_STEP = BRE_STEP + 1 where BRE_STEP > (select bre_step from board where bno=?)  and BREF = (select bref from board where bno=?)
--insert into BOARD values (SEQ_BOARD_BNO.nextval, ?, ?, default, ?    , (select bref from board where bno=?)    , (select bre_level+1 from board where bno=?)    , (select bre_step+1 from board where bno=?)    )
    
    
desc board;
------ UI설계서 UI007 게시글 목록 
select BNO, BTITLE, to_char(BWRITE_DATE, 'yyyy-mm-dd hh24:mi:ss') BWRITE_DATE, MID, BREF, BRE_LEVEL, BRE_STEP
    from board order by bref desc, bre_step asc;
commit;









