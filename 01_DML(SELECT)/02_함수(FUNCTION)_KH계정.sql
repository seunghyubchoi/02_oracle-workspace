
/*
    < 함수 FUNCTION >
    전달된 컬럼값을 읽어들어서 함수를 실핸하 결과를 반환함
    
    - 단일행 함수 : N개의 값을 읽어들여서 'N'개의 결과값을 리턴
                    (매 행마다 함수 실행 결과 반환)
    - 그룹 함수 : N개의 값을 읽어들여서 '1'개의 결과 값을 리턴
                    (그룹을 지어 그룹 별로 함수 실행 결과 반환)
                    
    >> SELECT 절에 단일행 함수랑 그룹 함수를 함께 사용 못함!!
        왜? 결과 행의 개수가 다르기 때문!
        
    >> 함수식을 기술 할 수 있는 위치 : SELECT절, WHERE절, ORDER BY 절, GROUP BY 절, HAVING 절
    
*/


/*
    < 문자 처리 함수 >
    
    * LENGTH / LENGTHB  => 결과 값 NUMBER 타입
    
    LENGTH(컬럼|'문자열값') : 해당 문자열 값의 '글자수' 반환 
    LENGTHB(컬럼|'문자열값') : 해당 문자열 값의 '바이트수' 반환 
    
    '김', '나', 'ㄱ' : 한글자당 3바이트 EX.김시연 9바이트
    영문자, 숫자, 특수문자 : 한 글자당 1바이트
    
*/

    SELECT SYSDATE
    FROM DUAL;

    
    SELECT LENGTH('오라클'), LENGTHB('오라클')
    FROM DUAL; -- 가상테이블: 테이블 쓸 거 없을 때 쓰는 거!
    
    SELECT LENGTH('oracle'), LENGTHB('oracle')
    FROM DUAL;
    
    SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
            EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
    FROM EMPLOYEE; -- 매 행마다 다 실행되고 있음~! => 단일행 함수
    
    /*
     INSTR : 많이 많이 사용함
     문자열로부터 특정 문자의 시작 위치를 찾아서 반환
     
    INSTR(컬럼|'문자열', '찾고자하는 문자', ['찾을 위치의 시작 값', [순번]]) = 결과 값은 NUMBER 타입
    
    찾을 위치의 시작 값
    1 : 앞에서부터 찾겠다.
    -1 : 뒤에서부터 찾겠다.
    
    */
    SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
    -- 찾을 위치의 시작 값은 1이 기본 값 => 앞에서 부터 찾음. 순번도 1이 기본 값
    SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
    SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 뒤에서 처음 나오는 B를 왼쪽에서 부터 세서 10이 나옴
    SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- 앞에서 부터 세서 2번째 B가 있는 곳
    SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- 뒤에서 부터 찾는데 3번째 B를 앞에서 부터 센 결과
    
    SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) AS "_위치", INSTR(EMAIL, '@') AS "골뱅이 위치"
    FROM EMPLOYEE;  
        
