<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	  
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, 1);
	
	String day = sdf.format(cal.getTime());
	
	//System.out.println(day);
%>

<style type="text/css">
	.top-a{
		font-size: 14px;
		color: #353535;
	}
	.top-span{
		font-size :10px;
		margin-right: 5px;
		margin-left: 5px;
	}
	.afont{
		color: #001054;
		font-size: 18px;
		margin-right: 30px;
	}
</style>

<!-- onshow 로고 -->
<header style="position: relative; top: 0; box-shadow: 0 0 2px #3335">
	<!-- 홈페이지 상단 바 -->
	<div class="border-bottom" style="height: 40px">
		<div style="position: absolute; top:10px; right:30px">
			<c:if test="${sessionScope.loginId == 'penguin'}">
			<a class="top-a" href="main.jsp">관리자홈</a>
			</c:if>
			<c:if test="${sessionScope.loginId != 'penguin'}">
			<a class="top-a" href="user.jsp">홈</a>
			</c:if>
			<span class="top-span text-light">│</span>
			<c:if test="${loginInfo.num == null}">
				<a class="top-a" href="loginForm.me">로그인</a>
				<span class="top-span text-light">│</span>
				<a class="top-a" href="registerForm.me">회원가입</a>
			</c:if>
			<c:if test="${loginInfo.num != null}">
				<a class="top-a" href="logout.jsp">로그아웃</a>
				<span class="top-span text-light">│</span>
				<a class="top-a text-success" href="cart.re">장바구니</a>
			</c:if>
		</div>
	</div>
	
	<div class="logo" style="text-align:center;">
		<a href="user.jsp"><img src="resources/image/onshow.png" class="mb-3" style="max-width: 300px; width:50%"></a>
	</div>
	
	<form class="form-inline d-none d-md-block" style="position:absolute; top:80px; right:20px">
      <input class="form-control" type="text" placeholder="Search">
      <button class="btn btn-primary ml-1" type="submit">검색</button>
    </form>
	
	<!-- pc 네비 메뉴바 -->
	<nav align="center" class="d-block d-md-none" style="position:relative;">
		<div class="bg-primary m-auto" style="position: absolute;">
			<div class="col">회사소개</div>
			<div class="col">
				<a class="dropdown-item" href="info.com">회사소개</a>
				<a class="dropdown-item" href="location.com">찾아오시는길</a>
				<a class="dropdown-item" href="ceo.com">대표이사</a>
			</div>
			<div class="col">전시·박람</div>
			<div class="col">
				<a class="dropdown-item" href="userExhibit.ex">전시/박람회 목록</a> 
				<a class="dropdown-item" href="exhibitPlan.ex?day=<%=day%>">전시/박람 예정목록</a> 
				<a class="dropdown-item" href="reserve.ex">예약방법</a>
			</div>
			<div class="col">회원페이지</div>
			<div class="col">
				<a class="dropdown-item" href="info.me">내정보</a>
				<c:choose> <c:when test="${sessionScope.loginId==null }">
	            <a class="dropdown-item" href="loginForm.me">회원정보수정</a>
	            </c:when>
	            <c:otherwise>
	            <a class="dropdown-item" href="update.me?num=${loginInfo.num}">회원정보수정</a>
	            </c:otherwise>
	            </c:choose>
				<a class="dropdown-item" href="order.re">구매내역</a>
				<a class="dropdown-item" href="list.inq?whatColumn=id&keyword=${sessionScope.loginId}&mylist=1">문의내역</a>
			</div>
			<div class="col">고객센터</div>
			<div class="col">
				<a class="dropdown-item" href="list.nt">공지사항</a>
				<a class="dropdown-item" href="list.qna">자주묻는질문</a>
				<a class="dropdown-item" href="list.inq">1:1문의</a>
			</div>
		</div>
	</nav>
	
	<!-- pc 네비 메뉴바 -->
	<nav align="center" class="d-none d-md-block" style="position:relative;">
		<div class="navtitle row cursor bg-primary m-auto">
			<div class="col">회사소개</div>
			<div class="col">전시·박람</div>
			<div class="col">회원페이지</div>
			<div class="col">고객센터</div>
		</div>
		
		<div class="navmenu row bg-primary m-auto" style="position: absolute;">
			<div class="col navmenues">
				<a class="dropdown-item" href="info.com">회사소개</a>
				<a class="dropdown-item" href="location.com">찾아오시는길</a>
				<a class="dropdown-item" href="ceo.com">대표이사</a>
			</div>
			<div class="col navmenues">
				<a class="dropdown-item" href="userExhibit.ex">전시/박람회 목록</a> 
				<a class="dropdown-item" href="exhibitPlan.ex?day=<%=day%>">전시/박람 예정목록</a> 
				<a class="dropdown-item" href="reserve.ex">예약방법</a>
			</div>
			<div class="col navmenues">
				<a class="dropdown-item" href="info.me">내정보</a>
				<c:choose> <c:when test="${sessionScope.loginId==null }">
	            <a class="dropdown-item" href="loginForm.me">회원정보수정</a>
	            </c:when>
	            <c:otherwise>
	            <a class="dropdown-item" href="update.me?num=${loginInfo.num}">회원정보수정</a>
	            </c:otherwise>
	            </c:choose>
				<a class="dropdown-item" href="order.re">구매내역</a>
				<a class="dropdown-item" href="list.inq?whatColumn=id&keyword=${sessionScope.loginId}&mylist=1">문의내역</a>
			</div>
			<div class="col w-25">
				<a class="dropdown-item" href="list.nt">공지사항</a>
				<a class="dropdown-item" href="list.qna">자주묻는질문</a>
				<a class="dropdown-item" href="list.inq">1:1문의</a>
			</div>
		</div>
	</nav>
