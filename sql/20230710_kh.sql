select * from  EMPLOYEE;
select * from  DEPARTMENT;
select * from  JOB;
select * from  LOCATION;
select * from  NATIONAL;
select * from  SAL_GRADE;

select emp_name, length(emp_name) len, lengthb(emp_name) byteLen
    from employee
    ;
select * from employee where emp_name = '방명수';

--
--ORA-00911: 문자가 부적합합니다
--00911. 00000 -  "invalid character"
--SELECT EMAIL, INSTR(EMAIL, '@', -1, 1) 위치
--SELECT EMAIL, INSTR(EMAIL, '@') 위치
-- instr - 1부터시작
SELECT EMAIL, INSTR(EMAIL, '@', 2) 위치
    FROM EMPLOYEE
;
-- email 은 @ 이후에 . 1개 이상있어야 함.
SELECT EMAIL, INSTR(EMAIL, '@'), INSTR(EMAIL, '.', INSTR(EMAIL, '@')) 위치
    FROM EMPLOYEE
    where INSTR(EMAIL, '.', INSTR(EMAIL, '@')) <> 0
;
--
select INSTR('AORACLEWELCOME', 'O', 1)   from dual;
select INSTR('AORACLEWELCOME', 'O', 1, 2)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 1, 3)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3)   from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3, 2)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3, 3)    from dual;

-- 급여를 3500000보다 많이 받고 6000000보다 적게 받는 직원이름과 급여 조회
-- '전'씨 성을 가진 직원 이름과 급여 조회
-- 핸드폰의 앞 네 자리 중 첫 번호가 7인 직원 이름과 전화번호 조회
-- EMAIL ID 중 '_'의 앞이 3자리인 직원 이름, 이메일 조회
-- like '__*_' escape '*'
-- '이'씨 성이 아닌 직원 사번, 이름, 이메일 조회
-- 관리자도 없고 부서 배치도 받지 않은 직원 조회
-- 부서 배치를 받지 않았지만 보너스를 지급받는 직원 조회
-- D6 부서와 D8 부서원들의 이름, 부서코드, 급여 조회
-- 'J2' 또는 'J7' 직급 코드 중 급여를 2000000보다 많이 받는 직원의 이름, 급여, 직급코드 조회

-- 모든 사원들의 남, 여 성별과 함께 이름과 주민번호
select emp_name, emp_no, 
        decode(substr(emp_no, 8,1), 2, '여', 4, '여', 1, '남', 3, '남', '그외')
        as "성 별"
    from employee
;
select emp_name, emp_no, 
        case
            when substr(emp_no, 8,1) = 2 then '여'
            when substr(emp_no, 8,1) > 1 then '남'
            when substr(emp_no, 8,1) > 4 then '여'
            when substr(emp_no, 8,1) > 3 then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
select emp_name, emp_no, 
        case substr(emp_no, 8,1)
            when '2' then '여'
            when '1' then '남'
            when '4' then '여'
            when '3' then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
select emp_name, emp_no, 
--ORA-00932: 일관성 없는 데이터 유형: CHAR이(가) 필요하지만 NUMBER임
--00932. 00000 -  "inconsistent datatypes: expected %s got %s"
--ORA-00932: 일관성 없는 데이터 유형: NUMBER이(가) 필요하지만 CHAR임
--00932. 00000 -  "inconsistent datatypes: expected %s got %s"
        case to_number(substr(emp_no, 8,1))
            when 2 then '여'
            when 1 then '남'
            when 4 then '여'
            when 3 then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
