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
<div class="border-bottom border-secondary mt-5 pb-2"><h5 class="text-primary"><b>공지사항</b></h5></div>
<br>
	<form:form commandName="notice" action="write.nt" method="post">
		<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control" name="title" id="title" value="${notice.title}" placeholder="제목을 입력하세요">
			<form:errors cssClass="err" path="title"/>
		</div>
		
		<label for="imp" class="form-label">공지사항 중요도</label> <br>
		<div class="form-check" style="margin-left: 20px">
			<input class="form-check-input" type="radio" name="imp" id="imp1" value="0" checked>
			<label class="form-check-label" for="imp1">일반</label>
		</div>
		<div class="form-check" style="margin-left: 20px">
			<input class="form-check-input" type="radio" name="imp" id="imp2" value="1"
			<c:if test="${notice.imp==1}">checked</c:if>>
			<label class="form-check-label" for="imp2">중요</label>
		</div>
	
		<div class="mb-3" style="margin-top: 20px">
			<label for="content" class="form-label">내용</label>
 			<textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요" rows="10">${notice.content}</textarea>
			<form:errors cssClass="err" path="content"/>
		</div>
		
		<button type="submit" class="btn btn-secondary btn-sm">등록하기</button>
	</form:form>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>