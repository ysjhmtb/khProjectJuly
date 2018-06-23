<h1>FUNCTION</h1>

<br>

```sql
--FUNCTION : 프로시져와 호출하는 방식이 거의 동일하며,
--프로시져와 달리 IN/OUT 을 구분하지 않아도 되며, RETURN 문이 존재한다.



--사번을 입력받았을 때, 해당 사번의 연봉을 반환하는 함수 선언.
CREATE OR REPLACE FUNCTION GET_ANNUAL_SAL
  (IN_EMP_ID EMPLOYEE.EMP_ID%TYPE) RETURN NUMBER
  IS
    R_SAL NUMBER;
  BEGIN
    SELECT (SALARY + SALARY * NVL(BONUS,0)) * 12 AS "연봉"
      INTO R_SAL
      FROM EMPLOYEE
      WHERE EMP_ID = IN_EMP_ID;

    RETURN R_SAL;

  END;

--실행
SELECT GET_ANNUAL_SAL('210')
  FROM DUAL;




--사번을 전달받아서, 해당 사원에게 보너스를 지급하려고 한다.
--보너스 금액은 해당 직원의 급여의 100%를 지급.
--해당 보너스 금액을 리터받는 함수 GET_BONUS

CREATE OR REPLACE FUNCTION GET_BONUS
  (IN_EMP_ID IN EMPLOYEE.EMP_ID%TYPE)
  RETURN NUMBER IS R_BONUS NUMBER;

  BEGIN
    SELECT SALARY
      INTO R_BONUS
      FROM EMPLOYEE
      WHERE EMP_ID = IN_EMP_ID;

    RETURN R_BONUS;
  END;
  /

--실행
SELECT EMP_ID, SALARY, GET_BONUS(EMP_ID)
  FROM EMPLOYEE;




--위의 함수를 이용하여 전체 직원의 연봉 조회
--사번 이름 급여 연봉
--연봉 - 급여 * 12 + 보너스금액 * 4
SELECT EMP_ID, EMP_NAME, SALARY,
      SALARY * 12 + GET_BONUS(EMP_ID) * 4 AS "연봉"
FROM EMPLOYEE;


```

