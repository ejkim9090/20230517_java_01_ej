-- 3-15
select student_no, round(avg(point), 1) avgpoint
    from (select * from tb_student where absence_yn<>'Y') s
        join tb_department d using (department_no)
        join tb_grade g using (student_no)
    group by student_no
;
desc tb_department;
desc tb_grade;
    