-- java, js 삼항연산자
-- string a = ( substr(emp_no, 8,1) == 2 ? "여" : "남";
--if(substr(emp_no, 8,1) == 2){
--    return "여";
--} else {
--    return "남";
--}
--if(substr(emp_no, 8,1) == 2){
--    return "여";
--} else if(substr(emp_no, 8,1) == 4) {
--    return "여";
--} else if(substr(emp_no, 8,1) == 1) {
--    return "남";
--} else if(substr(emp_no, 8,1) == 3) {
--    return "남";
--} else {
--    return "그외";
--}
--switch(substr(emp_no, 8,1)){
--    case 1:
--        return "남";
--    case 2:
--        return "여";
--    case 3:
--        return "남";
--    case 4:
--        return "여";
--    default:
--        return "그외";
--}



select substr(emp_no, 8,3) from employee;

-- 직원들의 평균 급여는 얼마인지 조회
select (avg(salary)) 평균급여 from employee;
select floor(avg(salary)) 평균급여 from employee;
select trunc(avg(salary), 4) 평균급여 from employee;
select round(avg(salary)) 평균급여 from employee;
select ceil(avg(salary)) 평균급여 from employee;

SELECT COUNT(DISTINCT DEPT_CODE) 
    FROM EMPLOYEE;
SELECT COUNT(DEPT_CODE) 
    FROM EMPLOYEE;  -- 21
SELECT COUNT(*) 
    FROM EMPLOYEE; -- 23
SELECT * --COUNT(*) 
    FROM EMPLOYEE 
    where dept_code is null;
-- count 는 resultset의 row값이 null 이면 count 되지 않음.
-- count(*) row 개수
SELECT COUNT(dept_code), count(bonus), count(emp_id), count(manager_id), count(*)
    FROM EMPLOYEE 
    where dept_code is null;
    
SELECT COUNT(DEPT_CODE), COUNT(distinct DEPT_CODE)
    FROM EMPLOYEE; 

SELECT DEPT_CODE    FROM EMPLOYEE; 
SELECT distinct DEPT_CODE    FROM EMPLOYEE; 

SELECT distinct DEPT_CODE    FROM EMPLOYEE
    order by dept_code asc
; 
-- EMPLOYEE에서 부서코드, 그룹 별 급여의 합계, 그룹 별 급여의 평균(정수처리), 인원 수를 조회하고 부서 코드 순으로 정렬

-- EMPLOYEE테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬
-- EMPLOYEE테이블에서 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고 인원수로 내림차순 정렬


--부서 코드와 급여 3000000 이상인 직원의 그룹별 평균 조회
select dept_code, avg(salary)
    from employee
-- 사원 각자의 급여가 3000000 이상
    where salary >= 3000000
    group by dept_code
;
--부서 코드와 급여 평균이 3000000 이상인 그룹 조회
select dept_code, avg(salary)
    from employee
    group by dept_code
-- 그룹된 부서별 평균 급여가 3000000 이상
    having avg(salary) > 3000000
;

--- 사원명, 부서번호, 부서명, 부서위치를 조회
select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 on tb3.national_code = tb4.national_code 
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;
--- 사원명, 부서번호, 부서명, 부서위치를 조회
--ORA-00904: "TB3"."NATIONAL_CODE": 부적합한 식별자
--00904. 00000 -  "%s: invalid identifier"
--select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
select tb1.emp_name as c1, tb1.dept_code c2, tb2.dept_title, tb2.location_id, national_code, tb4.national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 using (national_code)
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;
select emp_name, dept_code, dept_title, location_id, national_code, national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 using (national_code)
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;

select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
    from employee tb1, department tb2, location tb3, national tb4
    where tb1.dept_code = tb2.dept_id
        and tb2.location_id = tb3.local_code
        and tb3.national_code = tb4.national_code 
;
select * from  EMPLOYEE;
select * from  DEPARTMENT;
select * from  JOB;
select * from  LOCATION;
select * from  NATIONAL;
select * from  SAL_GRADE;

select * 
from  EMPLOYEE e
 join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 left outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 right outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 full outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e , DEPARTMENT d 
 where e.dept_code=d.dept_id(+)
;
select * 
from  EMPLOYEE e , DEPARTMENT d 
 where e.dept_code(+)=d.dept_id
;
-- oracle join에서 full outer join 표기법없음
--ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
--01468. 00000 -  "a predicate may reference only one outer-joined table"
--select * 
--from  EMPLOYEE e
-- , DEPARTMENT d 
-- where e.dept_code(+)=d.dept_id(+)
--;


-- 20230712
-- 02 - 16. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)
select emp_id, emp_no, substr(emp_no, 1, 7), rPAD(substr(emp_no, 1, 7), 14, '*') 
    from employee
