<h1>Mac에서 Docker와 IntelliJ를 이용하여 Oracle Database 11g 사용하기</h1>

<br>

macOS에서 Oracle DB를 사용할 방법을 찾다가 Docker를 선택!

<br>

<hr>

우선 기본적인 사용방법을 [Using Oracle Database with Docker Engine](https://community.toadworld.com/platforms/oracle/w/wiki/11638.using-oracle-database-with-docker-engine) 를 통해 습득하였다.

<br>

Docker를 맥에 설치한 후 터미널에서 아래와 같이 입력. 

```bash
docker run --name orcldb -d -p 59160:22 -p 59161:1521 -v ~/my/oracle/data:/u01/app/oracle sath89/oracle-xe-11g
```

Using Oracle Database with Docker Engine에서는 

```bash
sudo docker run --name orcldb -d -p 8080:8080 -p 1521:1521 sath89/oracle-xe-11g
```

와 같이 안내되어 있는데, 

[맥(osx)에서 oracle DB 사용하기](https://banbanmumani.github.io/2018/01/05/osx%EC%97%90%EC%84%9CoracleDB%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/) 와 [맥북에서 오라클 사용하기 (docker + intelliJ)](http://jojoldu.tistory.com/169) 를 참조하여 변형하였다. 

<br>

1) Oracle Database 11g를 **orcldb** 라는 이름으로 컨테이너를 생성. <br>

2) **-p 59161:1521** 는 오라클 다커 컨테이너의 1521 포트를 로컬호스트의 59161포트로 연결한다는 의미. <br>

3) 다커는 기본적으로 무상태를 지향한다. 따라서 컨테이너 실행 중 생성된 데이터가 컨테이너가 종료되면 보존되지 않는다. 이를 방지하기 위해 **-v ~/my/oracle/data:/u01/app/oracle** 이 필요하다. 경로 ‘~/my/oracle/data’ 에 저장하겠다는 의미.

<br>

<hr>

```bash
#컨테이너 생성이 완료된 후 현재 동작하는 컨테이너 확인.
#만약 sudo docker ps -a를 사용하면 현재 동작하지 않는 컨테이너까지 모두 확인할 수 있다. 
sudo docker ps

#컨테이너 포트 정보 확인.
sudo docker port orcldb

#다커 이미지 확인. 다운받은 이미지를 통해 컨테이너를 생성한다.
sudo docker images

#다커 터미널 시작 
sudo docker exec -it orcldb bash

#다커 터미널에서 SQl*Plus 시작.
#user-name은 system, password는 oracle
root@1f54f877de4b:/# sqlplus

```

<br>

이와 같이 sqlplus를 실행한 후에 다음과 같은 쿼리 입력.

```sql
 -- 관리자 계정 --

CREATE USER jsp IDENTIFIED BY jsp;

GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SEQUENCE TO jsp;

 -- jsp 계정 --
drop table ATTACHMENT;
drop table BOARD_COMMENT;
drop table BOARD;
drop table notice;
drop table member;

drop SEQUENCE SEQ_NNO;
drop SEQUENCE SEQ_BOARD;
drop SEQUENCE SEQ_COMMENT;
drop SEQUENCE SEQ_FNO;


CREATE TABLE MEMBER(
  USERID VARCHAR2(30) PRIMARY KEY
 ,PASSWORD VARCHAR2(100) NOT NULL
 ,USERNAME  VARCHAR2(30) NOT NULL
 ,GENDER CHAR(1) CHECK (GENDER IN ('M','F'))
 ,AGE NUMBER
 ,EMAIL VARCHAR2(30)
 ,PHONE CHAR(13)  NOT NULL
 ,ADDRESS VARCHAR2(500)
 ,HOBBY VARCHAR2(100)
 ,ENROLLDATE DATE DEFAULT SYSDATE
);


INSERT INTO MEMBER VALUES
('admin', 'admin', '홍길동', 'M', 10, 'test@test.com', '01011112222', '서울시 강남구', '게임, 음악, 영화감상', DEFAULT);

COMMIT;

CREATE TABLE NOTICE (
    NNO NUMBER PRIMARY KEY,
    NTITLE VARCHAR2(100) NOT NULL,
    NCONTENT VARCHAR2(4000) NOT NULL,
    NWRITER VARCHAR2(30) NOT NULL,
    NCOUNT NUMBER DEFAULT 0,
    NDATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (NWRITER) REFERENCES MEMBER(USERID)
);

CREATE SEQUENCE SEQ_NNO;

--COMMIT;

INSERT INTO NOTICE VALUES(
SEQ_NNO.NEXTVAL, '[공지]서버 오픈', '서버가 오픈하였습니다. 많은 이용 바랍니다.', 'admin', DEFAULT, DEFAULT
);

INSERT INTO NOTICE VALUES(
SEQ_NNO.NEXTVAL, '[공지]서버 정기 점검', '서버 정기 점검입니다. 이용에 불편을 드려 대단히 죄송합니다.', 'admin', DEFAULT, DEFAULT
);

INSERT INTO NOTICE VALUES(
SEQ_NNO.NEXTVAL, '[공지]서버 임시 점검', '서버가 더 나은 기능을 제공하기 위하여 지금부터 임시 점검에 들어갑니다. 불편하시더라도 많은 양해 부탁드립니다.', 'admin', DEFAULT, DEFAULT
);

INSERT INTO NOTICE VALUES(
SEQ_NNO.NEXTVAL, '[공지]서버 긴급 점검', '서버에 문제가 발생하여 긴급 점검을 실시합니다. 이용하시는 고객님들은 즉시 로그아웃 해주시기 바랍니다.', 'admin', DEFAULT, DEFAULT
);

INSERT INTO NOTICE VALUES(
SEQ_NNO.NEXTVAL, '[공지]서버 연장 점검', '서버 문제를 해결하던 중 노루가 전봇대를 들이받아 사용자 접속 기능에 오류가 발생하게 되어 서버 오픈을 30분 연장하게 되었습니다. 대단히 죄송합니다.', 'admin', DEFAULT, DEFAULT
);

COMMIT;

-- 공지사항 전체 조회
SELECT * FROM NOTICE
ORDER BY NDATE;

-- 공지사항 한개 조회
SELECT * FROM NOTICE
WHERE NNO = '1';

CREATE TABLE BOARD(
        BNO NUMBER PRIMARY KEY,
        BTITLE VARCHAR2(100) NOT NULL,
        BCONTENT VARCHAR2(4000) NOT NULL,
        BWRITER VARCHAR2(30),
        BCOUNT NUMBER DEFAULT 0,
        BOARDFILE VARCHAR2(2000),
        BDATE DATE DEFAULT SYSDATE,
        DELFLAG CHAR(1) DEFAULT 'N' CHECK( DELFLAG IN ('Y', 'N')),
        CONSTRAINT FK_WRITER FOREIGN KEY (BWRITER)
        REFERENCES MEMBER(USERID) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE BOARD_COMMENT(
        CNO NUMBER PRIMARY KEY,
        BNO NUMBER NOT NULL,
        CCONTENT VARCHAR2(4000) NOT NULL,
        CWRITER VARCHAR2(30),
        CDATE DATE DEFAULT SYSDATE,
        DELFLAG CHAR(1) DEFAULT 'N' CHECK( DELFLAG IN ('Y', 'N')),
        CONSTRAINT FK_BNO FOREIGN KEY (BNO)
        REFERENCES BOARD (BNO) ON DELETE CASCADE,
        CONSTRAINT FK_C_WRITER FOREIGN KEY (CWRITER)
        REFERENCES MEMBER (USERID) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_COMMENT;

CREATE TABLE ATTACHMENT (
  FNO NUMBER PRIMARY KEY,
  BNO NUMBER NOT NULL,
  BTYPE NUMBER,
  ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000) NOT NULL,
  UPLOAD_DATE DATE DEFAULT SYSDATE,
  FILE_LEVEL NUMBER,
  DOWNLOAD_COUNT NUMBER DEFAULT 0,
  DELFLAG VARCHAR2(1) DEFAULT 'N',
  FOREIGN KEY (BNO) REFERENCES BOARD(BNO)  
);

CREATE SEQUENCE SEQ_FNO;
```

