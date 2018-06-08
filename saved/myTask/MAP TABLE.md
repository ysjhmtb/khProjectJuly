<h2>MAP TABLE</h2>

<br>

<h2>MARLOC</h2>

|        MARNAME         |    LAT    |    LNG     |   EXPL   |
| :--------------------: | :-------: | :--------: | :------: |
| 홍대앞예술시장프리마켓 | 37.552291 | 126.923397 | 예술시장 |

<br>

```plsql
CREATE TABLE MARLOC(
    MARNAME VARCHAR2(50),
    LAT NUMBER(15,15),
    LNG NUMBER(15,15),
    EXPL VARCHAR2(50)	
);

INSERT INTO MARLOC VALUES('홍대앞예술시장프리마켓',37.552291,126.923397,'예술시장');

```

<br>