;

SELECT * FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY))
    FROM EMPLOYEE
    GROUP BY GROUPING SETS((DEPT_CODE, JOB_CODE, MANAGER_ID),
                            (DEPT_CODE, MANAGER_ID), 
                            (JOB_CODE, MANAGER_ID))
;
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY)) FROM EMPLOYEE GROUP BY (DEPT_CODE, JOB_CODE, MANAGER_ID);
SELECT DEPT_CODE, MANAGER_ID, FLOOR(AVG(SALARY))    FROM EMPLOYEE    GROUP BY (DEPT_CODE, MANAGER_ID);
SELECT JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY))    FROM EMPLOYEE    GROUP BY (JOB_CODE, MANAGER_ID);

SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY)) FROM EMPLOYEE GROUP BY (DEPT_CODE, JOB_CODE, MANAGER_ID)
union
SELECT DEPT_CODE, null, MANAGER_ID, FLOOR(AVG(SALARY))   FROM EMPLOYEE    GROUP BY (DEPT_CODE, MANAGER_ID)
union
SELECT null, JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY))  FROM EMPLOYEE    GROUP BY (JOB_CODE, MANAGER_ID);






SELECT DEPT_CODE
, JOB_CODE
--, MANAGER_ID
, FLOOR(AVG(SALARY))
    FROM EMPLOYEE
    GROUP BY DEPT_CODE  , JOB_CODE
--    , MANAGER_ID
;



create table user_grade(
    grade_code number primary key,
    grade_name varchar2(30) not null
    );
insert into user_grade values(10,'일반회원');
insert into user_grade values(20,'우수회원');
insert into user_grade values(30,'특별회원');
select * from user_grade;
drop table user_foreignkey;
create table user_foreignkey(
    user_no number primary key,
    user_id varchar2(20) unique,
    user_pwd varchar2(30) not null,
    user_name varchar2(30),
    gender varchar2(10),
    phone varchar2(30),
    email varchar2(50),
    grade_code number not null,
    -- 여기 constraint 이름정해주기. 
    -- FK_user_foreignkey_grade_code_user_grade
    -- 자동생성 SYS_0000000
    constraint FK_user_foreignkey_grade_code_user_grade   foreign key (grade_code)  references user_grade(grade_code) 
    );
insert into user_foreignkey values(1,'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@kh.or.kr',10);
insert into user_foreignkey values(2,'user02', 'pass02', '이순신', '남', '010-9012-3456', 'lee123@kh.or.kr',20);
insert into user_foreignkey values(3,'user03', 'pass03', '유관순', '여', '010-3131-3131', 'yoo123@kh.or.kr',30);
insert into user_foreignkey values(4,'user04', 'pass04', '신사임당', '여', '010-1111-1111', 'shin123@kh.or.kr',null);
insert into user_foreignkey values(5,'user05', 'pass05', '안중근', '남', '010-4444-4444', 'ahn123@kh.or.kr',50);
drop table user_foreignkey2;
create table user_foreignkey2(
    user_no number primary key,
    user_id varchar2(20) unique,
    user_pwd varchar2(30) not null,
    user_name varchar2(30),
    gender varchar2(10),
    phone varchar2(30),
    email varchar2(50),
    grade_code number constraint FK_user_foreignkey2_grade_code_user_grade references user_grade
--    grade_code number references user_grade(grade_code) on delete cascade
    );

insert into user_foreignkey2 values(1,'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@kh.or.kr',10);
insert into user_foreignkey2 values(2,'user02', 'pass02', '이순신', '남', '010-9012-3456', 'lee123@kh.or.kr',20);
insert into user_foreignkey2 values(3,'user03', 'pass03', '유관순', '여', '010-3131-3131', 'yoo123@kh.or.kr',30);
insert into user_foreignkey2 values(4,'user04', 'pass04', '신사임당', '여', '010-1111-1111', 'shin123@kh.or.kr',null);
insert into user_foreignkey2 values(5,'user05', 'pass05', '안중근', '남', '010-4444-4444', 'ahn123@kh.or.kr',50);

