-- HR 계정에서 ( employees 테이블 )

--1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력
SELECT employee_id,  FIRST_NAME || ' ' || LAST_NAME as FULLNAME , HIRE_DATE
FROM employees
WHERE HIRE_DATE BETWEEN TO_DATE('03-01-01', 'YY-MM-DD') AND TO_DATE('03-12-31', 'YY-MM-DD');

SELECT employee_id,first_name || ' ' || last_name AS full_name,hire_date
FROM employees
WHERE to_char(hire_date,'YYYY')= '2003';
--2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력
SELECT *
FROM employees
WHERE job_id='FI_ACCOUNT' OR  job_id='FI_MGR' OR  job_id='SA_MAN' OR  job_id='SA_REP' ;

--3. 커미션을 받는 사원들의 명단을 출력
SELECT employee_id,  FIRST_NAME || ' ' || LAST_NAME as FULLNAME 
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL AND commission_pct !=0;

--4.업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력
SELECT    *,
CASE JOB_ID
WHEN 'SA_MAN' THEN '판매부서'
WHEN 'SA_REP' THEN '판매부서'
ELSE '그 외 부서'
END    as JOB_IDD
FROM   employees; 

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,
CASE JOB_ID
WHEN 'SA_MAN' THEN '판매부서'
WHEN 'SA_REP' THEN '판매부서'
ELSE '그 외 부서'
END as duty
FROM employees;
SELECT employee_id,first_name || ' ' || last_name AS full_name,job_id,

decode(job_id, 'SA_MAN','판매부서','SA_REP','판매부서','그 외 부서') as duty
FROM employees;

