<%@page import="exhibition.model.ExhibitionDao"%>
<%@page import="exhibition.model.Exhibition"%>
<%@page import="java.util.List"%>
<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./WEB-INF/common/user.jsp" %>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.topcap{
		display:relative; bottom:0;
		width:170px; height:160px; text-align: left; padding-left: 10px; padding-top: 10px; margin-left:-9%;
	}

	.fade-effect{
	    animation: fadein 2.5s ease-in-out;
	    -moz-animation: fadein 2.5s ease-in-out; /* Firefox */
	    -webkit-animation: fadein 2.5s ease-in-out; /* Safari and Chrome */
	    -o-animation: fadein 2.5s ease-in-out; /* Opera */
	}
	@keyframes fadein {
	    from {
	        opacity:0;
	        transform: translateY(40px);
	    }
	    to {
	        opacity:3;
	        transform: none;
	    }
	}
	@-moz-keyframes fadein { /* Firefox */
	    from {
	        opacity:0;
	        transform: translateY(40px);
	    }
	    to {
	        opacity:3;
	        transform: none;
	    }
	}
	@-webkit-keyframes fadein { /* Safari and Chrome */
	    from {
	        opacity:0;
	        transform: translateY(40px);
	    }
	    to {
	        opacity:3;
	        transform: none;
	    }
	}
	@-o-keyframes fadein { /* Opera */
	     from {
	        opacity:0;
	        transform: translateY(40px);
	    }
	    to {
	        opacity:3;
	        transform: none;
	    }
	}
	.scrollNav{position:relative; top:100px; /* background-color: rgb(241,243,243); */ height:620px;}
</style>

<script>
$(document).ready(function(){
	/* 40+103+68+450 */
    var navHeight = $(".mainNav").height();
	//alert(navHeight);
    
    $(".scrollNav").hide();
    $(window).scroll(function(){  // 윈도우 스크롤 기능 작동
        var rollIt = $(this).scrollTop() >= 350; 

    if(rollIt){ 
		//윈도우 스크롤 기능의 값이 navHeight 의 높이와 같거나 크면
        $(".scrollNav").show();
     }
    });
});
	
$(function(){	
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.	
    $('#carousel-example-generic').carousel({	
       // 슬리아딩 자동 순환 지연 시간	
       // false면 자동 순환하지 않는다.	
       interval: 3000,	
       // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.	
       pause: "hover",	
       // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복	
       wrap: true,	
       // 키보드 이벤트 설정 여부(?)	
       keyboard : true	
	});	
});
</script>	

<!-- 사진슬라이드 -->
<div align="center" class="mainNav">	
    <div id="carousel-example-generic" class="carousel slide mt-5" style="height:530px; width:100%;">	
      <ol class="carousel-indicators" style="display:relative; top:420px">		
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>	
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>	
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>	
        <li data-target="#carousel-example-generic" data-slide-to="4"></li>	
      </ol>	

      <div class="carousel-inner" role="listbox">	
        <!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->	
        <div class="item active">	
          <img src="resources/image/1.png" style="height:530px; width:80%;">
          <div class="carousel-caption topcap text-primary">	
          	<h4><b>Tango w. cow</b></h4>
          	<h5>2021.04.30~5.16</h5>
          	<p align="left">
          	<button type="button" class="btn btn-light btn-sm mt-1">자세히보기</button>
          	</p>
          </div>	
        </div>
        	
        <div class="item">	
          <img src="resources/image/2.png" style="height:530px; width:80%;">	
          <div class="carousel-caption topcap text-primary">	
         	<h4><b>Your Art Here</b></h4>
          	<h5>2021.05.25~6.10</h5>
          	<p align="left">
          	<button type="button" class="btn btn-light btn-sm mt-1">자세히보기</button>
          	</p>
          </div>	
        </div>
        
        <div class="item">	
          <img src="resources/image/3.png" style="height:530px; width:80%;">	
          <div class="carousel-caption topcap text-primary">	
         	<h4><b>Pacific Arts</b></h4>
          	<h5>2021.07.10~7.21</h5>
          	<p align="left">
          	<button type="button" class="btn btn-light btn-sm mt-1">자세히보기</button>
          	</p>
          </div>	
        </div>
        
        <div class="item">	
          <img src="resources/image/4.png" style="height:530px; width:80%;">	
          <div class="carousel-caption topcap text-primary">	
         	<h4><b>Asian Museum</b></h4>
          	<h5>2021.08.03~08.16</h5>
          	<p align="left">
          	<button type="button" class="btn btn-light btn-sm mt-1">자세히보기</button>
          	</p>
          </div>	
        </div>
      </div>
      
      <!-- 왼쪽 화살표 버튼 -->	
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">	
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true">
        <i class="bi bi-chevron-double-left text-primary"></i>
        </span>	
      </a>
      
      <!-- 오른쪽 화살표 버튼 -->	
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">	
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
        <i class="bi bi-chevron-double-right text-primary"></i>
        </span>	
      </a>
   </div>	