delete from user_grade where grade_code=0;
--ORA-02292: 무결성 제약조건(KH.SYS_C008483)이 위배되었습니다- 자식 레코드가 발견되었습니다
--ORA-02292: 무결성 제약조건(KH.FK_USER_FOREIGNKEY_GRADE_CODE_USER_GRADE)이 위배되었습니다- 자식 레코드가 발견되었습니다
select * from user_constraints;
select * from user_foreignkey;
select * from user_foreignkey2;


select ename, emp_no, substr(emp_no, 1,6)
--    , TO_DATE(substr(emp_no, 1,6), 'rrmmdd')
from employee;


CREATE TABLE USER_CHECK(
USER_NO NUMBER PRIMARY KEY,
USER_ID VARCHAR2(20) UNIQUE,
USER_PWD VARCHAR2(30) NOT NULL,
USER_NAME VARCHAR2(30),
GENDER VARCHAR2(10) ,
PHONE VARCHAR2(30),
EMAIL VARCHAR2(50)
, CHECK (GENDER IN ('남', '여'))
);
INSERT INTO USER_CHECK VALUES(1, 'user01', 'pass01', '홍길동', '남자', '010-1234-5678', 
'hong123@kh.or.kr')
;



SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1'
;

--20230714
select * from user_constraints order by table_name desc;
select * from employee;

delete from employee;
TRUNCATE table employee;
drop table employee;

create table TB_CLASS_PROFESSOR_copy as select * from TB_CLASS_PROFESSOR;

select * from user_tables;


--ORA-00998: 이 식은 열의 별명과 함께 지정해야 합니다
--00998. 00000 -  "must name this expression with a column alias"
CREATE OR REPLACE VIEW V_EMP_JOB2 
    AS SELECT EMP_ID , EMP_NAME , JOB_NAME , 
        DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여') ,
        EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM HIRE_DATE) 
        FROM EMPLOYEE
        JOIN JOB USING(JOB_CODE)
;
SELECT * FROM V_EMP_JOB;
select EXTRACT(YEAR FROM SYSDATE) 
    ,EXTRACT(month FROM SYSDATE) 
    ,EXTRACT(day FROM SYSDATE) 
-- 오류    ,EXTRACT(hour FROM SYSDATE) 
from dual;

--ORA-00918: 열의 정의가 애매합니다
--00918. 00000 -  "column ambiguously defined"
CREATE OR REPLACE VIEW V_JOB(JOB_CODE, JOB_NAME)
    AS SELECT j1.JOB_CODE, j1.JOB_NAME
        FROM JOB j1 
        JOIN JOB j2 
            on j1.job_code = j2.job_code
--        USING(JOB_CODE)
;
-- self join 은 반드시 table 별칭
select * from JOB;
INSERT INTO V_JOB VALUES('J8', '인턴');
commit;

CREATE OR REPLACE VIEW V_JOB2(JOB_CODE)
    AS SELECT JOB_CODE  FROM JOB 
;
select * from view_abc;


SELECT emp_id, emp_name, EXTRACT(YEAR FROM sysdate) - (1900 + substr(emp_no,1,2)) age,
        d.DEPT_TITLE , j.JOB_NAME 
FROM EMPLOYEE e 
        JOIN JOB j ON e.JOB_CODE = j.JOB_CODE  
        JOIN DEPARTMENT d ON DEPT_CODE = dept_id
where age = (SELECT min(EXTRACT(YEAR FROM sysdate) - (1900 + substr(emp_no,1,2))) minage
                FROM EMPLOYEE )
;
-- 춘대학 3-6
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
    FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY 2;

-- 04-2
--2. 나이 상 가장 막내의 사원 코드, 사원 명, 나이, 부서 명, 직급 명 조회
select emp_id, emp_name, d.dept_title, j.job_name
            , Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr')) age
    from employee e
    join department d on ( e.dept_code = d.dept_id)
    join "JOB" j using (job_code)
    where emp_no = (select max(emp_no) from employee)
