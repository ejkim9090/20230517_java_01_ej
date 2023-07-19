SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');   
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD2');   
    DBMS_OUTPUT.PUT('HELLO WORLD3');   
    DBMS_OUTPUT.PUT('HELLO WORLD4');
    DBMS_OUTPUT.PUT_LINE();
--오류 보고 -
--ORA-06550: 줄 6, 열5:PLS-00306: 'PUT_LINE' 호출 시 인수의 갯수나 유형이 잘못되었습니다
--ORA-06550: 줄 6, 열5:PL/SQL: Statement ignored
--06550. 00000 -  "line %s, column %s:\n%s"
END;
/
create or replace procedure pro_dept_insert
--DECLARE
is
    maxdno dept.deptno%type;
    dno dept.deptno%type;
--    dnm dept.dname%type;
--    dloc dept.loc%type;
BEGIN
    select max(deptno) into maxdno from dept;
    insert into emp (ename, empno, deptno) values ('EJ5', maxdno+10, 20);
    insert into emp (ename, empno, deptno) values ('EJ5', maxdno+10, 20);
    -- procedure 는 update, delete, select 등 모두 활용 가능함.
    commit;
END;
/
select * from user_procedures;
-- ROWTYPE
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT * INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = '&EMP_ID';
    DBMS_OUTPUT.PUT_LINE('EMP_ID : ' || E.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME : ' || E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMP_NO : ' || E.EMP_NO);
    DBMS_OUTPUT.PUT_LINE('SALARY : ' || E.SALARY);
END;
/
-- TYPE - IS TABLE OF
-- TYPE - IS RECORD


DECLARE
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS, 0) 
    INTO EMP_ID, EMP_NAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = '&EMP_ID';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY);
    IF BONUS = 0  THEN
        DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
        DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('보너스율 : ' || BONUS * 100 || '%');
END;
/
DECLARE
    SCORE INT;
    GRADE VARCHAR2(2);
BEGIN
    SCORE := '&SCORE';
    IF SCORE >= 90 THEN 
        GRADE := 'A';
        DBMS_OUTPUT.PUT_LINE('학점은 90점 이상으로 A학점입니다.');
    ELSIF SCORE >= 80 THEN 
        GRADE := 'B';
        DBMS_OUTPUT.PUT_LINE('학점은 80 이상으로 B학점입니다.');
    ELSIF SCORE >= 70 THEN 
        GRADE := 'C';
        DBMS_OUTPUT.PUT_LINE('학점은 70 이상으로 C학점입니다.');
    ELSIF SCORE >= 60 THEN 
        GRADE := 'D';
        DBMS_OUTPUT.PUT_LINE('학점은 60 이상으로 D학점입니다.');
    ELSE 
        GRADE := 'F';
        DBMS_OUTPUT.PUT_LINE('학점은 60 미만으로 F학점입니다.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 ' || SCORE || '점이고,  학점은 ' || GRADE || '학점입니다.');
END;

/
BEGIN
    FOR N IN (select emp_name, salary from employee) LOOP
        DBMS_OUTPUT.PUT_LINE(N.emp_name || ', '||N.salary);
    END LOOP;
END;

/
BEGIN
    FOR EMP_LIST IN (
        SELECT EMPNO, ENAME 
            FROM EMP
            WHERE EMPNO < 8000
            ORDER BY EMPNO
        )
    LOOP
        DBMS_OUTPUT.PUT_LINE('사원번호:' || EMP_LIST.EMPNO || ', 사원이름:' || EMP_LIST.ENAME);
    END LOOP;
END;
/
--CREATE OR REPLACE PROCEDURE KDY_GUGUDAN
--/
DECLARE
    DUP_EMPNO EXCEPTION;
    PRAGMA EXCEPTION_INIT(DUP_EMPNO, -00001);
    NOTEXIST_TABLEVIEW EXCEPTION;
    PRAGMA EXCEPTION_INIT(NOTEXIST_TABLEVIEW, -00942);
BEGIN
    UPDATE EMPLOYEE    SET EMP_ID = '&사번'    WHERE EMP_ID = 200;
EXCEPTION
    WHEN DUP_EMPNO THEN 
        DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
        DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다!!!.');
    WHEN NOTEXIST_TABLEVIEW THEN 
        DBMS_OUTPUT.PUT_LINE('없는 테이블 입니다.');
        DBMS_OUTPUT.PUT_LINE('없는 view 일지도 몰라요');
END;
/
--오류 보고 -
--ORA-00001: 무결성 제약 조건(KH.EMPLOYEE_PK)에 위배됩니다
UPDATE EMPLOYEE    SET EMP_ID = '&사번'    WHERE EMP_ID = 200;
--SQL 오류: ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
--00942. 00000 -  "table or view does not exist"
UPDATE EMPLOYEEa    SET EMP_ID = '&사번'    WHERE EMP_ID = 200;


select * from user_source;

-- procedure 만들기
-- 사원번호를 전달받아서 이름, 급여, 업무를 반환함.
create or replace procedure PRO_EMP_ARG_TEST
        ( ARG_EMPNO in EMP.EMPNO%TYPE
        , ARG_ENAME out EMP.ename%TYPE
        , ARG_SAL out EMP.sal%TYPE
        , ARG_JOB out EMP.job%TYPE        )
