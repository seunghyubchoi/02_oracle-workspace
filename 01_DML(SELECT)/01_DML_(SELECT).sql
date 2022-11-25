/*

    < SELECT >
    데이터 조회할 때 사용되는 구문입니다
    
    >> RESULT SET : SELECT문을 통해 조회된 결과물
    즉, 조회된 행들의 집합을 의미합니다
    
    < 표현법 >
    SELECT 조회하고자 하는 컬럼1, 컬럼2, 컬럼3 ... 
    FROM 테이블명;
    
    * 조회를 할 때는 반드시 존재하는 컬럼의 이름을 적어야합니다
    => 없는 컬럼을 쓰면 오류가 납니다

*/

-- EMPLOYEE 내 COMLUMN_NAME 확인!
-- DB는 문자열만 존재(VARCHAR2, CHAR 다 문자열)

-- EMPLOYEE 테이블의 모든 컬럼을 조회
-- SELECT EMP ID, EMP NAME, EMP NO .... : 비효율적인 조회 방법
-- 아래와 같이 조회합시다
SELECT *
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사번, 이름, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- JOB 테이블의 모든 컬럼 조회
SELECT *
FROM JOB;

----------------------------실습문제----------------------
-- 1. JOB테이블의 직급명만 조회
SELECT JOB_NAME
FROM JOB;

-- 2. DEPARTMENT 테이블의 모든 컬럼 조회
SELECT *
FROM DEPARTMENT;

-- 3. DEPARTMENT 테이블의 부서코드, 부서명만 조회
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

-- 4. EMPLOYEE 테이블의 사원명, 이메일, 전화번호, 입사일, 급여 조회
SELECT EMP_NAME, EMAIL,PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE;

/*
    <컬럼 값을 통한 산술 연산>
    SELECT절 컬럼명 작성부분에 산술연산 기술 가능
    (이 때, 산술연산된 결과 조회)
    
*/

