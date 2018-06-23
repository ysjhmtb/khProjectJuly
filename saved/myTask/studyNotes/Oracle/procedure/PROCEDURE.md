

<h1>PROCEDURE</h1>

<br>

```sql
--PROCEDURE : PL/SQL문을 저장하는 객체.

-- EMPLOYEE 테이블의 데이터에 영향을 미치지 않도록, 새로운 테이블 만들기.
SELECT * FROM EMPLOYEE;

CREATE TABLE EMP_DUP AS
SELECT * FROM EMPLOYEE;

SELECT * FROM EMP_DUP;

--SET SERVEROUTPUT ON;

--프로시져 생성
CREATE OR REPLACE PROCEDURE DEL_EMP_ALL IS
  BEGIN
    DELETE FROM EMP_DUP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('삭제 완료');
  END;
/

--프로시져 조회
SELECT * FROM USER_PROCEDURES;

--프로시져 실행
EXECUTE DEL_EMP_ALL;


--패러미터가 있는 프로시져 생성
--사번을 입력받아 사번에 해당하는 직원 정보만 삭제
CREATE OR REPLACE PROCEDURE DEL_EMP_ID
  (IN_EMP_ID IN EMP_DUP.EMP_ID%TYPE) IS
  BEGIN
    DELETE FROM EMP_DUP
      WHERE EMP_ID = IN_EMP_ID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('아이디로 삭제 완료');
  END;
  /

EXECUTE DEL_EMP_ID('200');


--사번을 입력받아서, 해당 사원 정보를 반환(직원이름, 급여, 부서코드)
CREATE OR REPLACE PROCEDURE GET_EMP_INFO
  (IN_ID IN EMPLOYEE.EMP_ID%TYPE,
    OUT_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
    OUT_SALARY OUT EMPLOYEE.SALARY%TYPE,
    OUT_DEPT OUT EMPLOYEE.DEPT_CODE%TYPE)
  IS

  BEGIN
    SELECT EMP_NAME, SALARY, DEPT_CODE
      INTO OUT_NAME, OUT_SALARY, OUT_DEPT
      FROM EMPLOYEE
      WHERE EMP_ID = IN_ID;
  END;
  /


--이 프로시져 사용
VARIABLE VAR_EMP_NAME VARCHAR2(20);
VARIABLE VAR_SALARY NUMBER;
VARIABLE VAR_DEPT_CODE CHAR(2);

EXEC GET_EMP_INFO('200',:VAR_EMP_NAME,:VAR_SALARY,:VAR_DEPT_CODE);

SET AUTOPRINT ON;
PRINT VAR_EMP_NAME;
```

<br>



<img src="https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/studyNotes/Oracle/procedure/1.png?raw=true">



<br>

<img src="https://raw.githubusercontent.com/ysjhmtb/khProjectJuly/master/saved/myTask/studyNotes/Oracle/procedure/2.png">

<br>

<img src="https://raw.githubusercontent.com/ysjhmtb/khProjectJuly/master/saved/myTask/studyNotes/Oracle/procedure/3.png">



<br>









