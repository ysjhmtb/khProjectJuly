<h1>팀원으로서 프로젝트를 진행하면서 배운 것과 진행한 일들</h1>

<br>

<hr>

1) 프로젝트를 진행하면서 오라클 데이터베이스를 사용하였는데, 개발과정에서 사용했던 운영체체는 macOS였다. 따라서 오라클 데이터베이스를 이용하는데 어려움이 있었고, 아래와 같이 Docker를 통해 사용하게 되었다.

 <br>

[Mac에서 Docker와 IntelliJ를 이용하여 Oracle Database 11g 사용하기](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/%EB%AC%B8%EC%84%9C/Mac%EC%97%90%EC%84%9C%20Docker%EC%99%80%20IntelliJ%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC%20Oracle%20Database%2011g%20%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0.md)

<br>

<hr>

2) 프로젝트에서 지도 API를 사용하는 부분을 맡았는데, [Udacity](https://www.udacity.com/) 의 [Google Maps APIs](https://www.udacity.com/course/google-maps-apis--ud864) 의 일부를 수강해서 사용하는 방법을 배우고, 프로젝트를 진행하게 되었다. <br>

[마커를 지도에 나타내기](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/%EB%AC%B8%EC%84%9C/Making%20your%20Mark/%EB%A7%88%EC%BB%A4%EB%A5%BC%20%EC%A7%80%EB%8F%84%EC%97%90%20%EB%82%98%ED%83%80%EB%82%B4%EA%B8%B0.md)

<br>

[지도에 스타일 더하기](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/%EB%AC%B8%EC%84%9C/Being%20Stylish/%EC%A7%80%EB%8F%84%EC%97%90%20%EC%8A%A4%ED%83%80%EC%9D%BC%20%EB%8D%94%ED%95%98%EA%B8%B0.md)

<br>

<hr>

3) 수업 중 REST API를 사용할 기회가 있었는데, 그 기회를 통해 다음과 같이 배우게 되었다.

[REST API 학습](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/%EB%AC%B8%EC%84%9C/REST%20API%20%ED%95%99%EC%8A%B5.md)

<br>

<hr>

4) 

프로젝트를 진행하면서 다음 내용의 개발을 진행했다.

<br>

<img src="https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B2%B0%EA%B3%BC%20%EC%82%AC%EC%A7%84/%EC%9E%84%EB%B0%95%ED%95%9C%20%EC%8B%9C%EC%9E%A5%20Dday.png?raw=true">

가장 임박한 시장에 대한 정보를 카운트다운하는 기능을 Ajax를 사용해서 구현한 부분이며, 다음과 같은 코드로 구성되어 있다.

[indexMarketInfo.jsp](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/web/indexMarketInfo.jsp)

[SelectStartDayAjaxServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/SelectStartDayAjaxServlet.java)

[MapService.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/service/MapService.java)

[MapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/MapDao.java)





<br>

<img src="https://raw.githubusercontent.com/ysjhmtb/khProjectJuly/master/saved/withMembers/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B2%B0%EA%B3%BC%20%EC%82%AC%EC%A7%84/%EC%8B%9C%EC%9E%A5%20%EC%9C%84%EC%B9%98%EC%99%80%20%EC%9D%B4%EB%B2%A4%ED%8A%B8.png">

데이터베이스에서 데이터를 조회한 후 그 결과물을 지도에 나타내면서, 필요한 이벤트를 추가한 것인데, 다음과 같은 코드로 이루어져 있다.

<br>

[mapList.jsp](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/web/views/map/mapList.jsp)

[MapListServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/MapListServlet.java)

[MapService.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/service/MapService.java)

[MapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/MapDao.java)

[MapVo.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/vo/MapVo.java)

<br>

<img src="https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B2%B0%EA%B3%BC%20%EC%82%AC%EC%A7%84/%EC%8B%9C%EC%9E%A5%20%EC%A0%95%EB%B3%B4%20%EB%93%B1%EB%A1%9D.png?raw=true">



데이터베이스에 정보를 입력 및 수정, 삭제하는 기능이며, 다음과 같이 구성되어 있다.

[insertMap.jsp](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/web/views/map/insertMap.jsp)

[modifyMap.jsp](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/web/views/map/modifyMap.jsp)

[InsertMapServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/InsertMapServlet.java)

[ModifyMapServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/ModifyMapServlet.java)

[RealModifyMapServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/RealModifyMapServlet.java)

[RealDeleteMapServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/RealDeleteMapServlet.java)

[MapService.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/service/MapService.java)

[MapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/MapDao.java)

[AttachmentMapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/AttachmentMapDao.java)

[MapVo.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/vo/MapVo.java)

[AttachmentMapVo.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/vo/AttachmentMapVo.java)

<br>

<img src="https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B2%B0%EA%B3%BC%20%EC%82%AC%EC%A7%84/%EC%8B%9C%EC%9E%A5%20%EC%A0%95%EB%B3%B4%20%EC%83%81%EC%84%B8%20%EC%A1%B0%ED%9A%8C.png?raw=true">

지도에서 필요한 내용의 조회를 가능케 하는 부분이며, 다음과 같이 구성되어 있다.

[mapDetail.jsp](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/web/views/map/mapDetail.jsp)

[MapDetailServlet.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/controller/MapDetailServlet.java)

[MapService.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/service/MapService.java)

[MapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/MapDao.java)

[AttachmentMapDao.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/dao/AttachmentMapDao.java)

[MapVo.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/vo/MapVo.java)

[AttachmentMapVo.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/withMembers/totalpageJuly10JKH/myWebProject/src/com/kh/java/map/model/vo/AttachmentMapVo.java)

<br>

<hr>

5) 개발 과정에서 일부분은 다음과 같이 테스트 케이스를 작성하면서 TDD 방식으로 진행하여 보았다. 처음 해보는 방식이다보니 미숙했지만 좋은 경험이었다.

[JDBCTemplateTest.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/stepJune9/myWebProject/src/com/kh/java/common/test/JDBCTemplateTest.java)

[MapServiceTest.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/stepJune9/myWebProject/src/com/kh/java/map/model/service/test/MapServiceTest.java)

[MapDaoTest.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/stepJune9/myWebProject/src/com/kh/java/map/model/dao/test/MapDaoTest.java)

[AttachmentMapDaoTest.java](https://github.com/ysjhmtb/khProjectJuly/blob/master/saved/myTask/stepJune9/myWebProject/src/com/kh/java/map/model/dao/test/AttachmentMapDaoTest.java)

<br>

<hr>