--------------------------------------------------------------------------------------------------------------------
    
    /*
        < SUBSTR >
        문자열에서 특정 문자열을 추출해서 반환(자바에서의 subString() 메소드와 유사)
        
        SUBSTR(STRING, POSITION, [LENGTH]) = 결과값이 CHARACTER 타입
        - STRING : '문자타입컬럼' 또는 '문자열값'
        - POSITION : 문자열을 추출할 시작위치값
        - LENGTH : 추출할 문자개수(생략시 끝까지를 의미)
        
    */
    
    SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;
    
    SELECT EMP_NAME, SUBSTR(EMP_NO, 1,8), SUBSTR(EMP_NO, 8,1) AS "성별"
    FROM EMPLOYEE;
    
    -- 여자 사원들만 조회
    SELECT EMP_NAME  
    FROM EMPLOYEE
    -- WHERE SUBSTR(EMP_NO, 8,1) = '2' OR SUBSTR(EMP_NO, 8,1) ='4';
    WHERE SUBSTR(EMP_NO, 8,1) IN ('2', '4');
    
    
    -- 남자 사원들만 조회
    SELECT EMP_NAME AS "이름", SUBSTR(EMP_NO, 1, 8) AS "주민번호"
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3') -- 내부적으로 자동 형변환(원칙적으론 '1', '3' 문자열)
    -- ORDER BY 1 ORDER BY EMP_NAME;, 기본적으로는 오름차순
    ORDER BY "주민번호";
    
    -- 함수 중첩 사용
    SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS "아이디"
    FROM EMPLOYEE;
    
    --------------------------------------------------------------------------------------------------------------------
    
    /*
        < LPAD / RPAD >
        문자열을 조회할 때 통일감 있게 조회하고자 할 때 사용
        
        LPAD/RPAD(STRING, 최종적으로 반환할 문자의 길이, [덧붙이고자 한느 문자])
        
        문자열에 덧붙이고자 하는 문자를 왼쪽 또는 오른쪽에 덧붙여서 최종 N길이만큼의 문자열 반환
        
    */
    
    -- 20만큼의 길이 중 EMAIL 컬럼 값은 오른쪽으로 정렬, 나머지 공백으로 채움
    SELECT EMP_NAME,LPAD(EMAIL, 20) -- 총 20자로 반환
    -- 덧붙이고자 하는 문자 생략시 기본값이 공백
    FROM EMPLOYEE;
    
    SELECT EMP_NAME,LPAD(EMAIL, 20, '#')
    FROM EMPLOYEE;
    
    SELECT EMP_NAME,RPAD(EMAIL, 20, '#')
    FROM EMPLOYEE;
    
    --850101-2****** 나오게 조회 => 총 14글자
    SELECT RPAD('850101-2', 14, '*')
    FROM DUAL;
    
    SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1,8), 14, '*')
    FROM EMPLOYEE;
    -----------------------------------------------------------------------------------
    
    /*
        LTRIM / RTRIM
        문자열에서 특정 문자를 제거한 나머지를 반환한다
        
        LTRIM / RTRIM (STRING, ['제거할 문자들']) => 생략하면 공백 제거해줌
        
        문자열의 왼쪽 혹은 오른쪽에서 제거하고자 하는 문자들을 찾아서 제거 후 문자열 반환
        
    */
    
    SELECT LTRIM('   K H ') FROM DUAL; 
    -- 공백 찾아서 제거하고 공백 아닌 문자가 나오면 그냥 끝남
    
    SELECT LTRIM('123123KH123', '123') FROM DUAL;
    SELECT LTRIM('ACABACCKH', 'ABC') FROM DUAL;
    
    SELECT RTRIM('5782KH123', '0123456789') FROM DUAL;
    
    /*
        < TRIM >
        문자열의 앞 / 뒤 양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
        TRIM([[LEADING|TRAILING|BOTH]제거하고자 하는 문자들 FROM] STRING)
    */
    
    SELECT TRIM('   K H   ')FROM DUAL;
    -- SELECT TRIM('ZZZKHZZZ','Z')FROM DUAL;
    SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
    
    SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- LEADING : 앞, LTRIM과 유사
    SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- TRAILING : 뒤, RTRIM과 유사
    SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL; 아무 것도 안쓰면 BOTH
    -----------------------------------------------------------------------------------------
    
    
    /*
    
    < LOWER / UPPER / INITCAP >
    LOWER / UPPER / INITCAP (STRING) => 결과값은 CHARACTER 타입
    
    LOWER : 다 소문자로 변경한 문자열 반환(자바에서 toLowerCase() 와 유사)
    
    UPPER : 다 대문자로 변경한 문자열 반환(자바에서 toUpperCase() 와 유사)
    
    INITCAP : 단어 앞글자마다 대문자로 변경한 문자열 반환
    
        
    */
    
    SELECT LOWER('Welcome To My World!') FROM DUAL;
    SELECT UPPER('Welcome To My World!') FROM DUAL;
    SELECT INITCAP('welcome to my world') FROM DUAL;
---------------------------------------------------------------------------------------
    
    /*
    < CONCAT >
    문자열 두개 전달 받아 하나로 합친 후 결과 반환
    
    CONCAT(STRING, STRING) => 결과값 CHARACTER 타입
    
    */
    
    SELECT CONCAT('ABC','CHOCOLATE') FROM DUAL;
    SELECT 'ABC' || 'CHOCOLATE' FROM DUAL;
    
    
    -- SELECT CONCAT('ABC','초콜릿','먹고싶다')FROM DUAL; // 오류발생, 두개만 받을 수 있음
    SELECT 'ABC' || '초콜릿' || '먹고싶다' FROM DUAL;
    
    
---------------------------------------------------------------------------------------
    
    /* 
        < REPLACE >
        
        REPLACE(STRING, STR, STR2) => 결과값은 CHARACTER 타입
        
    */
    
    SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
    FROM EMPLOYEE;
    
---------------------------------------------------------------------------------------

/*
    < 숫자 처리 함수 >
    
    * ABS
    숫자의 절대값을 구하는 함수
    
    ABS(NUMBER) => 결과값은 NUMBER 타입!!
    
*/
    SELECT ABS(-10) FROM DUAL;
    SELECT ABS(-5.7) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    MOD
    
    두 수를 나눈 나머지 값을 반환해주는 함수
    
    MOD(NUMBER1, NUMBER2) = 결과값 : NUMBER 타입
    
*/

    SELECT MOD(10, 3) FROM DUAL;
    SELECT MOD(10.9, 3) FROM DUAL;
    SELECT MOD(3, 10) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    ROUND
    
    반올림한 결과를 반환
    
    ROUND(NUMBER, [위치]) = 결과값 : NUMBER 타입
    위치를 생략하면 0번째 자리에서 반올림(DEFAULT가 0)
*/
    SELECT ROUND(123.456) FROM DUAL;
    
    
---------------------------------------------------------------------------------------