is
begin
    dbms_output.put_line('ARG_EMPNO: '|| ARG_EMPNO);
    select ename, sal, job
    into ARG_ENAME, ARG_SAL, ARG_JOB
    from emp
    where empno=ARG_EMPNO;
    
    dbms_output.put_line('ARG_ENAME: '|| ARG_ENAME);
    -- procedure 는 return 없음.- 대신 매개변수에 IN / OUT 를 설정해서 OUT로 설정하면 그것이 return 됨.
    -- function에는 return 있음.
end;
/
-- 바인드변수선언
VARIABLE VAR_ENAME varchar2(30);
VARIABLE VAR_SAL varchar2(30);
VARIABLE VAR_JOB varchar2(30);
-- procedure 실행
exec PRO_EMP_ARG_TEST(7902 , :VAR_ENAME, :VAR_SAL, :VAR_JOB  );
-- 출력
print VAR_ENAME;
print VAR_SAL;
print VAR_JOB;

DECLARE
    VAR_ENAME varchar2(30);
    VAR_SAL varchar2(30);
BEGIN
    I_USER_ID := 'LSG';

    TEST03(I_USER_ID,O_USER_ID);
    DBMS_OUTPUT.PUT_LINE('O_USER_ID : ' || O_USER_ID);    
END;

/
create or replace procedure select_empid
        ( arg_emp_id in employee.emp_id%type
        , arg_emp_name out employee.emp_name%type
        , arg_salary out employee.salary%type
        , arg_bonus out employee.bonus%type
        , arg_phone out employee.phone%type
        )
is
begin
    dbms_output.put_line('arg_emp_id: '|| arg_emp_id);
    select emp_name, salary, bonus, phone
    
        from employee
        where emp_id = 202;
end;
/

--variable var_emp_id varchar2(30);
variable var_emp_name varchar2(30);
variable var_salary number;
variable var_bonus number;

exec select_empid(200, :var_emp_name, :var_salary, :var_bonus);

print var_emp_name;
print var_salary;
print var_bonus;

desc employee;
select * from emp;


create or replace procedure pro_all_emp
is
begin
    for e in (select * from employee) loop
--        DBMS_OUTPUT.PUT_LINE(e.emp_name);
        select_empid(e.emp_id, e.emp_name, e.salary, e.bonus, e.phone);
        DBMS_OUTPUT.PUT_LINE(e.emp_name ||', '|| e.salary||', '|| e.bonus||', '|| e.phone);
    end loop;
end;
/
exec pro_all_emp;
select emp_name, salary, bonus, phone
    from employee
    where emp_code = 200;



---------------------------------------
---------------------------------------
-- 제어문
--IF 조건식1 THEN
--    조건이참일때 구문1;
--    조건이참일때 구문1;
--ELSIF 조건식2 THEN
--    조건식2가참일때 구문;
--    조건식2가참일때 구문;
--ELSIF 조건식3 THEN
--    조건식2가참일때 구문;
--ELSE
--    조건이거짓일때 구문2;
--    조건이거짓일때 구문2;
--END IF;

-- 매개변수선언
CREATE OR REPLACE PROCEDURE 
    DEPT_SEARCH (P_EMPNO  IN    EMP.EMPNO%TYPE
--    , P_ENAME IN EMP.ENAME%TYPE
    )
IS --DECLARE
    V_DEPTNO EMP.DEPTNO%TYPE;
BEGIN
    DBMS_OUTPUT.ENABLE;    -- 메시지버퍼 활성화
    
    SELECT DEPTNO
        INTO V_DEPTNO
        FROM EMP
        WHERE EMPNO = P_EMPNO;
    IF V_DEPTNO = 10 THEN
        DBMS_OUTPUT.PUT_LINE('ACCOUNTING 부서 사원입니다.');
    END IF;
    IF V_DEPTNO = 20 THEN
        DBMS_OUTPUT.PUT_LINE('RESEARCH 부서 사원입니다.');
    END IF;
    IF V_DEPTNO = 30 THEN
        DBMS_OUTPUT.PUT_LINE('SALES 부서 사원입니다.');
    END IF;
    IF V_DEPTNO = 40 THEN
        DBMS_OUTPUT.PUT_LINE('OPERATIONS 부서 사원입니다.');
    END IF;
--EXCEPTION
--    DBMS_OUTPUT.PUT_LINE('예기치 못한 오류가 발생하였습니다. 다시 시도해 주세요.');
END;
/
create sequence SEQ_TEST02;
--- 트리거 : 이벤트(INSERT,UPDATE, DELETE) 발생했을 때 
CREATE OR REPLACE TRIGGER TRG_AAA
    --옵션
    BEFORE
    INSERT ON DEPT
    REFERENCING NEW AS NEW
    FOR EACH ROW
BEGIN
    SELECT SEQ_TEST02.NEXTVAL INTO :NEW.DEPTNO FROM DUAL;
END;
/
SELECT SEQ_TEST02.NEXTVAL  FROM DUAL;
SELECT * FROM DEPT;
INSERT INTO DEPT    (DEPTNO, DNAME, LOC)    VALUES    (99, 'TEMP1', 'TEMPLOC');
INSERT INTO DEPT    (DEPTNO, DNAME, LOC)    VALUES    (SEQ_TEST02.NEXTVAL, 'TEMP1', 'TEMPLOC');
INSERT INTO DEPT    (DNAME, LOC)    VALUES    ('TEMP2', 'TEMPLOC');

-- DB table의 데이터가 안정적으로 동작할때까지 trigger 사용 자제.......