--- 화면설계서 기준으로 DQL / DML 작성
-- UI007 화면설계서ID - 학생등록
INSERT INTO TB_STUDENT (STUDENT_NO, DEPARTMENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS, ENTRANCE_DATE, ABSENCE_YN, COACH_PROFESSOR_NO)
VALUES ('A445008', '002', '남가영', '860510-2120325', '인천광역시 남동구 구월1동 1129-5 4층', to_date('03-2004', 'mm-yyyy'), 'Y', 'P001');

commit;

-- UI008 학생-마이페이지
select STUDENT_NO, STUDENT_NAME, s.DEPARTMENT_NO, d.DEPARTMENT_NAME, STUDENT_ADDRESS, ABSENCE_YN, COACH_PROFESSOR_NO, p.PROFESSOR_NAME
    from TB_STUDENT s
    join TB_DEPARTMENT d on (s.DEPARTMENT_NO = d.DEPARTMENT_NO)
    join TB_PROFESSOR p on (s.COACH_PROFESSOR_NO = p.PROFESSOR_NO)
    where STUDENT_NO = 'A445008'
;
select STUDENT_NO, STUDENT_NAME, s.DEPARTMENT_NO
--            , d.DEPARTMENT_NAME
            , (select DEPARTMENT_NAME from TB_DEPARTMENT d where d.DEPARTMENT_NO = s.DEPARTMENT_NO) DEPARTMENT_NAME
            , STUDENT_ADDRESS, ABSENCE_YN, COACH_PROFESSOR_NO
--            , p.PROFESSOR_NAME
            , (select PROFESSOR_NAME from TB_PROFESSOR d where d.PROFESSOR_NO = s.COACH_PROFESSOR_NO) PROFESSOR_NAME
    from TB_STUDENT s
    where STUDENT_NO = 'A445008'
;
select * from TB_DEPARTMENT;
desc TB_DEPARTMENT;
desc TB_PROFESSOR;

-- UI002 화면설계서 학생리스트-찾기 검색
select * from tb_student where student_name like '%&검색어%' or student_address like '%&검색어%'
;
select * from tb_student where student_name like '%영%' or student_address like '%영%'
order by 3 desc
;
--String query= "select * from tb_student where student_name like ? or student_address like ?
--;

select * from
(
select tb1.*, rownum rn from
    (select * from tb_student order by student_no asc) tb1
) tb2
where rn between 6 and 10
;

