;
select max(emp_no) from employee;
select max(emp_name) from employee;
select min(emp_name) from employee;


select * from 
    ( select emp_id, emp_name, d.dept_title, j.job_name
                , Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr')) age
        from employee e
        join department d on ( e.dept_code = d.dept_id)
        join "JOB" j using (job_code)
    ) tb1
    where age = (select min(Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr'))) minage
                    from employee)
;
select min(Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr'))) minage
    from employee;




--ORA-01847: 달의 날짜는 1에서 말일 사이어야 합니다
--01847. 00000 -  "day of month must be between 1 and last day of month"
select Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr'))
    from employee
;
select emp_no, extract(year from to_date(substr(emp_no,1,2), 'yy')),
-- rr 은 50을 기준으로 1951, 2049
    extract(year from to_date(substr(emp_no,1,2), 'rr')),
    case 
    when Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'yy')) < 0
    then Extract(year from sysdate)- (extract(year from to_date(substr(emp_no,1,2), 'yy'))-100)
    end age
from employee;
-- 
select extract(year from to_date('500112', 'yymmdd')) yy
        , extract(year from to_date('500112', 'rrmmdd')) mm
        , extract(year from to_date('450112', 'yymmdd')) yy
        , extract(year from to_date('450112', 'rrmmdd')) mm
        , extract(year from to_date('990112', 'yymmdd')) yy
        , extract(year from to_date('990112', 'rrmmdd')) mm
    from dual;

-- 04-7. 한국이나 일본에서 근무 중인 사원의 사원 명, 부서 명, 지역 명, 국가 명 조회
select emp_name, tb_d.dept_title, tb_e.job_name, tb_d.local_name, tb_d.national_name
    from (select * from employee e join "JOB" j using(job_code)) tb_e
    join (
            select * from department d 
                join location c on (d.location_id=c.local_code)
                join national n using (national_code)
                where n.national_name in ('한국','일본')
                ) tb_d
    on tb_e.dept_code = tb_d.dept_id
;
select * from department;
select * from location;
select * from national;
select emp_name, dept_code from employee;
select e1.emp_name, e2.emp_name
    from employee e1
    join employee e2 on e1.dept_code=e2.dept_code and e1.emp_name <> e2.emp_name
--    where e1.emp_name <> e2.emp_name
order by e1.emp_name
;


--21. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회
-- (단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며
-- 나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)
select emp_name, dept_code,
        substr(emp_no, 1,2)||'년 '||substr(emp_no, 3,2)||'월 '||substr(emp_no, 5,2)||'일' "생년월일"
        , Extract(year from sysdate)-extract(year from to_date(substr(emp_no,1,2), 'rr')) "만나이"
    from employee
;
select emp_name
        , to_date(substr(emp_no, 1,6), 'rrmmdd')
        , to_char(to_date(substr(emp_no, 1,6), 'rrmmdd'), 'yy"년" mm"월" dd"일"') "생년월일"
        , floor((sysdate - to_date(substr(emp_no, 1,6), 'rrmmdd'))/365) "진짜 만나이"
    from employee;

select student_name, student_ssn, entrance_date from tb_student;
select student_name, student_ssn, entrance_date 
    , extract(year from to_date(substr(student_ssn, 1,2), 'rr')) birth
    , extract(year from entrance_date) entr
    , extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1,2), 'rr'))+1  aaa
from tb_student
where extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1,2), 'rr'))+1 > 20
;
select * from (
        select student_name, student_ssn, entrance_date 
            , extract(year from to_date(substr(student_ssn, 1,2), 'rr')) birth
            , extract(year from entrance_date) entr
            , extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1,2), 'rr'))+1  aaa
        from tb_student) tb1
where tb1.aaa > 20
;
select * from (
        select student_name, student_ssn, entrance_date 
            , case when (substr(student_ssn, 1,2)) > 23 then substr(student_ssn, 1,2)+1900
                else substr(student_ssn, 1,2)+2000
                end birth
            , extract(year from entrance_date) entr
            , extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1,2), 'rr'))+1  aaa
        from tb_student) tb1
where tb1.aaa > 20
;


select * from user_indexes;



