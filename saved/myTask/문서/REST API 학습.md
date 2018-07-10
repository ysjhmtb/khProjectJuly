<h1>REST API 학습</h1>

<br>

REST API란 단어를 들어본 적이 있었고, 수업 시간에 이에 대한 사용이 있어서 이에 대해 찾아보게 되었다. 그리고 [Understanding And Using REST APIs](https://www.smashingmagazine.com/2018/01/understanding-using-rest-api/) 란 글을 발견하였다.

<br>

> If you want to be able to read API documentations and use them effectively, you’ll first need to understand everything about REST APIs. Let’s get started.

이란 QUICK SUMMARY와 함께 시작되는데, 확실히 알아두어야 할 내용으로 판단된다.

<br>

<h2>REST API란?</h2>

<br>

유튜브에서 "배트맨"이란 단어를 사용해서 검색하면 이와 관련된 목록들을 확인할 수 있는데, REST API 역시 비슷하게 동작한다.<br>

**API** 를 통해 프로그램들은 의사소통을 한다. 그리고 **REST** 는 개발자가 API를 만들 때 준수해야 할 규칙들이다. 이런 규칙들을 통해 특정 URL에 접근해서 데이터들을 가져올 수 있다. 여기서 URL이 **request** 라고 불리고,  데이터가 **response** 라고 불린다.

<br>

<h2>Request에 대해 더 자세히 알아보자</h2>

<br>

request는 

1. The endpoint
2. The method
3. The headers
4. The data (or body)

로 이루어져 있다. 

<br>

**The endpoint** (or route) 는 요청을 보내게 되는 url이고, 다음의 구조를 갖는다. 

```
root-endpoint/?
```

**root-endpoint** 는 API의 시작 지점이고, **path** 는 요청하는 resource가 무엇인지를 나타낸다. 

<br>

쉽게 생각해서 일상적으로 사용하는 웹 사이트를 생각해 볼 수 있는데, `https://www.smashingmagazine.com/tag/javascript/` 에서 `https://www.smashingmagazine.com/` 가 root-endpoint이고 `/tag/javascript` 가 path이다.

<br>

path로 무엇을 할 수 있을까? 다음의 경우를 생각해 보자. 예를 들어, Github API로 특정 사용자의 저장소 리스트를 알고 싶다면 어떻게 해야 할까? 이를 위해서는 다음과 같은 path를 사용해야 한다.

```
/users/:username/repos
```

Path 에 있는 `:` 은 한 개의 변수를 나타낸다. `zellwk` 라는 사용자의 저장소 리스트를 알고 싶다면 다음과 같을 것이다.

```
https://api.github.com/users/zellwk/repos
```

<br>

Endpoint의 마지막 부분은 **query parameters** 이다. 엄밀히 말해서 쿼리 패러미터는 REST의 일부는 아니지만, 많은 API에서 이들을 보게 될 것이다. 쿼리 패러미터는 키-밸류 조합을 통해 리퀘스트를 수정할 수 있게 해주는데, 다음과 같이 언제나 `?` 로 시작하며, `&` 로 분리된다.

```
?query1=value1&query2=value2
```

<br>

만약에 사용자 zellwk 가 최근에 올린 저장소의 리스트를 얻고 싶다면 다음과 같이 작성한다.

```
https://api.github.com/users/zellwk/repos?sort=pushed
```

<br>

<h2>curl을 사용하여 endpoints 테스트 해보기</h2>

모든 언어로 request를 보내는 것이 가능한데, JavaScript의 경우 [Fetch API](https://css-tricks.com/using-fetch/) 나 [jQuery's Ajax method](http://api.jquery.com/jquery.ajax/) 를 사용하면 된다. <br>

지금은 [cURL](https://curl.haxx.se/)이라고 불리는 커맨드 라인 유틸리티를 사용한다. 참고로 보통 API 문서는 cURL을 기준으로 작성되어 있다.  

<br>

```bash
$ curl --version
```

위의 명령어를 통해 cURL이 설치되어 있는 확인할 수 있다.

<br>

cURL 사용하기.

```bash
$ curl https://api.github.com
```

그러면 아래와 같은 결과를 확인할 수 있다.

<img src="https://github.com/ysjhmtb/blog_images/blob/master/documents/VIVA%20BRUTE%20FORCE/CODING/REST%20API%20%ED%95%99%EC%8A%B5/1.png?raw=true">

만일 사용자 zellwk의 저장소 리스트를 보고 싶다면 아래와 같이 작성한다.

```bash
$ curl https://api.github.com/users/zellwk/repos

```

만약 아래와 같이 입력하면 

```bash
$ curl https://api.github.com/users/zellwk/repos\?sort=\=pushed

```

비슷하지만 약간 더 많은 정보를 확인할 수 있는데, 중요한 지점은 `\` 이다. 커맨드 라인에서 `?` 와 `=` 는 특수문자이기 때문에, 그 앞에 백슬래시를 사용해야 한다.

<br>

<h2>JSON</h2>

REST API 통신에 사용되는 데이터 형식은 JSON.

<br>

<h2>Request에 대해 더 자세히 알아보기로 돌아가서 </h2>

<br>

**The Method**

<br>

메소드는 서버에 리퀘스트를 보내는 형태이며, 다음의 다섯 형태를 선택할 수 있다.

<br>

- GET
- POST
- PUT
- PATCH
- DELETE

<br>

이들 메소드를 통해 요청한 리퀘스트의 의미를 제공하며, CRUD를 위해 사용된다.

<br>

|  메소드 이름  |                        리퀘스트 의미                         |
| :-----------: | :----------------------------------------------------------: |
|      GET      | 서버는 요청된 데이터를 찾고 이를 다시 전송해 준다. 디폴트 메소드이다. READ. |
|     POST      | 서버는 데이터베이스에 새로운 영역을 만들고, 이를 사용자에게 알려준다. CREATE. |
| PUT and PATCH | 서버는 데이터베이스의 해당 영역의 정보를 갱신하고, 결과를 보내준다. UPDATE. |
|    DELETE     |    서버가 해당 자원을 삭제하고, 결과를 알려준다. DELETE.     |

<br>

사용자의 저장소 목록을 알고 싶다면

```
GET /users/:username/repos
```

새로운 저장소를 만들고 싶다면

```
POST /user/repos
```

<br>

<br>

cURL로 저장소를 만들고 싶다면

```bash
$ curl -X POST https://api.github.com/user/repos
```

<br>

<br>

**The Headers**

<br>

헤더는 클라이언트와 서버에게 정보를 제공하는데 사용된다. [HTTP Headers Reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) 에서 여러 헤더를 찾을 수 있다.

<br>

HTTP Headers 는 `속성 - 키` 의 형태이다. 다음은 서버에게 JSON 컨텐츠를 기대한다는 헤더를 작성한 것이다.

```bash
$ curl -H "Content-Type: application/json" https://api.github.com
```

<br>

전송한 헤더를 확인하고 싶으면 다음과 같이 사용한다.

```bash
$ curl -H "Content-Type: application/json" https://api.github.com -v

```

전송받은 내용에서, `*` 은 cURL에 제공되는 부가 정보를, `>` 는 request headers를, `<` 는 response headers를 나타낸다.

<br>

<br>

**The Data(Or "Body")**

<br>

data(body or message)는 서버에 전송되길 원하는 정보를 포함하는데, POST, PUT, PATCH, DELETE 리퀘스트일 때만 사용된다.

<br>

```bash
curl -X POST <URL> -d property1=value1
```

또는

```bash
curl -X POST <URL> -d property1=value1 -d property2=value2
```

또는

```bash
curl -X POST <URL> \
-d property1=value1 \ 
-d property2=value2
```

<br>

<br>

 서버를 만들고 운용할 수 있다면 API를 만들고, 자신의 데이터로 테스트 해볼 수 있을 것이다. 만일 그럴 수 없다면 [Building a Simple CRUD Application with Express and MongoDB](https://zellwk.com/blog/crud-express-mongodb/) 를 참조하라. 이를 원하지 않는다면 Request bin( [Requestb.in](https://requestb.in/)  )을 만들 수 있다. (**현재 이 서비스는 중단된것 같다.** 추후 자체 서버를 구축해서 테스트를 진행해야겠다.)

<br>

```
https://requestb.in/1ix963n1
```

 와 같은 URL을 얻었다고 가정하면,

<br>

다음을 통해 request bin에 데이터를 보내, bin's webpage를 리프레쉬 하자.

```bash
curl -X POST https://requestb.in/1ix963n1 \
  -d property1=value1 \
  -d property2=value2
```

<br>

JSON 데이터를 보내고 싶다면,

```bash
curl -X POST https://requestb.in/1ix963n1 \
  -H "Content-Type: application/json" \
  -d '{
  "property1":"value1",
  "property2":"value2"
}'
```

<br>

이것이 request의 구조에 대해 알아야 할 핵심이다.

<br>

<br>

이제 포스트에 대해 생각해 보자. 깃헙 API를 통해 `POST` 를 보낼 때, “Requires authentication”?  와 같은 메시지를 받게 될텐데, 이는 아직 인증을 받지 못했기 때문이다.

<br>

<br>

<h2>Authentication</h2>

<br>

웹에서는 스스로를 인증할 수 있는 방법이 크게 두 가지가 있다.

<br>

1. With a username and password (also called basic authentication)
2. With a secret token

<br>

여기서는 첫 번째 방법에 대해 배우겠지만, 두 번째 방법에 대해 알고 싶다면 [What You Need To Know About OAuth2 And Logging In With Facebook](https://www.smashingmagazine.com/2017/05/oauth2-logging-in-facebook/) 가 추천된다.

<br>

cURL로 기본 인증을 진행하려면 다음과 같이 입력한다.

```bash
curl -x POST -u "username:password" https://api.github.com/user/repos
```

<br>

이를 성공적으로 진행하면 이번에는 “Problems parsing JSON.” 이라는 메시지를 받게 될텐데,  POST, PUT, PATCH, DELETE 에서 사용되는 어떤 데이터도 서버에 제공하지 않았기 때문이다.

<br>

<br>

<h2>HTTP Status Codes And Error Messages</h2>

<br>

| 200+ |              the request has **succeeded**.               |
| :--: | :-------------------------------------------------------: |
| 300+ |       the request is **redirected** to another URL        |
| 400+ | an **error that originates from the client** has occurred |
| 500+ | an **error that originates from the server** has occurred |

<br>

사용자이름과 비밀번호 없이 다음과 같은 요청을 보내면 401 에러 코드를 받게 된다.

```bash
$ curl -X POST https://api.github.com/user/repos -i
HTTP/1.1 401 Unauthorized
Date: Sat, 30 Jun 2018 07:27:34 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 115
Server: GitHub.com
Status: 401 Unauthorized
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
X-RateLimit-Reset: 1530347254
X-GitHub-Media-Type: github.v3; format=json
Access-Control-Expose-Headers: ETag, Link, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval
Access-Control-Allow-Origin: *
Strict-Transport-Security: max-age=31536000; includeSubdomains; preload
X-Frame-Options: deny
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
Referrer-Policy: origin-when-cross-origin, strict-origin-when-cross-origin
Content-Security-Policy: default-src 'none'
X-Runtime-rack: 0.012657
X-GitHub-Request-Id: C2E7:9C3C:C1E948:1063A6F:5B3730E6

{
  "message": "Requires authentication",
  "documentation_url": "https://developer.github.com/v3/repos/#create"
}

```

<br>

<h2>API Versions</h2>



 시간이 지남에 따라 버전 업그레이드가 이루어지면 기존에 동작하던 애플리케이션이 제대로 동작하지 못하게 되기 때문에, 이를 확인할 필요가 있다. API 버전을 확인할 수 있는 방법은 두 가지가 있다.

<br>

1. Directly in the endpoint
2. In a request header

<br>

트위터는 첫 번째 방법을 사용하는 반면,

```bash
https://api.twitter.com/1.1/account/settings.json
```

<br>

깃헙은 두 번째 방법을 사용한다.

```bash
curl https://api.github.com -H Accept:application/vnd.github.v3+json
```

<br>

