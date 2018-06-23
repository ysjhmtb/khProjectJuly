<h1>CURSOR<h1>



```SQL
--CURSOR
--SQL을 통해서 얻어진 여러 행, 여러 열로 구성된 메모리 상의 위치
--> 커서를 선언 -> OPEN -> FETCH -> CLOSE


--커서의 속성
--%NOTFOUND : 커서에 자료가 없을 경우(FETCH계속 해서 다음 인출할 데이터가 없는 경우) - TRUE
--%FOUND : 커서에 FETCH할 자료가 있을 경우 TRUE
--%ISOPEN : 해당 커서가 사용중인지를 나타내는 속성, OPEN된 상태면 - TRUE
--%ROWCOUNT : 현재 해당 커서가 인출한 ROW의 COUNT를 반환


CREATE OR REPLACE PROCEDURE PRINT_DEPT
  IS
    CURSOR DEPT_C IS SELECT * FROM DEPARTMENT;
    DEPT_INFO DEPARTMNET%ROWTYPE;

  BEGIN
    OPEN DEPT_C;

    LOOP
        FETCH DEPT_C INTO DEPT_INFO.DEPT_ID,
                          DEPT_INFO.DEPT_TITLE,
                          DEPT_INFO.LOCATION_ID;

        EXIT WHEN DEPT_C%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('부서코드' || DEPT_INFO.DEPT_ID
              || ', 부서명 ' || DEPT_INFO.DEPT_TITLE
              || ', 위치 ID ' || DEPT_INFO.LOCATION_ID);

    END LOOP;

    CLOSE DEPT_C;
    DBMS_OUTPUT.PUT_LINE('부서 정보 출력 완료');


  END;
  /

EXEC PRINT_DEPT;




--자바의 개선된 for문과 같은 형태.
CREATE OR REPLACE PROCEDURE PRINT_DEPT2
  IS

    CURSOR DEPT_C IS SELECT * FROM DEPARTMENT;

  BEGIN

    FOR DEPT_INFO IN DEPT_C
      LOOP

        DBMS_OUTPUT.PUT_LINE('부서코드 ' || DEPT_INFO.DEPT_ID
                  || ', 부서명 ' || DEPT_INFO.DEPT_TITLE
                  || ', 위치 ID ' || DEPT_INFO.LOCATION_ID);

    END LOOP;
    DBMS_OUTPUT.PUT_LINE('부서 정보 출력 완료');

  END;
  /

EXEC PRINT_DEPT2;




--DEPARTMENT 복사 테이블을 : DEPT_DUP(데이터O),DEPT_DEL(데이터X)
--프로시저를 하나 만드려고 합니다.
--부서번호를 입력받아, 해당 부서 정보가 존재할 경우,
--해당 부서정보 삭제 후 삭제 한 데이터를 DEPT_DEL 테이블에 추가하시오

CREATE TABLE DEPT_DUP AS
SELECT * FROM DEPARTMENT;

CREATE TABLE DEPT_DEL AS
SELECT * FROM DEPARTMENT
  WHERE 1 = 0;

CREATE OR REPLACE PROCEDURE DEPT_DEL_P
  (IN_DEPT_ID DEPT_DUP.DEPT_ID%TYPE)

  IS

    CURSOR DEL_ROW IS
      (SELECT * FROM DEPT_DUP WHERE DEPT_ID = IN_DEPT_ID);
    IDX NUMBER := 0;

  BEGIN
    --삭제할 데이터의 존재 여부를 확인하기 위해서 IDX 변수를 사용
    --해당 IDX값이 0이 아니라면 삭제 할 행 있음

    FOR K IN DEL_ROW LOOP
      IDX := IDX + 1;
    END LOOP;

    IF IDX != 0 THEN

      FOR DEPT IN DEL_ROW LOOP

            INSERT INTO DEPT_DEL
              VALUES (DEPT.DEPT_ID,
                DEPT.DEPT_TITLE,
                DEPT.LOCATION_ID);

            DELETE FROM DEPT_DUP
              WHERE DEPT_ID = DEPT.DEPT_ID;

      END LOOP;
      COMMIT;

    END IF;

    DBMS_OUTPUT.PUT_LINE('부서번호 삭제 프로시져 완료');

  END;
  /


EXEC DEPT_DEL_P('D3');



--부서번호를 입력 받아, 해당 부서의 직원 정보를 출력하는 프로시저 생성
--PRINT_DEPT_EMP
--출력 정보 - 사번, 이름, 부서번호, 직책코드

CREATE OR REPLACE PROCEDURE PRINT_DEPT_EMP
  (IN_DEPT_CD IN EMPLOYEE.DEPT_CODE%TYPE)

  IS

    CURSOR EMP_C IS SELECT EMP_ID, EMP_NAME, DEPT_CODE,
                        JOB_CODE FROM EMPLOYEE
                        WHERE DEPT_CODE = IN_DEPT_CD;

  BEGIN
    FOR EMP IN EMP_C LOOP

      DBMS_OUTPUT.PUT_LINE(
           EMP.EMP_ID || ', '
                      || EMP.EMP_NAME || ', '
                      || EMP.DEPT_CODE || ', '
                      || EMP.JOB_CODE);

    END LOOP;

  END;
  /


EXEC PRINT_DEPT_EMP('D2');


```

<br>