<br>

<hr>

그런데 한글 입출력이 제대로 되지 않는 문제 발생. 

<br>

```sql
--system / oracle 계정에서
SELECT value$ FROM sys.props$ WHERE name = 'NLS_CHARACTERSET';
--입력하고, AL32UTF8 를 확인

--jsp / jsp 계정에서
SELECT * FROM NLS_DATABASE_PARAMETERS;
--입력하고 

--NLS_LANGUAGE AMERICAN 등의 정보를 확인하였고, 다행히 NLS_CHARACTERSET 은 AL32UTF8 임을 확인.

SELECT * FROM NLS_DATABASE_PARAMETERS;
-- 역시 NLS_LANGUAGE AMERICAN 등의 정보를 확인.
```

다커 터미널에서 설정을 변경해야 한다.

```bash
root@1f54f877de4b:/# export NLS_LANG=KOREAN_KOREA.AL32UTF8
```

이후 sqlplus에서

```sql
SQL> SELECT '한글' FROM DUAL;
```

이제 한글 입출력이 가능하다.

<br>

<hr>

현재까지의 설정만으로 Oracle 11g의 사용이 가능하지만, 터미널에서만 작업해야 한계가 있다. <br>

IntelliJ와 Docker Oracle 11g를 연동하여 사용하면 편리하다. <br>

IntelliJ에서 **command + shift + a** 를 사용하여 

<img src="https://github.com/ysjhmtb/blog_images/blob/master/documents/VIVA%20BRUTE%20FORCE/CODING/Mac%EC%97%90%EC%84%9C%20Docker%EC%99%80%20IntelliJ%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20Oracle%20Database%2011g%20%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/1.png?raw=true">

와 같이 데이터베이스를 검색한다. <br>

그리고 아래의 그림처럼 Oracle을 선택한다.

<img src="https://github.com/ysjhmtb/blog_images/blob/master/documents/VIVA%20BRUTE%20FORCE/CODING/Mac%EC%97%90%EC%84%9C%20Docker%EC%99%80%20IntelliJ%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20Oracle%20Database%2011g%20%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/2.png?raw=true">

<br>

다커 컨테이너를 생성하면서 사용한 포트 번호를 참조하여 설정을 하고, 이전에 생성했던 계정을 이용하여 로그인을 한다.

<img src="https://github.com/ysjhmtb/blog_images/blob/master/documents/VIVA%20BRUTE%20FORCE/CODING/Mac%EC%97%90%EC%84%9C%20Docker%EC%99%80%20IntelliJ%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20Oracle%20Database%2011g%20%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/3.png?raw=true">

<br>

쿼리를 입력하여 제대로 동작함을 확인할 수 있다. (NOTICE 테이블은 입력해 두었던 데이터이다.)

<img src="https://github.com/ysjhmtb/blog_images/blob/master/documents/VIVA%20BRUTE%20FORCE/CODING/Mac%EC%97%90%EC%84%9C%20Docker%EC%99%80%20IntelliJ%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20Oracle%20Database%2011g%20%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0/4.png?raw=true">



<br>

<hr>











