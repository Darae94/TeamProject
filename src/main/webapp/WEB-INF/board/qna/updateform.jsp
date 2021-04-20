<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/admin.jsp" %>

<style type="text/css">
	.nav-border{
		height: 45px; font-weight: bold; padding-top: 10px;
		border-bottom: 1px solid grey; border-top: 1px solid grey;
		background-color: #EAEAEA;
	}
	.err{
		color: red;
		font-size: 13px;
	}
</style>

<div class="container">
<div class="border-bottom border-secondary mt-5 pb-2"><h5 class="text-primary"><b>자주묻는질문</b></h5></div>
<br>
	<% String [] categories = {"전체", "회원가입", "전시관련", "티켓구매/발권", "취소/환불", "기타"}; %>
	
	<!-- Qna 네비게이션 바 -->
	<div class="" align="center">
		<c:forEach items="<%=categories%>" var="cats">
			<button type="button" class="btn btn-outline-success mr-2" onclick="location.href='list.qna?category=${cats}'">${cats}</button>	  
		</c:forEach>
	</div>
	
	<!-- Qna 메뉴 -->
	<br>
	<div class="row text-center nav-border">
		<div class=col>번호</div>
		<div class=col-2>카테고리</div>
		<div class=col-8>질문/답변</div>
		<div class=col></div>
	</div>

	<!-- Qna 리스트 -->
	<c:set value="${qna_update}" var="qUpdate"/>
	<c:forEach items="${qna_lists}" var="qLists">
		<c:choose>
		<c:when test="${qLists.no==qUpdate.no}">
		<!-- 수정폼 -->
		<form:form commandName="qna" action="update.qna" method="post">
		<div class="row border-bottom text-center pt-3">
  			<div class=col>${qUpdate.no}</div>
  			<div class=col-2>
		  		<select class="form-select" name="category">
				  <option value="">카테고리 선택</option>
				  <option value="회원가입" <c:if test="${qUpdate.category=='회원가입'}">selected</c:if>>회원가입</option>
				  <option value="전시관련" <c:if test="${qUpdate.category=='전시관련'}">selected</c:if>>전시관련</option>
				  <option value="티켓구매/발권" <c:if test="${qUpdate.category=='티켓구매/발권'}">selected</c:if>>티켓구매/발권</option>
				  <option value="취소/환불" <c:if test="${qUpdate.category=='취소/환불'}">selected</c:if>>취소/환불</option>
				  <option value="기타" <c:if test="${qUpdate.category=='기타'}">selected</c:if>>기타</option>
				</select>
				<p><form:errors cssClass="err" path="category"/></p>
  			</div>
  			<div class="col-8 pl-4 pb-3" align="left">
  				<input type="text" class="form-control" name="question" value="${qUpdate.question}"><br>
  				<form:errors cssClass="err" path="question"/>

  				<textarea class="form-control" name="answer" rows="5">${qUpdate.answer}</textarea><br>
  				<form:errors cssClass="err" path="answer"/>

  				<button type="submit" class="btn btn-primary btn-sm">수정</button>
  			</div>
  			<div class=col>▼</div>
  			</div>
  			<input type="hidden" name="no" value="${qUpdate.no}">
  			<input type="hidden" name="pageNumber" value="${pageInfo.pageNumber}">
  			</form:form>
		</c:when>
		
		<c:otherwise>
		<div class="row border-bottom text-center pt-3">
  			<div class=col>${qLists.no}</div>
  			<div class=col-2>${qLists.category}</div>
  			<div class="col-8 pl-4" align="left">
  				<p class="title" id="title">${qLists.question}</p>
  				<p id="hide">${qLists.answer}</p>
  				<c:if test="${sessionScope.loginId=='penguin'}">
  				<p>
  					<button type="button" style="width:53px; height:30px; font-size: 12px;" class="btn btn-light" onClick="location.href='update.qna?no=${qLists.no}&pageNumber=${pageInfo.pageNumber}'">수정</button>
					<button type="button" style="width:53px; height:30px; font-size: 12px;" class="btn btn-light" onClick="location.href='delete.qna?no=${qLists.no}&pageNumber=${pageInfo.pageNumber}'">삭제</button>
  				</p>
  				</c:if>
  			</div>
  			<div class=col>▼</div>
		</div>
		</c:otherwise>
		
		</c:choose>
	</c:forEach>
	
	<!-- 관리자용 버튼: 수정/삭제/추가 -->
	<br> 
	<p align="right">
		<button type="button" class="btn btn-success rounded-0" onClick="location.href='insert.qna'">추가하기</button>
	</p>

	<!-- 페이징 설정 -->
	<div>
	  <ul class="pagination justify-content-center">${pageInfo.pagingHtml}</ul>
	</div>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>