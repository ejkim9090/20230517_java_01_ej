PROMPT LOADING TB_DEPARTMENT...
INSERT INTO TB_DEPARTMENT (DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY)
VALUES ('001', '국어국문학과', '인문사회', 'Y', 20);
INSERT INTO TB_DEPARTMENT (DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY)
VALUES ('002', '영어영문학과', '인문사회', 'Y', 36);
INSERT INTO TB_DEPARTMENT (DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY)
VALUES ('052', '동서의료공학과', '공학', 'Y', 20);
PROMPT LOADING TB_CLASS...
INSERT INTO TB_CLASS (CLASS_NO, DEPARTMENT_NO, PREATTENDING_CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('C0245500', '001', NULL, '고전시가론특강', '전공선택');
INSERT INTO TB_CLASS (CLASS_NO, DEPARTMENT_NO, PREATTENDING_CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('C0405000', '001', NULL, '국어어휘론특강', '전공선택');
prompt Loading TB_PROFESSOR...
INSERT INTO TB_PROFESSOR (PROFESSOR_NO, PROFESSOR_NAME, PROFESSOR_SSN, PROFESSOR_ADDRESS, DEPARTMENT_NO)
VALUES ('P001', '김진영', '500530-1102646', '서울시 강서구 등촌1동 대동아파트103-704', '052');
INSERT INTO TB_PROFESSOR (PROFESSOR_NO, PROFESSOR_NAME, PROFESSOR_SSN, PROFESSOR_ADDRESS, DEPARTMENT_NO)
VALUES ('P002', '양윤필', '670510-1158493', '서울시 광진구 하양동 111-12', '001');
INSERT INTO TB_PROFESSOR (PROFESSOR_NO, PROFESSOR_NAME, PROFESSOR_SSN, PROFESSOR_ADDRESS, DEPARTMENT_NO)
VALUES ('P003', '신원하', '700808-1138187', '인천시 남동구 만수1동 삼한A 204-1102', '002');
prompt Loading TB_STUDENT...
INSERT INTO TB_STUDENT (STUDENT_NO, DEPARTMENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS, ENTRANCE_DATE, ABSENCE_YN, COACH_PROFESSOR_NO)
VALUES ('A213046', '001', '서가람', '830530-2124663', '경기도 군포시 산본동 1052번지 대림아파트 724-301호', to_date('01-03-2002', 'dd-mm-yyyy'), 'N', 'P002');
INSERT INTO TB_STUDENT (STUDENT_NO, DEPARTMENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS, ENTRANCE_DATE, ABSENCE_YN, COACH_PROFESSOR_NO)
VALUES ('A445008', '002', '남가영', '860510-2120325', '인천광역시 남동구 구월1동 1129-5 4층', to_date('01-03-2004', 'dd-mm-yyyy'), 'Y', 'P001');
-- commit 꼭 필요함.
commit;

--
--
--
--select * from TB_PROFESSOR;
--desc TB_DEPARTMENT;
--
--alter table TB_DEPARTMENT rename column CAPRCITY to CAPACITY;
--alter table TB_DEPARTMENT modify CAPACITY number;
--alter table TB_DEPARTMENT modify DEPARTMENT_NAME varchar2(30);
--alter table TB_CLASS modify CLASS_NAME varchar2(30);
--alter table TB_CLASS modify CLASS_TYPE varchar2(20);
--select * from user_constraints where constraint_name='PK_TB_PROFESSOR';
--
--select * from user_cons_columns where constraint_name='FK_TB_PROFESSOR_TO_TB_STUDENT_1';
--select * from user_constraints where constraint_name='FK_TB_PROFESSOR_TO_TB_STUDENT_1';
--select * from user_constraints where constraint_name='PK_TB_PROFESSOR';
--select * from user_cons_columns where constraint_name='PK_TB_PROFESSOR';
--select * from TB_PROFESSOR;
--
--select * from user_cons_columns where constraint_name='FK_TB_DEPARTMENT_TO_TB_STUDENT_1';
--select * from user_constraints where constraint_name='FK_TB_DEPARTMENT_TO_TB_STUDENT_1';
--select * from user_constraints where constraint_name='PK_TB_DEPARTMENT';
--select * from user_cons_columns where constraint_name='PK_TB_DEPARTMENT';
--select * from TB_DEPARTMENT;
