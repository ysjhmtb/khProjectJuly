<h1>Unit Test Beginning</h1>

<br>

<hr>

[A Beginner’s Guide to Testing Functional JavaScript](https://www.sitepoint.com/testing-functional-javascript/)



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Jasmine Test</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasmine/2.6.1/jasmine.min.css">
</head>
<body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/2.6.1/jasmine.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/2.6.1/jasmine-html.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/2.6.1/boot.min.js"></script>

<script>

    /*

    A Beginner’s Guide to Testing Functional JavaScript
    https://www.sitepoint.com/testing-functional-javascript/

     */

    const isPalindrome = (str) => {
        return str
            .toString()
            .split("")
            .reverse()
            .join("") === str.toString();
    };



    describe("isPalindrome", () => {
        it("returns true if the string is a palindrome", () => {
            expect(isPalindrome("abba")).toEqual(true);
        });
        it("returns false if the string isn't a palindrome", () => {
            expect(isPalindrome("Bubba")).toEqual(false);
        });
        it("returns true if a number is a palindrome", () => {
            expect(isPalindrome(1001)).toEqual(true);
        });
    });




</script>

</body>
</html>
```

<br>

<hr>

[새내기 개발자의 JUnit 여행기](http://www.nextree.co.kr/p11104/)

<br>

```
Project > Properties > Java Build Path > Libraries > Add Library > JUnit > JUnit 4  
```

<br>

```java
package com.calculator;

public class Calculator {
	public int sum(int num1, int num2){
        return num1 + num2;
    }
}

```

<br>

```
com.calculator.test 패키지 만들기 > New > JUnit Test Case

>

Name : CalculatorTest
Class under test : com.calculator.Calculator

>

테스트 할 메소드 선택

```

<br>

```java
package com.calculator.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.calculator.Calculator;

public class CalculatorTest {

	@Test
    public void testSum() {
        Calculator calculator = new Calculator();
        assertEquals(30, calculator.sum(10, 20));
    }

}
```

<br>

```
CalculatorTest.java > Run As > JUnit Test
```

<br>



<h3>대표적인 단정문</h3>

> assertArrayEquals(a,b) : 배열 a와b가 일치함을 확인 
>
> assertEquals(a,b) : 객체 a와b의 값이 같은지 확인 
>
> assertSame(a,b) : 객체 a와b가 같은 객체임을 확인 
>
> assertTrue(a) : a가 참인지 확인 
>
> assertNotNull(a) : a객체가 null이 아님을 확인 
>
> 
>
>  http://junit.sourceforge.net/javadoc/org/junit/Assert.html

<br>

<h3>@Test</h3>

테스태 대상 메소드임을 의미.

<br>

<h3>@Test(timeout=5000)</h3>

테스트 메소드가 결과를 반환하는데 5,000밀리 초를 넘긴다면 실패.

<br>

<h3>@Test(expected=RuntimeException.clss)</h3>

테스트 메소드가 RuntimeException을 발생시켜야 성공, 아니면 실패.

<br>

<h3>@BeforeClass , @AfterClass</h3>

딱 한번씩만 수행되도록 지정.

<br>

<h3>@Before , @After</h3>

메소드들이 테스트 되기 전과 후에 각각 실행되게 지정.

<br>

|         |      | @BeforeClass |      |        |
| :-----: | :--: | :----------: | :--: | :----: |
|         |      |      \|      |      |        |
| @Before |  =>  |    @Test     |  =>  | @After |
| @Before |  =>  |    @Test     |  =>  | @After |
| @Before |  =>  |    @Test     |  =>  | @After |
|         |      |      \|      |      |        |
|         |      | @AfterClass  |      |        |



<br>

자세한 내용을 아래와 같이 인용.

> @BeforeClass 어노테이션은 테스트 클래스 수행 시 단위 테스트 메소드 보다 먼저 딱 한 번 수행되어야 할 경우 지정합니다. 예를 들어 DB 연결 시 드라이버 로딩 부분을 @BeforeClass로 지정한 메소드에 작성합니다. 반대로 @AfterClass 어노테이션은 단위 테스트 함수들이 다 수행되고 맨 마지막에 수행되어야 할 경우 지정합니다. 예를 들어 DB 연결 후 마지막에 드라이버를 반납하는 부분을 @AfterClass로 지정한 메소드에 작성합니다.
>
> @Before와@After는 @Test로 지정된 단위 테스트 메소드가 실행되기 전 한 번씩 수행하거나 실행되고 난 후 수행되어야 하는 부분을 작성합니다. 예를 들어 공통으로 객체를 생성하는 코드를 @Test로 지정된 단위 테스트 메소드 안에 있다면 그 부분을 @Before에 지정된 메소드에 작성합니다.



<br>

<hr>