SELECT * FROM EMPLOYEE
--    WHERE EMP_NO > '0'
;
create synonym emp for employee;
select * from emp;



-- 20230717
-- group by - 꼭 지켜져야하는 룰 : group by 컬럼명, 컬럼명 만 select 로 선택할 수 있음. 또는 그룹함수 사용가능.
SELECT JOB_CODE, SUM(SALARY) sumsal, count(*) cnt    FROM EMPLOYEE    group by JOB_CODE              ORDER BY 1;
-- 집계(전체)
SELECT JOB_CODE, SUM(SALARY)    FROM EMPLOYEE    GROUP BY ROLLUP(JOB_CODE)      ORDER BY 1;
SELECT JOB_CODE, SUM(SALARY)    FROM EMPLOYEE    GROUP BY CUBE(JOB_CODE)        ORDER BY 1;
-- group by
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE    group by DEPT_CODE, JOB_CODE    ORDER BY 1;
-- 집계 (전체)
-- DEPT_CODE 묶인 것이 없음.
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(JOB_CODE, DEPT_CODE) ORDER BY 1;
-- JOB_CODE 묶인 것이 없음.
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) ORDER BY 1;


SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY CUBE(DEPT_CODE, JOB_CODE) ;
-- 위 아래 같은 결과를 나오게 하기 위해서는 cube(c1, c2) = rollup(c1, c2)+rollup(c2)
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) 
UNION all
SELECT '', JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(JOB_CODE) ORDER BY 1;


SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY CUBE(DEPT_CODE, JOB_CODE) ORDER BY 1;
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY),
        CASE 
        -- grouping(c1) : c1의 집계부분인지 0,1로 확인됨.
        -- 0 : 해당 컬럼으로 grouping 된 안된상태. = C1각각의 상태
        -- 1 : 해당하는 컬럼으로 grouping 된 상태. = 전체상태
        WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1         THEN '부 합계'
        WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 0         THEN '직 '
        WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 1         THEN '총 합계'
        ELSE '그룹별 합계'
        END AS 구분
    FROM EMPLOYEE
    GROUP BY CUBE(DEPT_CODE, JOB_CODE)
    ORDER BY 1;
    
    
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY),
        CASE 
        -- grouping(c1) : c1의 집계부분인지 0,1로 확인됨.
        -- 0 : 해당 컬럼으로 grouping 된 안된상태. = C1각각의 상태
        -- 1 : 해당하는 컬럼으로 grouping 된 상태. = 전체상태 = 결과에 null 로 표현됨.
        WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1         THEN '부 합계'
        -- ROLLUP인 경우 나타나지 않음.
        WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 0         THEN '직 '
        WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 1         THEN '총 합계'
        ELSE '그룹별 합계'
        END AS 구분
    FROM EMPLOYEE
    GROUP BY rollup(DEPT_CODE, JOB_CODE)  
    ORDER BY 1;


-- grouping sets : group by 한 결과물을 union 함.
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, FLOOR(AVG(SALARY)) FROM EMPLOYEE
    GROUP BY GROUPING SETS((DEPT_CODE, JOB, MANAGER_ID),(DEPT_CODE, MANAGER_ID), (JOB_CODE, MANAGER_ID));


-- 춘대학교 3-15 rollup, cube 사용


