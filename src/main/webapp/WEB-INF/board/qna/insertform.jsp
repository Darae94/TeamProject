<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/admin.jsp" %>
<style type="text/css">
	.err{
		color: red;
		font-size: 13px;
	}
</style>

<div class="container">
<h2 class="mt-4">자주묻는질문</h2>
<hr>
	<form:form commandName="qna" action="insert.qna" method="post">
		<div class="mb-3">
			<label for="category" class="form-label">카테고리</label> <br>
			<select class="form-select" name="category" id="category">
			  <option value="">카테고리 선택</option>
			  <option value="회원가입">회원가입</option>
			  <option value="전시관련">전시관련</option>
			  <option value="티켓구매/발권">티켓구매/발권</option>
			  <option value="취소/환불">취소/환불</option>
			  <option value="기타">기타</option>
			</select>
			<br> <form:errors cssClass="err" path="category"/>
		</div>
		
		<div class="mb-3">
			<label for="question" class="form-label">질문</label>
			<input type="text" class="form-control" name="question" id="question" value="${qna.question}" placeholder="질문을 입력하세요">
			<form:errors cssClass="err" path="question"/>
		</div>
	
		<div class="mb-3" style="margin-top: 20px">
			<label for="answer" class="form-label">답변</label>
 			<textarea class="form-control" name="answer" id="answer" placeholder="답변을 입력하세요" rows="5">${qna.answer}</textarea>
			<form:errors cssClass="err" path="answer"/>
		</div>
		
		<p align="center">
			<button type="submit" class="btn btn-secondary" onClick="location.href='insert.qna'">등록하기</button>
		</p>
	</form:form>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>