</header>

<!-- 스크립트 -->
<script>
	$(document).ready(function(){
		$(".navmenu").hide();
		$(".navtitle").click(function(){
			$(".navmenu").fadeToggle();
	    });
	  }); 
</script>
<style>
	.cursor{cursor: pointer;}
	.navtitle{
		height: 50px;
		width: 100%;
		padding-top: 10px;
		color: white;
		font-size: 18px;
		font-family: "맑은 고딕";
	}
	.navmenu{
		height: 160px;
		width: 100%;
		padding-top: 5px; padding-bottom: 15px;
		color: white;
		font-size: 16px;
		font-family: "맑은 고딕";
		z-index: 100;
	}
	.navmenues{
		border-right: 0.5px solid;
		border-right-color: #7b8a8b;
		width: 25%;
	}
</style>

<!-- 네비 메뉴바 -->
<%-- <div align="center">
<nav class="navbar navbar-expand navbar-dark bg-primary mt-3" style="height:30px">
	<a class="navbar-brand" href="#"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav text-center m-auto">
			<li class="nav-item dropdown mx-5">
				<a class="nav-link dropdown-toggle afont" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">회사소개</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="info.com">회사소개</a>
					<a class="dropdown-item" href="location.com">찾아오시는길</a>
					<a class="dropdown-item" href="ceo.com">대표이사</a>
				</div>
			</li>

			<li class="nav-item dropdown mx-5">
				<a class="nav-link dropdown-toggle afont" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">전시·박람</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="userExhibit.ex">전시/박람회 목록</a> 
					<a class="dropdown-item" href="exhibitPlan.ex?day=<%=day%>">예정 프로그램</a> 
					<a class="dropdown-item" href="reserve.ex">예약방법</a>
				</div>
			</li>

			<li class="nav-item dropdown mx-5">
				<a class="nav-link dropdown-toggle afont" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">회원페이지</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="info.me">내정보</a>
					<c:choose>
					<c:when test="${sessionScope.loginId==null }">
            						<a class="dropdown-item" href="loginForm.me">회원정보수정</a>
            					</c:when>
            					<c:otherwise>
            						<a class="dropdown-item" href="update.me?num=${loginInfo.num}">회원정보수정</a>
            					</c:otherwise>
            					</c:choose>
					<a class="dropdown-item" href="order.re">구매내역</a>
					<a class="dropdown-item" href="list.inq?whatColumn=id&keyword=${sessionScope.loginId}&mylist=1">문의내역</a>
				</div>
			</li>
			
			<li class="nav-item dropdown mx-5">					
				<a class="nav-link dropdown-toggle afont" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="list.nt">공지사항</a>
					<a class="dropdown-item" href="list.qna">자주묻는질문</a>
					<a class="dropdown-item" href="list.inq">1:1문의</a>
				</div>
			</li>
		</ul>
	</div>
</nav>
</div> --%>