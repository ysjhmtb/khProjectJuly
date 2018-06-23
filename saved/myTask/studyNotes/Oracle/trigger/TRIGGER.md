<h1>TRIGGER</h1>

<br>

```sql

--트리거(TRIGGER)

--데이터 베이스가 미리 정해놓은 조건의 동작이 수행되면
-- 자동적으로 수행되는 행동을 말함

--트리거는 테이블의 데이터가 INSERT, UPDATE, DELETE 등의 DML이 수행될때를
--감지 하여 실행 됨(자바 - LISTENER)
--제품 (제품번호, 제품이름, 제품군, 제조사, 재고)
--주문 (주문번호, 제품번호, 수량)  --> 주문이 추가 될때 해당 제품의 재고를 - 시키는 TRIGGER

--트리거의 실행 시점
--해당 이벤트(DML)가 실행되기전(BEFORE), 실행 후(AFTER)

--트리거의 이벤트
--DML이 실행되는 순간

--트리거의 BEGIN에 작성 되는 내용
--해당 DML시 처리되어야 하는 로직(현재 테이블과는 다른 테이블, 다른 업무)

--트리거의 유형
--FOR EACH ROW(O)(행 레벨 트리거)
--      : 변경이 일어난 모든 행에 대해서 트리거를 실행함
--FOR EACH ROW(X)(문장 레벨 트리거)
--      : 변경한 시점에 한번만 트리거가 실행 된다.
--EX) 직원 테이블에서 'D5' 인원들의 급여 2000000원으로 변경하고
--      해당 인원들의 사번과 연봉을 연봉테이블에 추가한다.



--EX)문장 레벨 트리거 - 신입사원이 등록 될 경우 '신입사원이 입사하였습니다.' 라는
--    메세지 출력 트리거 생성

CREATE OR REPLACE TRIGGER ENT_EMP
  AFTER INSERT ON EMPLOYEE
  BEGIN
    DBMS_OUTPUT.PUT_LINE('신입사원이 입사하였습니다.');
  END;
  /


--확인
INSERT INTO EMPLOYEE
VALUES ('950', '홍길동', '501111-1234555', 'KDHONG@NAVER.COM',
               '010-123-3333', 'D3', 'J2', 'S2', 150000,
               0.1, NULL, SYSDATE, NULL, 'N');
ROLLBACK;
DELETE FROM EMPLOYEE
WHERE EMP_ID = '950';
COMMIT;

ALTER TRIGGER ENT_EMP COMPILE;




--바인드 변수 2가지
--FOR EACH ROW 경우만 사용 가능 함
--:NEW : 새로 추가/변경 된 데이터
--:OLD : 기존 데이터

--부서명 변경시 기존이름과, 새로운이름을 출력하는 트리거를 작성하시오
--부서 복사 테이블 : DEPT_C

CREATE TABLE DEPT_C AS
SELECT * FROM DEPARTMENT;

CREATE OR REPLACE TRIGGER DEPT_NAME_TRG
  AFTER UPDATE ON DEPT_C
  FOR EACH ROW
  BEGIN
    DBMS_OUTPUT.PUT_LINE(:OLD.DEPT_TITLE);
    DBMS_OUTPUT.PUT_LINE(:NEW.DEPT_TITLE);
  END;
  /

UPDATE DEPT_C
SET DEPT_TITLE = '자바개발팀'
WHERE DEPT_ID = 'D4';
COMMIT;



--DEPT_DUP 행 삭제 시 DEPT_DEL 테이블에
--INSERT 시키는 트리거를 작성하여라
--트리거 작성 후 DEPT_DUP행 삭제 시 DEPT_DEL 테이블에 행 추가 됨 확인

CREATE OR REPLACE TRIGGER DEPT_DEL_TRG
  AFTER DELETE ON DEPT_DUP
  FOR EACH ROW
  BEGIN
    INSERT INTO DEPT_DEL VALUES
      (:OLD.DEPT_ID, :OLD.DEPT_TITLE, :OLD.LOCATION_ID);
  END;
  /


--확인
SELECT * FROM DEPT_DUP;

DELETE FROM DEPT_DUP
WHERE DEPT_ID = 'D4';
COMMIT;

SELECT *
FROM DEPT_DEL;



--제품이 입고 될때마다 상품재고 테이블의 수치를 일일히 바꾸기 번거롭다는 요구사항
--그래서 트리거를 사용하여, 제품 입출고 시 재고의 수량을 자동으로 변경 하려 함

--제품 정보 테이블(PRODUCT)
--PID - NUMBER PRIMARY KEY
--PNAME - VARCHAR2(100)
--BRAND - VARCHAR2(100)
--PRICE - NUMBER
--STOCK - NUMBER DEFAULT 0
CREATE TABLE PRODUCT(
  PID NUMBER PRIMARY KEY,
  PNAME VARCHAR2(100),
  BRAND VARCHAR2(100),
  PRICE NUMBER,
  STOCK NUMBER DEFAULT 0
);


--제품 입출고 테이블(PRODUCT_INOUT)
--INOUT_ID - NUMBER PRIMARY KEY
--PID - NUMBER
--INOUT_DATE - DATE
--COUNT - NUMBER
--INOUT - VARCHAR2(6)  ('입고', '출고')
CREATE TABLE PRODUCT_INOUT(
  INOUT_ID NUMBER PRIMARY KEY,
  PID NUMBER,
  INOUT_DATE DATE,
  COUNT NUMBER,
  INOUT VARCHAR2(6)
);


--SEQUENCE 생성
--PID_SEQ : 제품번호 SEQ
CREATE SEQUENCE PID_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;


--INOUT_SEQ : 입출고 SEQ
CREATE SEQUENCE INOUT_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE
  NOCACHE;


INSERT INTO PRODUCT VALUES (PID_SEQ.NEXTVAL,'아이폰8', '애플', 1000000, DEFAULT);
INSERT INTO PRODUCT VALUES (PID_SEQ.NEXTVAL,'갤럭시9', '삼성', 1200000, DEFAULT);
INSERT INTO PRODUCT VALUES (PID_SEQ.NEXTVAL,'샤오미폰', '샤오미', 700000, DEFAULT);
COMMIT;


SELECT * FROM PRODUCT;

--트리거 작성
CREATE OR REPLACE TRIGGER PRODUCT_INPUT_TRG
  AFTER INSERT ON PRODUCT_INOUT
  FOR EACH ROW

BEGIN

  IF :NEW.INOUT = '입고' THEN
    UPDATE PRODUCT
    SET STOCK = STOCK + :NEW.COUNT
    WHERE PID = :NEW.PID;
  ELSE
    UPDATE PRODUCT
      SET STOCK = STOCK - :NEW.COUNT
      WHERE PID = :NEW.PID;

  END IF;

END;
/


--확인
INSERT INTO PRODUCT_INOUT
VALUES(INOUT_SEQ.NEXTVAL, 1, SYSDATE, 5, '입고');
INSERT INTO PRODUCT_INOUT
VALUES(INOUT_SEQ.NEXTVAL, 1, SYSDATE, 3, '출고');

SELECT *
FROM PRODUCT;
```



<br>

