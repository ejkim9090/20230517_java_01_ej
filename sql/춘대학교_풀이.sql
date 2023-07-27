-- 3-15
select * from (
select student_no, round(avg(point), 1) avgpoint
    from (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
    group by student_no
    ) tb1
where tb1.avgpoint >= 4.0
;
select student_no, round(avg(point), 1) avgpoint
    from (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
    group by student_no
    having avg(point) >= 4
;
select *
    from
        (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
;
select student_no, student_name, d.department_name, avg(point) avgpoint
    from
        (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
    group by student_no, student_name, d.department_name
;
-- -student_no 나타내지 않음.
select student_name
            , d.department_name
            , round(avg(point), 1) avgpoint  -- 화면에 나타낼때 round 하여 나타냄.
    from (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
    -- student_no, student_name, d.department_name 는 join 결과 같은 값으로 묶여지므로 select 에서 사용하도록 group by에 포함함.
    group by student_no, student_name, d.department_name  -- 같은학과 동명이인-student_no 포함
    having avg(point) >= 4  -- round 하지 않아야 함. 3.99평점은 추출(선택)되지 않아야 함.
;
--select student_name
----  group by 사용시 group by 에 사용한 컬럼명만 select 에 사용할 수 있음. + 그리고 그룹함수사용가능. 
---- 스칼라subquery 불가함.
----, (select department_name from tb_department t where t.department_no = s.department_no) department_name
--            , round(avg(point), 1) avgpoint  -- 화면에 나타낼때 round 하여 나타냄.
--    from (select * from tb_student where absence_yn<>'Y') s
----        join tb_department d using (department_no)
--        join tb_grade g using (student_no)
--    group by student_no, student_name  -- 같은학과 동명이인-student_no 포함
--    having avg(point) >= 4  -- round 하지 않아야 함. 3.99평점은 추출(선택)되지 않아야 함.
--;

-- 3-18
select  tb1.* from 
(
select student_name, avg(point) avgpoint
    from (
    -- 국어국문과 학생 추출    
    select * from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과')
    ) s
        join tb_grade g using (student_no)
    group by student_no, student_name
    order by avgpoint desc
) tb1
where rownum <= 1
;
select tb2.* from
(
select rownum rn,  tb1.* from 
(
select student_name, avg(point) avgpoint
    from (
    -- 국어국문과 학생 추출    
    select * from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과')
    ) s
        join tb_grade g using (student_no)
    group by student_no, student_name
    order by avgpoint desc
) tb1
) tb2
where rn >= 3
;
select student_no,student_name -- , avg(point) avgpoint
    from (
    -- 국어국문과 학생 추출    
    select * from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과')
    ) s
        join tb_grade g using (student_no)
    group by student_no, student_name
    having avg(point) = (  select max(avg(point)) 
        from tb_grade g 
        where student_no in (select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과'))
        group by g.student_no    )
;
select student_no, (avg(point)) 
        from tb_grade g 
        where student_no in (select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과'))
        group by g.student_no 
;
select max(avg(point)) 
        from tb_grade g 
        where student_no in (select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과'))
        group by g.student_no 
;
-- 국어국문학과인 student_no 찾기
select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name='국어국문학과')
;
                            

desc tb_department;
desc tb_grade;


-- 04-KH-join-10
--10. 보너스 포함한 연봉이 높은 5명의 사번, 이름, 부서 명, 직급, 입사일, 순위 조회
select tb2.* from
(
select tb1.*, rownum rn from
(
select emp_id, emp_name,(select dept_title from department d where dept_id = e.dept_code) "부서 명", job_code, hire_date, salary*12 + (salary*12*nvl(bonus,0)) sal_rank 
    from employee e
    order by sal_rank desc
) tb1
) tb2
where rn <= 5
;
select emp_id, salary*12 + (salary*12*nvl(bonus,0)) sal_rank from employee order by sal_rank desc;
select decode(bonus, null, 0, bonus) bonus from employee;
select * from employee;
select * from department;
---  입사일 순서가 빠른 사람 3명을 조회해 주세요.
select * from
(
select rownum rn, tb1.* from
(
select * from employee order by hire_date asc
) tb1
)
where rn <=3
;
select tb1.* from
(
select * from employee order by hire_date asc
) tb1
where rownum <= 3
;
desc tb_class;
desc tb_student;
-----------------
---- 춘대학교 04-15
-----------------
-- 최근3년
select term curr_term from (select distinct substr(term_no, 1, 4) term from tb_grade order by term desc) where rownum <= 3
;
-- 수강인원 (class_no별)
select count(*) cnt, class_no
    from tb_grade
    group by class_no
    order by cnt desc
;
-- 수강인원 top3==> n-Top (class_no별)
select * from
(
select tb1.*, rownum as rn from
(
select count(*) cnt, class_no    from tb_grade    group by class_no    order by cnt desc
)tb1
)tb2
where rn =3
;
-- 수강인원을 구하기 전.. 최근 3년이라는 조건으로 걸러낸 후 수강인원을 구해야함.
select count(*) cnt, class_no
    from tb_grade
    where substr(term_no, 1, 4) in (select term curr_term from (select distinct substr(term_no, 1, 4) term from tb_grade order by term desc) where rownum <= 3)
    group by class_no
    order by cnt desc
;
select count(*) from tb_grade
    where substr(term_no, 1, 4) in (select term curr_term from (select distinct substr(term_no, 1, 4) term from tb_grade order by term desc) where rownum <= 3)
;
-- n-top 
select cnt, class_no, (select class_name from tb_class where class_no=tb2.class_no) class_name from
(
select rownum rn, tb1.* from 
(
select count(*) cnt, class_no
    from tb_grade
    where substr(term_no, 1, 4) in (select term curr_term from (select distinct substr(term_no, 1, 4) term from tb_grade order by term desc) where rownum <= 5)
    group by class_no
    order by cnt desc
) tb1
) tb2
where rn <= 3
;

select * from tb_student
;
desc tb_student;









    
    
    
    
    
    
    
    