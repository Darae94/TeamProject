<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/admin.jsp" %>

<div class="container">
<div class="border-bottom border-secondary mt-5 pb-2"><h5 class="text-primary"><b>1:1문의</b></h5></div><br>

	<div class="border-bottom border-secondary"><h5>질문</h5></div>
	
	<div class="row border-bottom ml-1 mr-1">
		<div class="col bg-light text-center py-2"><b>제목</b></div>
		<div class="col-10 border-left py-2">${inq.title}</div>
	</div>
	
	<div class="row border-bottom ml-1 mr-1">
		<div class="col bg-light text-center py-2"><b>문의유형</b></div>
		<div class="col-10 border-left py-2">${inq.category}</div>
	</div>
	
	<div class="row border-bottom ml-1 mr-1">
		<div class="col bg-light text-center py-2"><b>작성자</b></div>
		<div class="col-10 border-left py-2">${inq.id}</div>
	</div>
	
	<fmt:formatDate value="${inq.regdate}" var="regdate" type="Date" pattern="yyyy-MM-dd HH:mm"/>
	<div class="row border-bottom ml-1 mr-1">
		<div class="col bg-light text-center py-2"><b>작성일</b></div>
		<div class="col-10 border-left py-2">${regdate}</div>
	</div>
	
	<div class="m-3" style="white-space:pre">${inq.content}</div>	
	<hr>
	
	<div class="border-bottom border-secondary mt-5"><h5>관리자 답변</h5></div>
	<form action="reply.inq" method="post">
		<input type="hidden" name="id" value="penguin">
		<input type="hidden" name="pw" value="${inq.pw}">
		<input type="hidden" name="category" value="답변">
		<input type="hidden" name="ref" value="${inq.ref}">
		<input type="hidden" name="restep" value="${inq.restep}">
		<input type="hidden" name="pageNumber" value="${pageNumber}">
		<input class="form-control mt-3" type="text" name="title" value="[답변] 문의해주신 글에 대한 답변입니다.">
		<textarea class="form-control mt-3" rows="15" name="content" placeholder="답변 내용을 입력해주세요" required></textarea>
		<p align="center"><input class="btn btn-primary btn-lg rounded-0 mt-3" type="submit" value="답변등록"></p>
	</form>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>