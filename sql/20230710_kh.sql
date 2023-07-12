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
-- ‘전’씨 성을 가진 직원 이름과 급여 조회
-- 핸드폰의 앞 네 자리 중 첫 번호가 7인 직원 이름과 전화번호 조회
-- EMAIL ID 중 ‘_’의 앞이 3자리인 직원 이름, 이메일 조회
-- like '__*_' escape '*'
-- ‘이’씨 성이 아닌 직원 사번, 이름, 이메일 조회
-- 관리자도 없고 부서 배치도 받지 않은 직원 조회
-- 부서 배치를 받지 않았지만 보너스를 지급받는 직원 조회
-- D6 부서와 D8 부서원들의 이름, 부서코드, 급여 조회
-- ‘J2’ 또는 ‘J7’ 직급 코드 중 급여를 2000000보다 많이 받는 직원의 이름, 급여, 직급코드 조회

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

















