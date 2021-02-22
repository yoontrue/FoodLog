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
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

td {
	text-align: center;
	vertical-align: center;
	margin: 0px;
	padding: 8px;
	border-spacing: 0px;
}

.content1 { /* 날짜, 가게이름등 큰타이틀*/
	font-weight:bold;
	width: 100px;
	height: 25px;
	margin: 0px;
	padding: 0px;
	border-spacing: 0px;
	text-align:left;
	padding-left:5px;
}

.content2 { /* 보여질 값들 */
	width: 300px;
	height: 20px;
	font-size: 15px;
	margin: 0px;
	padding: 0px;
	border-spacing: 0px;
}
.contentarea { /* 후기 textarea */
	width: 700px;
	height: 200px;
	margin: 0px;
	padding: 0px;
	letter-spacing: 0px;
}
.btnstyle { /* 전체보기, 수정, 삭제 버튼*/
	 width:75px; 
	 height:35px;
	 padding: 6px;
	 font-size:14px; 
	 border-radius:15px;
	 vertical-align:center;
	 margin:0 5px 0 0;
}
div {
	margin: 8px; 
}
.container {
  width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;
}

.container::after {
  width: 50%;
  height: 100%;
  content: "";
  background: url("./pic/back.jpg");
  background:attachment;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.5;
  border:1px solid black;
  background-size:contain;
 
}
.all{
margin:0px;
}
</style>

</head>
<body class="all">
<div class="container">
<%
int no = Integer.parseInt(request.getParameter("no"));
FoodLogVo food = FoodLogDao.selectOne(new FoodLogVo(no));
String imgsrc = "pic/" + food.getPfile();
%>
	<table id="all" style="text-align: center;">		
		<tr><!-- 파일 불러오기 -->
			<td width="200" height="200">
				<img src="<%=imgsrc %>" alt="<%=imgsrc %>" width="250">
			</td>		
			<td width="480" height="200" align="center">
				
				<table><!-- 상세 테이블 생성 -->
					<tr>
						<td class="content1">음식이름 🍭</td>
						<td style="text-align: center; font-size: 15px;"><%=food.getFname() %>
						</td>
					</tr>
					<tr>
						<td class="content1">가게이름🍭</td>
						<td class="content2"><%=food.getStore() %></td>
					</tr>
					<tr>
						<td class="content1">종류🍭</td>
						<td class="content2"><%=food.getType() %></td>
					</tr>
					<tr>
						<td class="content1">날짜</td>
						<td class="content2"><%=food.getDate() %></td>
					</tr>
					<tr>
						<td class="content1">가격🍭</td>
						<td class="content2"><%=food.getPrice() %></td>
					</tr>
					<tr>
						<td class="content1">별점🍭</td>
						<td class="content2">
							<%
							int star = Integer.parseInt(food.getStar());
							for(int i=0;i<star;i++){
							%>
							⭐
							<%
							}
							%>
						</td>
					</tr>
				</table> <!-- 상세 테이블 마침 -->
			</td>
		</tr>
		<tr><!-- 후기 -->
			<td colspan="2" class="contentarea"><%=food.getComment() %></td>
		</tr>
		<!-- 전체보기, 저장하기 버튼 -->
			<tr>
				<td colspan="2" style="text-align: right;">
					<button class="btnstyle" onclick="location.href='modify.jsp?no=<%=food.getNo() %>'">수정</button>
					<button class="btnstyle" onclick="location.href='delete.jsp?no=<%=food.getNo() %>'">삭제</button>
					<button class="btnstyle" onclick="location.href='list.html'">전체보기</button>
				</td>
			</tr>
		</table><!-- 테이블 마침 -->
	</div>	
</body>
</html>