</div>

<!-- 디자인:스크롤,fadein 기능:추천전시작품 -->
<div class="h-100">
	<div class="fade-effect scrollNav">
		<h3 style="margin-left:10%; font-family:'맑은 고딕'">회원님을 위한 <span class="text-success">추천</span> 프로그램</h3>
		<p style="margin-left:10%; font-size: 15px" class="pb-3">
			<c:choose>
			<c:when test="${sessionScope.loginId==null}">
				<span class="text-danger">회원가입을 하시면 다양한 추천서비스를 받으실 수 있습니다</span><br>
				<h5 align="center" class="border-top border-bottom border-secondary mx-auto p-2 my-4" style="font-family:'맑은 고딕'; color:rgb(103,197,162)">회원가입으로 다양한 추천서비스를 즐기세요!</h5>
			</c:when>
			<c:when test="${sessionScope.lists==null || sessionScope.list=='[]'}">
				<span class="text-danger">현재 회원님의 스타일에 맞는 추천작은 없습니다.</span><br>
				<h5 align="center" class="border-top border-bottom border-secondary mx-auto p-2 my-4" style="font-family:'맑은 고딕'; color:rgb(103,197,162)">최신 전시 목록 입니다</h5>
			</c:when>
			<c:otherwise>
				<span class="text-success">${sessionScope.loginId} 님을 위한 맞춤 서비스</span><br>
				<h5 align="center" class="border-top border-bottom border-secondary mx-auto p-2 my-4" style="font-family:'맑은 고딕'; font-weight:bold;">당신의 키워드 '${sessionScope.loginStyle}'</h5>
			</c:otherwise>
			</c:choose>
		</p>

		<!-- 추천작품띄우기 -->
		<div class="row mr-0" style="margin-left:8%;">
		<c:choose>
		
		<c:when test="${sessionScope.loginId==null || sessionScope.lists==null || sessionScope.lists=='[]'}">
			<c:set value="${sessionScope.clists}" var="setlists" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:set value="${sessionScope.lists}" var="setlists" scope="session"/>
		</c:otherwise>
		</c:choose>
		<c:forEach items="${setlists}" var="exlists">		 
		  <div class="card ml-4 mr-0 px-0" style="width: 30%; height:450px;">
			  <div class="card-header" style="height:35px"></div>
			  <div class="card-body" style="text-align: center">
			   <!-- 전시이름 -->
			    <h5 class="card-title" style="font-family:'맑은 고딕'"><b>${exlists.name}</b></h5>
			    <!-- 전시날짜 -->
			    <h6 class="card-subtitle text-muted">
			    	<fmt:parseDate var="start"  value="${exlists.start_period}" pattern="yyyy-MM-dd"/>
			    	<fmt:parseDate var="end"  value="${exlists.end_period}" pattern="yyyy-MM-dd"/>
			    	<fmt:formatDate var="s" value="${start}" pattern="yyyy-MM-dd" />
			    	<fmt:formatDate var="e" value="${end}" pattern="yyyy-MM-dd" />
			    	${s}~${e}
			    </h6>
			  </div>
			  <!-- 사진 -->
			  <div class="card-body m-auto p-0 w-100" style="height: 160px; text-align:center">
			  	<img src="<%=request.getContextPath()%>/resources/${exlists.img}" class="h-100">
			  </div>
			  <!-- 전시내용 -->
			  <div class="card-body">
			    <p class="card-text">${exlists.contents}</p>
			  </div>
			  <!-- 전시장소,주최회사 -->
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item">장소<span class="top-span text-light">│</span>${exlists.place}</li>
			    <li class="list-group-item">주최<span class="top-span text-light">│</span>${exlists.company}</li>
			  </ul>
			  <!-- 해당전시 상세보기 -->
			  <div class="card-footer px-0 py-1 m-0" align="center" style="height:35px">
			  	<a href="userExhibitDetail.ex?num=${exlists.num}">자세히보기</a>
			  </div>
		 	</div>
		 </c:forEach>
		</div>
	</div>
</div>
<!-- footer -->
<%@ include file="./WEB-INF/common/footer.jsp" %>

