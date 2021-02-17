<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="com.yoon.ha.FoodLogDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체</title>


<style>
header, footer, section, table, div#foodlistarea {	/* 위치 확인 및 전체크기 맞추기용 */
		border: 1px solid blue;
		margin: 0px;
		border-radius: 0px;
		padding: 0px;
		box-sizing: border-box;
		width: 900px;
		border-spacing: 0;
}


td, th {
	border: 1px solid blue;  /* 나중에 보더 지우기 */
	box-sizing: border-box;
	width: 150px;
}
header {
	text-align: center;
}

.searchType {
	text-align-last:center; 
	font-size:15px;
}

select {
	margin:0 0 0 30px;
	width: 150px;
}

table {
	margin:0 0 30px 0;
}

tr.contents {
	text-align: center;
}

td.left {
	width: 200px;
}

td.center {
	width: 400px;
}

td.right {
	width: 300px;
}

div.right{	/* 버튼 우측 정렬 */
	text-align: right;
}

input.searchData {	/* 텍스트 필드 넓게 */
	width: 400px
}
fotter {
		clear:both;
}
.btnstyle {
	 width:70px; 
	 height:30px; 
	 font-size:15px; 
	 border-radius:15px;
	 vertical-align:center;
	 margin:0 5px 0 0;
}
form {
	margin: 50px;
}
</style>

</head>
<body>
<form>
<header>
	<h2>Food Log</h2>
</header>	

<section>
	<table>
	<tr>
		<td class="left">
			<div class="left">
					<select id="searchType" class="searchType">
						<option value="korea" selected>음식명</option>
						<option value="chinese">음식점</option>
						<option value="japanese">종류</option>
						<option value="western">가격</option>
						<option value="flour">별점</option>
						<option value="drink">날짜</option>
					</select>
			</div>
		</td>
		<td class="center">	
				<input type="text" id="searchData" class="searchData">
		</td>
		<td class="rignt">
			<div class="right">
					<button type="button" class="btnstyle" id="searchBtn">검색</button>
					<button type="button" class="btnstyle" id="list">전체보기</button>
			</div>
		</td>
	</tr>
	</table>
	
	<div id="foodlistarea">
		<!-- 전체 리스트 나올 공간 -->
		<table>
			<tr>
				<th>음식명</th>
				<th>음식점</th>
				<th>종류</th>
				<th>가격</th>
				<th>별점</th>
			</tr>
		<%
		List<FoodLogVo> list = FoodLogDao.selectAll();
		for(int i = 0; i < list.size(); i++){
		FoodLogVo food = list.get(i);
		%>
			<tr>
				<td><a href="show.jsp?no=<%=food.getNo() %>"><%=food.getFname() %></a></td>
				<td><%=food.getStore() %></td>
				<td><%=food.getType() %></td>
				<td><%=food.getPrice() %></td>
				<td>
				<%
				int star = Integer.parseInt(food.getStar());
				for(int s=0;s<star;s++){
				%>
				★  
				<%
				}
				%>
				</td>
			</tr>
		<%
		} 
		%>
		</table>
	</div>
</section>
</form>
</body>
</html>