-- EMPLOYEE 테이블의 사원명, 급여 조회
SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 사원의 연봉(급여*12) 조회
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 급여, 보너스 조회
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 급여, 보너스, 연봉, 보너스가 포함된 연봉(((급여 + (보너스 * 급여)) * 12) 조회
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, ((SALARY + (BONUS * SALARY)) * 12)
FROM EMPLOYEE;
-- NULL인 값과 산술연산을 하면 그 결과 값도 NULL이다

-- EMPLOYEE 테이블의 사원명, 입사일
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 입사일, 근무일수(오늘 날짜 - 입사일)
-- 오늘 날짜 : SYSDATE, 시/분/초 개념이 들어가 있음
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;
-- DATE - DATE : 연산 가능(빼기)
-- => 결과 값은 일 단위로는 맞음!
-- => DATE 형식은 년/월/일/시/분/초 단위로
-- => 시간 정보까지 관리하기 때문에 결과의 가독성이 안 좋습니다
-- => 함수를 적용하면 깔끔한 결과를 확인할 수 있어요
--------------------------------------------------------------------------------

/*
    < 컬럼명에 별칭 지정하기 >
    산술 연산을 하게 되면 컬럼영이 지저분해지는데 
    이때 컬럼명으로 별칭을 부여해서 깔끔하게 보여줌
    
    [표현법]
    컬럼명 별칭 / 컬럼명 AS 별칭 / 컬럼명 "별칭" / 컬럼명 AS "별칭"
    
    AS 붙이든 안 붙이든 내가 부여하고자 하는 별칭에 띄어쓰기,
    혹은 특수문자가 포함될 경우, 반드시 쌍따옴표("") 기술해야합니다
    
*/
SELECT EMP_NAME 사원명, SALARY AS 급여, SALARY * 12 "연봉(원)", ((SALARY + (BONUS * SALARY)) * 12) AS "보너스 포함 연봉"
FROM EMPLOYEE;

-- "연봉(원)" = O
-- 연봉(원) = X
-- 컬럼명 AS "별칭" = 가장 많이 쓰이는 표기법

--------------------------------------------------------------------------------

/*
    < 리터럴 >
    임의로 지정한 문자열('')을 리터럴이라고 합니다
    
    SELECT 절에 리터럴을 제시하면 마치 테이블 상에 존재하는 데이터처럼 조회 가능
    조회된 RESULT SET의 모든 행에 반복적으로 같이 출력
    
*/

-- EMPLOYEE 테이블의 사번, 사원명, 급여 조회
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY AS "급여", '원' AS "단위"
FROM EMPLOYEE;

/*
    < 연결 연산자 : ||>
    여러 컬럼값들을 마치 하나의 컬럼인것처럼 연결하거나,
    컬럼값과 리터럴을 연결할 수 있음
    System.out.println("num의 값 : " + num);
*/

-- EMPLOYEE 사번, 이름, 급여를 하나의 커럼으로 조회
SELECT EMP_ID || EMP_NAME || SALARY AS "사번, 이름, 급여"
FROM EMPLOYEE;

-- 컬럼값이랑 리터럴 연결
-- XXX의 월급은 XXX원 입니다
SELECT EMP_NAME || '의 월급은 ' ||  SALARY || '원 입니다' AS "급여정보"
FROM EMPLOYEE;


--------------------------------------------------------------------------------

/*
    < DISTINCT >
    컬럼에 중복된 값들을 한 번씩만 표시하고자 할 때 사용
*/
-- 현재 우리 회사에 어떤 직급의 사람들이 존재하는지 궁금함.

-- EMPLOYEE 테이블의 직급코드 조회
SELECT JOB_CODE
FROM EMPLOYEE;
-- 중복 제거 되기 전 23행이 조회 됐다

SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;
-- 중복 제거 된 후 7행만 조회 됐다

-- 사원들이 어떤 부서에 속해 있는지 확인
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE; 
-- NULL : 아직 부서배치가 안된 사람

-- DISTINCT는 SELECT 절에 단 한 번만 기술이 가능
/*
    구문 요류 예시
    SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE
    FROM EMPLOYEE;
*/

-- 여러 컬럼을 DISTINCT와 사용하기
SELECT DISTINCT JOB_CODE, DEPT_CODE 
FROM EMPLOYEE;
-- JOB_CODE와 DEPT_CODE를 한 쌍으로 묶어서 중복 판별

--------------------------------------------------------------------------------

/*
    < WHERE 절 >
    조회하고자 하는 테이블로부터 
    특정 조건에 만족하는 데이터만을 조회하고자 할 때 사용합니다~!
    이 때, WHERE 절에는 조건식을 제시하게 됩니다
    조건식에서는 다양한 연산자들을 사용할 수 있습니다
    
    [표현법]
    SELECT 컬럼1, 컬럼2, ...
    FROM 테이블명
    WHERE 조건식;
    
    [비교연산자]
    >, <, >=, <=    => 대소비교
    =               => 동등비교              
    !=, ^=, <>      => 동등하지 않은지 비교
    
*/

-- EMPLOYEE 테이블에서 부서코드가 'D9'인 사원들만 조회 (이때, 모든 컬럼 조회)
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
-- 별칭 줄 때 빼고는 거희 홑따옴표를 사용

-- EMPLOYEE 테이블에서 부서코드가 'D1'인 사원들의 사원명과 급여, 부서코드만 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- 부서코드가 D1이 아닌 사원들의 사번, 사원명, 부서코드를 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D1';
-- WHERE DEPT_CODE ^= 'D1';
WHERE DEPT_CODE <> 'D1';

-- 급여가 400만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;


-- ENPLOYEE에서 지금 현재 회사에서 
-- 재직중(ENT_YN 컬럼값이 'N')인 사원들의 사번, 이름, 입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

---------------------------------------------------------------------------
-- 1. 급여가 3백만원 이상의 사워들의 사원명, 급여, 입사일, 연봉(보너스 미포함) 조회

SELECT EMP_NAME AS "이름", SALARY AS "급여", HIRE_DATE AS "입사일", SALARY * 12 AS "연봉"
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 2. 연봉이 5천만원 이상의 사원들의 사원명, 급여, 연봉(보너스 미포함), 부서 코드 조회

SELECT EMP_NAME || '의 급여는 ' || SALARY || '원 이며, 연봉은 ' || SALARY * 12 || '이고, 직급 코드는 ' || DEPT_CODE || '입니다.' AS "개인정보"
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;

/*
    < SELECT의 SALARY에 별칭을 주면 WHERE절에 별칭을 사용할 수 있을까? > 
    
    SELECT EMP_NAME, SALARY, SALARY * 12 AS "연봉", DEPT_CODE || '입니다.'
    FROM EMPLOYEE
    WHERE 연봉 * 12 >= 50000000;
*/

-- 쿼리 실행 순서 : 
-- FROM절 => WHERE절 => SELECT절
-- SELECT에다 별칭을 줬어도 프로그램이 돌아가는 순서에 따라서
-- SELECT절 보다 WHERE절을 먼저 확인하기 때문에 
-- WHERE절에 연봉 * 12 >= 50000000; 가능하지 않다


-- 3. 직급코드가 'J3'이 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
SELECT '사번 : ' || EMP_ID || ', 사원명 : ' ||  EMP_NAME || ', 직급코드 : ' || JOB_CODE || ', 퇴사여부 : ' || ENT_YN AS "무한상사 개인정보"
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

-- 부서코드가 'D9'이면서 급여가 500만원 이상인 사원들의 사번, 사원명, 급여, 부서코드 조회
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;

-- 부서코드가 'D6'이거나 급여가 3백만원 이상인
-- 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- 급여가 350만원 이상 600만원 이하를 받는 사원들의 사원명, 사번, 급여 조회
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;
-- 일반적으로 비교하려는 컬럼 대상(SALARY)이 왼쪽, 숫자가 오른쪽

--------------------------------------------------------------------------------

/*
    < BETWEEN A AND B > 
    조건식에서 사용되는 구문이며 
    '몇 이상 몇 이하'인 범위에 대한 조건을 제시할 때 사용 되는 연산자
    
    [표현법]
    비교대상컬럼 BETWEEN A(값1) AND B(값2)
    -> 해당 컬럼 값이 A 이상이고 B 이하인 경우
*/

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;


-- 위의 쿼리 범위 밖의 사람들을 조회하기(350만 미만, 600만 초과)
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
-- WHERE SALARY < 3500000 OR SALARY > 6000000;
-- WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
-- NOT : 논리부정연산자
-- 컬럼명 앞 또는 BETWEEN 앞에 기입 가능

-- 입사일이 '90/01/01' ~'01/01/01' 모든 컬럼 조회(BETWEEN)
SELECT *
FROM EMPLOYEE
-- WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';
-- DATE 형식은 대소 비교 가능
--------------------------------------------------------------------------------
/*
    < LIKE >
    비교하고자하는 컬럼 값이 내가 제시한 특정 패턴에 만족될 경우 조회
    
    [표현법]
    비교대상컬럼 LIKE '특정패턴'
    - 특정 패턴 제시시 '%', '_'를 '와일드카드'로 사용할 수 있음

    '%' = 0글자 이상
    EX) 비교대상컬럼 LIKE '문자%' 
    = 비교대상의 컬럼 값이 '문자'로 시작되는 것을 조회
    
    EX2) 비교대상컬럼 LIKE '%문자' 
    = 비교대상의 컬럼 값이 '문자'로 끝나는 것을 조회
    
    EX3) 비교대상컬럼 LIKE '%문자%' 
    = 비교대상의 컬럼 값이 '문자'를 포함하는 것을 조회
    (키워드 검색에서 많이 많이 쓰임)      
  
    '_' = 1글자
    
    EX1) 비교대상컬럼 LIKE '_문자' 
    = 비교대상의 컬럼 값의 '문자' 앞에 무조건 한 글자가 오는 경우 조회
    
    EX2) 비교대상컬럼 LIKE '문자_' 
    = 비교대상의 컬럼 값의 '문자' 뒤에 무조건 한 글자가 오는 경우 조회
    
    EX3) 비교대상컬럼 LIKE '_문자_' 
    = 비교대상의 컬럼 값의 '문자' 앞, 뒤에 무조건 한 글자가 오는 경우 조회
    
    
    
    
*/

-- 사원들 중 성이 '전'씨인 사원들의 사원명 급여 입사일 조회
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%'; -- 키워드 검색

-- 이름 중에 '하'가 포함된 사원들의 사원명, 주민번호, 전화번호 조회
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%'; -- '%' 사이의 글자를 포함하는 모든 이름

-- 이름 중에 이름의 가운데 글자가 '하'인 사원들의 사원명, 전화번호 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_'; -- '_' 한글자만 들어감, 이름이 3글자라는 것이 전제조건


-- 전화번호의 3번째 자리가 1인 사원들의 사번, 사원명, 전번, 이메일 조회
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%'; -- '_'는 한글자씩만 받지만 '%'로 자릿수 상관없이 전부 출력

-- 특이케이스
-- 이메일 중 '_' 기준으로 앞글자가 3글자인 사원들의 사번, 이름, 이메일 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%'; -- 원했던 결과 도출 못 함
-- 와일드카드로 사용되고 있는 문자와 컬럼 값에 담긴 문자가 동일하기 때문에
-- 제대로 조회가 안되는 상황
-- => 어떤게 와일드카드고 어떤게 데이터 값인지 구분을 지어야 합니다
-- => 데이터 값으로 취급하고자 하는 갚 앞에
-- => 나만의 와일드 카드를 제시하고 그것을 ESCAPE OPTION으로 등록해야 합니다

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$'; -- 어떤 문자든 상관없음
-- 세글자를 만나고 이스케이프 문자 만나고 '_'

-- 위의 사원들이 아닌 그 외의 사원들 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
-- WHERE NOT EMAIL LIKE '___$_%' ESCAPE '$';
WHERE EMAIL NOT LIKE '___$_%' ESCAPE '$';
-- NOT은 컬럼명 앞 또는 LIKE 앞에 기입 가능

----------------------------------------------------------------------

-- 1. EMPLOYEE 테이블에서 이름이 '연'으로 끝나는 사원들의
-- 사원명, 입사일 조회
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';


-- 2. EMPLOYEE 테이블에서 이름에 '하'가 포함되어 있고,
-- 급여가 240만원 이상의 사원들의 사원명, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%' AND SALARY >= 2400000;


-- 3. EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원들의
-- 사원명 전화번호 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%'; 


-- 4. DEPARTMENT 테이블에서 해외영업부인 부서들의 부서코드와 부서명 조회
-- SELECT *
-- FROM DEPARTMENT 를 통해 DEPARTMENT에 어떤 데이터가 들어가 있는지 확인

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '해외영업%';

-----------------------------------------------------------------------------
/*
    < IS NULL / IS NOT NULL >
    컬럼값에 NULL이 있을 경우, NULL 값 비교에 사용되는 연산자
    
*/

-- 보너스를 받지 않는 사원(BONUS의 값이 NULL)
-- 사번, 이름, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
-- WHERE BONUS = NULL;
-- WHERE BONUS IS NULL;
-- WHERE BONUS IS NOT NULL;
WHERE NOT BONUS IS NULL;
-- NOT은 컬럼명 앞 또는 IS 뒤에서 사용 가능하다

-- 부서배치를 아직 받지는 않았지만 보너스는 받는
-- 사원 이름, 보너스, 부서코드 조회

SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND NOT BONUS IS NULL;

-------------------------------------------------------
/*
    < IN >
    비교대상 컬럼값이 내가 제시한 목록중에 일치하는 값이 있는지 찾습니다
    
    [표현법]
    비교대상컬럼 IN ('값1', '값2', '값3', ...)
*/
-- 부서코드가 'D6' 이거나 'D8' 이거나 'D5'인
-- 부서원들의 이름, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
-- WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';
WHERE DEPT_CODE IN ('D6', 'D8', 'D5'); -- OR를 의미함

-- 그 외의 사원들
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE NOT DEPT_CODE IN ('D6', 'D8', 'D5');

-------------------------------------------------------

/*
    < 연산자 우선순위 >
    0. ()
    1. 산술연산자 + - * /
    2. 연결연산자 || 
    3. 비교연산자
    4. IS NULL / LIKE / IN
    5. BETWEEN A AND B
    6. NOT(논리연산자)
    7. AND(논리연산자) 
    8. OR(논리연산자)
    * AND와 OR가 있을 때 AND를 먼저 연산
    
*/

-- 직급코드가 'J7' 이거나 'J2'인 사원들 중
-- 급여가 200만원 이상인 사원들의 모든 컬럼 조회

SELECT *
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >= 2000000;

--------------------------------------------------------------------------------

-- 1. 사수가 없고 부서배치도 받지 않은 사원들의 
-- (사원명, 사수사번, 부서코드) 조회
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;
-- 2행

-- 2. 연봉(보너스미포함)이 3000만원 이상이고 
-- 보너스를 받지 않는 사원들의 (사번, 사원명, 급여, 보너스) 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE SALARY * 12 >= 30000000 AND BONUS IS NULL;
-- 7행


-- 3. 입사일이 '95/01/01' 이상이고 부서배치를 받은 사원들의 
-- (사번, 사원명, 입사일, 부서코드) 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE, DEPT_CODE
FROM EMPLOYEE
WHERE HIRE_DATE >= '95/01/01' AND DEPT_CODE IS NOT NULL;
-- 18행


-- 4. 급여가 200만원 이상 500만원 이하이고 
-- 입사일이 '01/01/01' 이상이고 보너스를 받지 않는 사원들의
-- (사번, 사원명, 급여, 입사일, 보너스) 조회
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, BONUS
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 5000000 AND HIRE_DATE >= '01/01/01' AND BONUS IS NULL;
-- 7행


-- 5. 보너스포함연봉이 NULL이 아니고 이름에 '하'가 포함되어있는 
-- 사원들의 (사번, 사원명, 급여, 보너스포함연봉) 조회 (별칭부여)
SELECT EMP_ID AS "사번", EMP_NAME AS "사원명", SALARY AS "급여", ((SALARY + (BONUS * SALARY)) * 12) AS "보너스 포함 연봉"
FROM EMPLOYEE 
WHERE ((SALARY + (BONUS * SALARY)) * 12) IS NOT NULL AND EMP_NAME LIKE '%하%';
-- 2행


--------------------------------------------------------------------------------

SELECT EMP_ID, EMP_NAME, SALARY -- 실행순서 3번
FROM EMPLOYEE -- 실행순서 1번
WHERE DEPT_CODE IS NULL; -- 실행순서 2번

--------------------------------------------------------------------------------

/*
    < ORDER BY 절>
    가장 마지막줄에 작성 ! 뿐만 아니라 실행순서 또한 마지막에 실행
    
    [표현법]
    SELECT 조회할 컬럼1, 컬럼2, 컬럼3, 산술연산식 AS "별칭", ...
    FROM 조회하고자하는 테이블명 
    WHERE 조건식   
    ORDER BY 정렬하고 싶은 컬럼|별칭|컬럼순번 [ASC|DESC] [NULLS FIRST | NULLS LAST]
    
    - ASC : 오름차순 정렬
    안쓰면 디폴트, 디폴트 값은 ASC
    
    - DESC : 내림차순 정렬
    
    - NULLS FIRST : 정렬하고자 하는 컬럼 값에 NULL이 있을 경우 
                    해당 데이터를 맨 앞으로 배치
                    (생략시 DESC일 때의 기본 값)
    - NULLS LAST : 정렬하고자 하는 컬럼 값에 NULL이 있을 경우
                    해당 데이터를 맨 뒤로 배치
                    (생략시 ASC일 때의 기본 값)
    
*/

    SELECT *
    FROM EMPLOYEE
    -- ORDER BY BONUS ASC;  -- 오름차순 정렬일 때 기본적으로 NULLS LAST
    -- ORDER BY BONUS DESC;  -- 내림차순 정렬일 때 기본적으로 NULLS FIRST
    ORDER BY BONUS DESC, SALARY ASC; -- 정렬 기준 여러개 제시 가능, (첫번째 기준의 컬럼값이 동일할 경우, 두번 째 기준 컬럼을 가지고 정렬합니다)
    
    -- 전 사원의 사원명, 연봉 조회 (이 때 연봉별 내림차순 정렬 조회)
    SELECT EMP_NAME, SALARY * 12 AS "연봉"
    FROM EMPLOYEE
    -- ORDER BY SALARY * 12 DESC;
    -- ORDER BY "연봉" DESC; -- 별칭 사용 가능
    ORDER BY 2 DESC; -- 컬럼 순번 사용 가능(컬럼 갯수보다 큰 숫자 안됨)
    
    
    






































































































































































































