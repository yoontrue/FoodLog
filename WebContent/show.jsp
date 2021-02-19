<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="com.yoon.ha.FoodLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보기</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function golist(){
	location.href = "list.html";
}
</script>

<style type="text/css">
table, tr, td {
	border : 1px solid red;
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	border-spacing: 0;
}

td {
	/* border: 1px solid red; */	/* 테이블 가시적으로 확인하기 위함이니 나중에 지울것! */
	text-align: center;
	vertical-align: center;
	padding: 6px;
}

.content1 {
	width: 100px;
}

.content2 {
	width: 400px;
	background-color: rgb(230, 230, 230);
}
.contentarea {
	width: 900px;
	height: 100px;
	background-color: rgb(230, 230, 230);
}
.btnstyle {
	 width:70px; 
	 height:30px; 
	 font-size:15px; 
	 border-radius:15px;
	 vertical-align:center;
	 margin:0 5px 0 0;
}
div {
	margin: 50px;
}
</style>

</head>
<body>
<div>
<%
int no = Integer.parseInt(request.getParameter("no"));
FoodLogVo food = FoodLogDao.selectOne(new FoodLogVo(no));
String imgsrc = "pic/" + food.getPfile();
%>
	<table>
		<tr>
			<td width="300" style="text-align: center; font-size: 20px;">
				<b><%=food.getFname() %></b> 
			</td>
			<td width="600" style="text-align: right;">
				<button class="btnstyle" onclick="location.href='list.html'">전체보기</button>
			</td>
		</tr>
	</table>	
		
	<table style="text-align: center;">
		<tr>
			<td width="300" height="300"><img src="<%=imgsrc %>" alt="<%=imgsrc %>" width="250"/></td>
			<td width="600" height="300">
				<table>
					<tr>
						<td class="content1">날짜</td>
						<td class="content2"><%=food.getDate() %></td>
					</tr>
					<tr>
						<td class="content1">가게이름</td>
						<td class="content2"><%=food.getStore() %></td>
					</tr>
					<tr>
						<td class="content1">종류</td>
						<td class="content2"><%=food.getType() %></td>
					</tr>
					<tr>
						<td class="content1">가격</td>
						<td class="content2"><%=food.getPrice() %></td>
					</tr>
				</table>
		</td>
		</tr>
	</table>

	<table>
		<tr>
			<td class="contentarea"><%=food.getComment() %></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td width="300" style="text-align: left;">
				별점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				int star = Integer.parseInt(food.getStar());
				for(int i=0;i<star;i++){
				%>
				★  
				<%
				}
				%>
			</td>
			<td width="600" style="text-align: right;">
				<button class="btnstyle" onclick="location.href='modify.jsp?no=<%=food.getNo() %>'">수정</button>
				<button class="btnstyle" onclick="location.href='delete.jsp?no=<%=food.getNo() %>'">삭제</button>
			</td>
		</tr>
	</table>	
</div>	
</body>
</html>