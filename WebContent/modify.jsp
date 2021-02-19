<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="com.yoon.ha.FoodLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식수정 페이지</title>
<script src="http://code.jquery.com/jquery.js"></script>

<script>
	$(function() {
		$("#move_list").click(function() {
			location.href="list.html";
		});
		
		// id가 btnSave인 input을 클릭한다.
		$("#food_modify").submit(function() {
			// id가 food_form인 form을 불러온다.
			event.preventDefault();
			var form = $('#food_modify')[0];	// 값을 가져와서 저장하는 건 변수 = 값 형식밖에 없다
			
			// form 안에 fname 유효성 체크
			if (form.fname.value == "") {
				alert("음식이름은 필수 입력 항목입니다!");
				$(form.fname).focus();
				return;
			}
			
			// form 안에 store 유효성 체크
			if (form.store.value == "") {
				alert("가게이름은 필수 입력 항목입니다!");
				$(form.store).focus();
				return;
			}
			
			// form 안에 Type 유효성 체크
			if (form.type.value == "") {
				alert("음식 종류는 필수 입력 항목입니다!");
				$(form.type).focus();
				return;
			}
			
			// form 안에 star 유효성 체크
			if (form.star.value == "") {
				alert("별점은 필수 입력 항목입니다!");
				$(form.star).focus();
				return;
			}			
			/**
			 * url : 전송할 서버 주소
			 * type : 전송방식 (get/post)
			 * data : 전송할 데이터 ※ form.serialize() ? >> form 안에 데이터를 json 형태로 변환
			 * success : 전송 후, 응답이 성공일 경우 수행할 기능 작성 
			 * error : 전송 후, 응답이 실패일 경우 수행할 기능 작성
		     */
			$.ajax({
				url : "modify_input.jsp"
			  , type : "post"
			  , data : $('#food_modify').serialize()
			  , success : function(data) {
					
					// 성공 시, show.jsp 로 이동한다.
					var no = $("#no").val();
					alert("정상적으로 수정되었습니다." + no);
					location.href = "show.jsp?no=" + no;
			  }
		      , error : function(xhr, status) {
		    	  alert("오류가 발생했습니다. :: " + status);
		      }
			});
		});
	});
</script>
<style type="text/css">

