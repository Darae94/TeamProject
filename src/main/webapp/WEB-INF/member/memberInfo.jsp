<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/user.jsp" %>    
    
<!-- memberInfo.jsp<br> -->

<script type="text/javascript">

	function goUpdate(num){
		location.href='update.me?num='+num; 
		//update.me=> MemberUpdateController
	}
</script>

<div class="container">
	<h3 align=center style="padding:20px 0">내정보(마이페이지)</h3>

	<table border="1" frame="void" class="table">
		<tr>
			<th class="table-secondary" width="30%">이름</th>
			<td>${member.name}</td>
		</tr>
		<tr>
			<th class="table-secondary">아이디</th>
			<td>${member.id}</td>
		</tr>
		<tr>
			<th class="table-secondary">나이</th>
			<td>${member.age}</td>	
		</tr>
		<tr>
			<th class="table-secondary">성별</th>
			<td>${member.gender}</td>	
		</tr>
		<tr>
			<th class="table-secondary">생년월일</th>
			<td>${member.year}년 ${member.month}월 ${member.day}일</td>
		</tr>
		<tr>
			<th class="table-secondary">이메일</th>
			<td>${member.email}</td>
		</tr>
	
		<tr>
			<th class="table-secondary">휴대폰번호</th>
			<td>${member.hp1}-${member.hp2}-${member.hp3}</td>
		</tr>
		<tr>
			<th class="table-secondary">주소</th>
			<td>${member.add1}  ${member.add2}</td>
		</tr>
		<tr>
			<th class="table-secondary">취향</th>
			<td>${member.style}</td>
		</tr>
		<tr>
			<th class="table-secondary">관심카테고리</th>
			<td>${member.cat}</td>
		</tr>
		<tr>
			<td class="table table-primary" align="center" colspan=2>
				<input class="btn btn-secondary" type="button" value="개인정보 수정" onClick="goUpdate(${loginInfo.num})">
			</td>
		</tr>
	</table>
</div>