--	분석함수 종류
--	a. 순위함수 : RANK(), DENSE_RANK(), ROW_NUMBER(), NTILE()
--	b. 집계함수 = 그룹함수: COUNT(), SUM(), AVG(), MIN(), MAX()
--	c. 그룹함수 = 집계함수 group by : ROLLUP()+grouping(), CUBE()+grouping(), GROUPING SET() 참고 “3_GROUP BY_HAVING4.pdf”
--	d. 1 : CUME_DIST(), RATIO_TO_REPORT()
--	e. \\\LAG(), ///LEAD()
--	f. FIRST_VALUE(), LAST_VALUE()
--	
--	"위 c 제외한 
--분석함수의 윈도우-범위(영역) 정하기"
--	a,b,d,e,f 분석함수
--	OVER()  ==> window - 윈도우 영역 절
--1	OVER()
--2	OVER( PARTITION BY 컬1 )
--3	OVER( ORDER BY 컬1 DESC, 컬2 ASC, 컬3 DESC )
--4	OVER( PARTITION BY 컬1 ORDER BY 컬1 DESC, 컬2, 컬3 )
--5	OVER( PARTITION BY 컬1 ROWS 아래 참고)
--5-1	OVER( PARTITION BY 컬1 ROWS ~ )
--5-2	OVER( PARTITION BY 컬1 ROWS BETWEEN ~ AND ~ )
--~	UNBOUNDED PRECEDING
--~	UNBOUNDED FOLLOWING
--~	CURRENT ROW
--~	2 PRECEDING
--~	1 FOLLOWING
--6	OVER( PARTITION BY 컬1 ORDER BY 컬1 DESC, 컬2, 컬3 ROWS BETWEEN ~ AND ~ )



SELECT EMP_NAME, DEPT_code, SALARY,
    LAG(SALARY, 2, 0) OVER (ORDER BY SALARY) 이전값,
    -- 2번째매개인자 : 몇행이전인지 나타냄. 1 이전행, 2 전전행
    -- 3번째매개인자 : 이전행이 없다면 출력할 값을 작성 (이전행 있다면 이전행값)
    -- 1 : 위의 행값, 0 : 이전행이 없으면 0 처리함
    LAG(SALARY, 1, SALARY) OVER (ORDER BY SALARY) "조회2",
    -- 이전행이 없으면 현재 행의 값을 출력
    LAG(SALARY, 1, SALARY) OVER (PARTITION BY DEPT_code ORDER BY SALARY) "조회3"
    -- 부서 그룹안에서의 이전 행값 출력
    
    ,LEAD(SALARY, 1, 0) OVER (ORDER BY SALARY) 다음값,
    -- 2번째매개인자 : 몇행다음인지 나타냄. 1 다음행, 2 다다음행
    -- 3번째매개인자 : 다음행이 없다면 출력할 값을 작성 (다음행 있다면 다음행값)
    -- 1 : 다음 행값, 0 : 다음행이 없으면 0 처리함
    LEAD(SALARY, 1, SALARY) OVER (ORDER BY SALARY) "조회2",
    -- 다음행이 없으면 현재 행의 값을 출력
    LEAD(SALARY, 1, SALARY) OVER (PARTITION BY DEPT_code  ORDER BY SALARY) "조회3"
    -- 부서 그룹안에서의 다음 행값 출력
FROM EMPLOYEE
--order by DEPT_code, SALARY
;


SELECT DEPT_code, EMP_ID, SALARY
-- 1 preceding and 1 following 
-- 현재 행을 중심으로 이전행부터 다음행의 급여합계
        , SUM(SALARY) OVER (PARTITION BY DEPT_code ORDER BY EMP_ID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) win1
-- 1 preceding and current row
-- 이전행부터 현재행의 급여 합계
        , SUM(SALARY) OVER (PARTITION BY DEPT_code ORDER BY EMP_ID ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) win2
-- current row and 1 following
-- 현재 행과 다음행의 합계
        , SUM(SALARY) OVER (PARTITION BY DEPT_code ORDER BY EMP_ID ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) win3
    FROM EMPLOYEE
--    WHERE DEPT_code = 'D5'
; 

DESC EMPLOYEE;


select * from tb_student where student_no = 'A113070'
;
select s.*, (select department_name from tb_department where department_no=s.department_no) department_name
from tb_student s where student_no = 'A113070'
;

select * from tb_student join tb_department using(department_no) where student_no ='A213026'
;
select s.*, department_name  
from tb_student s join tb_department d on(s.department_no=d.department_no) where student_no ='A213026'
;
select * from tb_student where student_name like '%영%' or student_address like '%영%'
;

desc tb_department;

select DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY from tb_department
order by OPEN_YN desc, CATEGORY, DEPARTMENT_NAME 
;
select * from tb_student order by student_no desc;
select current_timestamp from dual;
select SYSTIMESTAMP from dual;


