.btn { /* 전체보기 버튼*/
	padding: 6px;
	font-size: 15px;
	
}
table, tr, td {
/*	border: 1px solid red; */
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

td {
	text-align: center;
	vertical-align: center;
	margin: 0px;
	padding: 6px;
	border-spacing: 0px;
}

.menu { /* 음식이름, 전체보기 테이블 */
	font-weight:bold;
	width: 100px;
	height: 25px;
	margin: 0px;
	padding: 0px;
	border-spacing: 0px;
	text-align:left;
	padding-left:5px;
}

.in1 { /* 텍스트필드 */
	width: 300px;
	height: 20px;
	font-size: 15px;
	margin: 0px;
	padding: 0px;
	border-spacing: 0px;
}

.후기 { /* 텍스트 에어리어*/
	width: 700px;
	height: 200px;
	margin: 0px;
	padding: 0px;
	letter-spacing: 0px;
}

.option {
	text-align-last:center; 
}

div {
/*	margin: 50px; */
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

</style>
</head>
<body> 
	<div class="container">
		<form id="food_modify" method="post" enctype="multipart/form-data" >
			<% //no
			int no = Integer.parseInt(request.getParameter("no"));
			FoodLogVo food = FoodLogDao.selectOne(new FoodLogVo(no));
			String type = food.getType();
			String comment = food.getComment();
			String star = food.getStar();	
			%>	
			<input type="hidden" id="no" name="no" value="<%=food.getNo()%>" />
			
			<!-- 테이블 생성 -->
			<table id="all" style="text-align: center;">		
				<tr><!-- 파일 불러오기 -->
					<td width="200" height="200">
							<img src="pic/<%=food.getPfile() %>" alt="<%=food.getPfile() %>" width="250"/>
					</td>
					<td width="480" height="200" align="center">
						<table>
							<!-- 상세 테이블 생성 -->
							<tr>
								<td class="menu">음식이름 🍭 </td>
								<td>
									<input type="text" class="in1" id="fname" name="fname" value="<%=food.getFname()%>" />
								</td>
							</tr>
							<tr>
								<td class="menu">가게이름 🍭</td>
								<td><input type="text" class="in1" id="store" name="store" value="<%=food.getStore()%>"></td>
							</tr>
							<tr>
								<td class="menu">종류 🍭</td>
								<td><select class="option" id="type" name="type" style=" width:100%" ><%=food.getType()%>
										<option value="">==선택하세요==</option>	
										<% if ("한식".equals(type)){ %>
	                          			 <option value="한식" selected>한식</option>
	                           			<% } else { %>
										<option value="한식">한식</option>
										<% } %>
										
										<% if ("중식".equals(type)) { %>
										<option value="중식" selected>중식</option>
										<% } else { %>
										<option value="중식">중식</option>
										<% } %>
										
										<% if ("일식".equals(type)) { %>
										<option value="일식" selected>일식</option>
										<% } else { %>
										<option value="일식">일식</option>
										<% } %>
										
										<% if ("분식".equals(type)) { %>
										<option value="분식" selected>분식</option>
										<% } else { %>
										<option value="분식">분식</option>
										<% } %>
										
										<% if ("음료".equals(type)) { %>
										<option value="음료" selected>음료</option>
										<% } else { %>
										<option value="음료">음료</option>
										<% } %>
										
										<% if ("디저트".equals(type)) { %>
										<option value="디저트" selected>디저트</option>
										<% } else { %>
										<option value="디저트">디저트</option>
										<% } %>
										
										<% if ("동남아".equals(type)) { %>
										<option value="동남아" selected>동남아</option>
										<% } else { %>
										<option value="동남아">동남아</option>
										<% } %>
										
										<% if ("홈쿠킹".equals(type)) { %>
										<option value="홈쿠킹" selected>홈쿠킹</option>
										<% } else { %>
										<option value="홈쿠킹">홈쿠킹</option>
										<% } %>
										
										<% if ("기타".equals(type)) { %>
										<option value="기타" selected>기타</option>
										<% } else { %>
										<option value="기타">기타</option>
										<% } %>
									</select>
								</td>
							</tr>
							<tr>
								<td class="menu">날짜</td>
								<td><input type="text" class="in1" id="date" name="date" value="<%=food.getDate()%>"
									placeholder="년 월 일 을 입력하세요. 예)20210208"></td>
							</tr>
							<tr>
								<td class="menu">가격</td>
								<td><input type="text" class="in1" id="price" name="price" value="<%=food.getPrice()%>"></td>
							</tr>
							<tr>
								<td class="menu">별점 🍭</td>
								<td>
									<% if ("1".equals(star)) { %>
										<input type="radio" name="star" value="1" checked> <label for="1">1점</label>
									<% } else { %>
										<input type="radio" name="star" value="1"> <label for="1">1점</label>
									<% } %>
									<% if ("2".equals(star)) { %>
										<input type="radio" name="star" value="2" checked> <label for="2">2점</label>
									<% } else { %>
										<input type="radio" name="star" value="2"> <label for="2">2점</label>
									<% } %>
									<% if ("3".equals(star)) { %>
										<input type="radio" name="star" value="3" checked> <label for="3">3점</label>
									<% } else { %>
										<input type="radio" name="star" value="3"> <label for="3">3점</label>
									<% } %>
									<% if ("4".equals(star)) { %>
										<input type="radio" name="star" value="4" checked> <label for="4">4점</label>
									<% } else { %>
										<input type="radio" name="star" value="4"> <label for="4">4점</label>
									<% } %>
									<% if ("5".equals(star)) { %>
										<input type="radio" name="star" value="5" checked> <label for="5">5점</label>
									<% } else { %>
										<input type="radio" name="star" value="5"> <label for="5">5점</label>
									<% } %>
								</td>
							</tr>
						</table> <!-- 상세 테이블 마침 -->
					</td>
				</tr>
				<tr><!-- 후기 -->
					<td colspan="2"> 
						<textarea id="comment"  name="comment" rows="15" cols="95" style="width: 70%"><%=food.getComment() %></textarea>
					</td>
				</tr>
				<!-- 전체보기, 수정버튼 -->
				<tr>
					<td colspan="2" style="text-align: right;">
					 	<input type="submit" id="btnSave" value="수정하기" />
						<input type="button" id="move_list" name="show_list" value="전체보기"/>
					</td>
				</tr>
			</table> <!-- 테이블 마침 -->
		</form>	
	</div>
</body>
</html>