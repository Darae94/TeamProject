<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/user.jsp" %>

<style>
	th.info_title {
		text-align: center;
		vertical-align: middle;
		width: 150px;
		height: 150px;
		border-radius: 50%;
		border: none;
		font-size: x-large;
	}
	
	table td.info_text {
		border: none;
		vertical-align: middle;
	}
</style>

<div class="container">
	<h3 align="center" style="margin:20px 0">회사소개</h3>
	
	<table class="table">
		<tr>
			<th class="table-primary" width="15%">OnShow</th>
			<td colspan=2>전시/박람회를 코로나를 조심하며 안전하고 빠르게 즐겨보세요!</td>
		</tr>
		<tr>
			<td colspan=3></td>
		</tr>
		<tr>
			<td class="info_text"></td>
			<th class="table-secondary info_title">30명</th>
			<td class="info_text">
				<b>시간당 30명 이하만 입장 가능</b><br>
				코로나로 인해 한 장소에 많은 인원의 입장을 제한합니다.
				개인 안전 수칙을 잘 지킵시다.
			</td>
		</tr>
		<tr>
			<td colspan=3 class="info_text"></td>
		</tr>
		<tr>
			<td class="info_text"></td>
			<th class="table-info info_title">빠른 입장</th>
			<td class="info_text">
				<b>현장 구매가 아닌 온라인 구매</b><br>
				현장에서 구매하기 위한 긴 대기 시간을 축소해드립니다.
				관람 예약 시간에 방문하여 즐기시길 바랍니다.
			</td>
		</tr>
	</table>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>
