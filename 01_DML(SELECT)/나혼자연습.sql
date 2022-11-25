/*
    < SELECT >
    데이터 조회할 때 사용되는 구문입니다

    >> RESULT SET : SELECT문을 통해 조회된 결과물
    즉, 조회된 행들의 집합을 의미합니다
    
    < 표현법 >
    SELECT 조회하고자 하는 칼럼1, 칼럼2, 칼럼3 ...
    FROM 테이블명;
    
    조회를 할 때는 반드시 존재하는 칼럼의 이름을 적어야 ㅎ바니다
    => 없는 칼럼을 쓰면 오류가 납니다
    우오아ㅗ아엉ASDASDSADADSAasdfsaf sd
*/

-- EMPLOYTEE 내 COLUMN_NAME 확인.
-- DB는 문자열만 존재(VARCHAR2, CHAR 모두 문자열)

-- EMPLOYEE 테이블의 모든 컬럼을 조회합시다
-- SELECT EMP_ID, EMP_NAME, EMP_NO... = 비효율적인 조회 방법
-- 아래와 같이 조회합시다

SELECT *
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사번, 이름, 급여 조회
SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 사원의 연봉(급여 * 12) 조회
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 급여, 연봉, 보너스가 포함된 연봉 ((급여 + (보너스 * 급여)) * 12) 조회
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
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", SALARY AS "급여"
FROM EMPLOYEE;


/*
    < 연결 연산자 : ||>
    여러 컬럼값들을 마치 하나의 컬럼인것처럼 연결하거나,
    컬럼값과 리터럴을 연결할 수 있음
    System.out.println("num의 값 : " + num);
*/

-- EMPLOYEE 사번, 이름, 급여를 하나의 컬럼으로 조회
SELECT EMP_ID || EMP_NAME || SALARY AS "사번, 이름, 급여"
FROM EMPLOYEE;

-- 컬럼값이랑 리터럴 연결
-- XXX의 월급은 XXX원 입니다
SELECT EMP_NAME || '의 월급은 ' || SALARY || '원 입니다.' AS "개인정보"
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

-- 1. 급여가 3백만원 이상의 사원들의 사원명, 급여, 입사일, 연봉(보너스 미포함) 조회
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY * 12
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 2. 연봉이 5천만원 이상의 사원들의 사원명, 급여, 연봉(보너스 미포함), 부서 코드 조회
SELECT EMP_NAME, SALARY, SALARY * 12, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;


-- 쿼리 실행 순서 : 
-- FROM절 => WHERE절 => SELECT절
-- SELECT에다 별칭을 줬어도 프로그램이 돌아가는 순서에 따라서
-- SELECT절 보다 WHERE절을 먼저 확인하기 때문에 
-- WHERE절에 연봉 * 12 >= 50000000; 가능하지 않다

-- 3. 직급코드가 'J3'이 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

-- 부서코드가 'D9'이면서 급여가 500만원 이상인 사원들의 사번, 사원명, 급여, 부서코드 조회
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY >= 5000000;

-- 부서코드가 'D6'이거나 급여가 3백만원 이상인
-- 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- 급여가 350만원 이상 600만원 이하를 받는 사원들의 사원명, 사번, 급여 조회
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

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
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

-- 입사일이 '90/01/01' ~'01/01/01' 모든 컬럼 조회(BETWEEN)
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND ' 01/01/01';

-- 사원들 중 성이 '전'씨인 사원들의 사원명 급여 입사일 조회
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

-- 이름 중에 '하'가 포함된 사원들의 사원명, 주민번호, 전화번호 조회
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

-- 이름 중에 이름의 가운데 글자가 '하'인 사원들의 사원명, 전화번호 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_';

-- 전화번호의 3번째 자리가 1인 사원들의 사번, 사원명, 전번, 이메일 조회
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- 이메일 중 '_' 기준으로 앞글자가 3글자인 사원들의 사번, 이름, 이메일 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';


-- 위의 사원들이 아닌 그 외의 사원들 조회

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE NOT EMAIL LIKE '___$_%' ESCAPE '$';

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

/*
    < IS NULL / IS NOT NULL >
    컬럼값에 NULL이 있을 경우, NULL 값 비교에 사용되는 연산자
    
*/

-- 보너스를 받지 않는 사원(BONUS의 값이 NULL)
-- 사번, 이름, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- 부서배치를 아직 받지는 않았지만 보너스는 받는
-- 사원 이름, 보너스, 부서코드 조회
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

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
WHERE DEPT_CODE IN ('D6', 'D8', 'D5');

-- 직급코드가 'J7' 이거나 'J2'인 사원들 중
-- 급여가 200만원 이상인 사원들의 모든 컬럼 조회
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN ('J7', 'J2') AND SALARY >= 2000000;




