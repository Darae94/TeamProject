<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/user.jsp" %>

<style>
	.container #daumRoughmapContainer1618679665271 {
		width:100%;
	}
</style>

<div class="container">
	<h3 align="center" style="margin:20px 0">찾아오시는 길</h3>
	
	<table class="table">
		<tr>
			<th class="table-primary">주소</th>
			<td>서울 마포구 신촌로 176 중앙빌딩 5층</td>
		</tr>
		<tr>
			<th class="table-primary">대표번호</th>
			<td>02-313-1711</td>
		</tr>
	</table>
	<!-- * 카카오맵 - 지도퍼가기 -->
	<!-- 1. 		지도 노드 -->
	<div id="daumRoughmapContainer1618679665271" class="root_daum_roughmap root_daum_roughmap_landing"></div>
	
	<!--
		2. 설치 스크립트
		* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
	-->
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	
	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1618679665271",
			"key" : "25eog",
			"mapWidth" : "100%",
			"mapHeight" : "500"
		}).render();
	</script>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>
