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
		// id가 btnSave인 input을 클릭한다.
		$("#food_modify").submit(function() {
			// id가 food_form인 form을 불러온다.
			event.preventDefault();
			var form = $('#food_modify')[0];
			
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
			  , data : $('#food_form').serialize()
			  , success : function(data) {
					alert("정상적으로 수정되었습니다.");
					
					$("#fname").val("").focus();
					$("#store").val("");
					$("#price").val("");
					$("input:radio[name='star']").prop('checked', false);
					$("#date").val("");
					$("#type").val("");
					$("#pfile").val("");
					$("#comment").val("");
			  }
		      , error : function(xhr, status) {
		    	  alert("오류가 발생했습니다. :: " + status);
		      }
			});
		});
	});
</script>
<style type="text/css">

table, tr, td {
	border: 1px solid red;
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

td {
	text-align: center;
	margin: 0px;
	padding: 6px;
	border-spacing: 0px;
}

.menu { /* 음식이름, 전체보기 테이블 */
	width: 100px;
	height: 25px;
	margin: 0px;
	padding: 0px;
	border-spacing: 0px;
}

.in1 { /* 텍스트필드 */
	width: 400px;
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
	background-color: #eeb5b8;
}

.option {
	text-align-last:center; 
}

div {
	margin: 50px;
}

</style>
</head>
<body>
	<% //no
	int no = Integer.parseInt(request.getParameter("no"));
	FoodLogVo food = FoodLogDao.selectOne(new FoodLogVo(no));
	String type = food.getType();
	String star = food.getStar();	
	%>

	<form id="food_modify">
		<table>
			<!-- 메뉴이름, 전체보기 테이블 -->
			<tr>

				<td width="300" style="text-align: center; font-size: 15px;">
					*메뉴이름 <input type="text" id="fname" name="fname" value="<%=food.getFname()%>" style="font-size:15px; width:180px;">
				</td>

				<td width="600" style="text-align: right;">
					<button class="btn" name="show_list" onClick="location='list.jsp'">
					전체보기</button>
				</td>
			</tr>
		</table>

		<table style="text-align: center;">
			<!-- 테이블 생성 -->
			<tr>
				<td width="300" height="300">
				<!-- 파일 불러오기 -->
					<form action="upload.jsp" method="post" enctype="multipart/form-data">
						<img src="pic/<%=food.getPfile() %>" alt="<%=food.getPfile() %>" width="250"/>
					</form>
				</td>
				<td width="600" height="300" align="center">
					<table>
						<!-- 상세 테이블 생성 -->
						<tr>
							<td class="menu">날짜</td>
							<td><input type="text" class="in1" id="date" name="date" value="<%=food.getDate()%>"
								placeholder="년 월 일 을 입력하세요. 예)20210208"></td>
						</tr>
						<tr>
							<td class="menu">*가게이름</td>
							<td><input type="text" class="in1" id="store" name="store" value="<%=food.getStore()%>"></td>
						</tr>
						<tr>
							<td class="menu">*종류</td>
							<td>
								<select class="option" id="type" name="type" style="width:100%" 
								<%=food.getType()%>>
								
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

							<td class="menu">가격</td>
							<td><input type="text" class="in1" id="price" name="price" value="<%=food.getPrice()%>"></td>

						</tr>
					</table> <!-- 상세 테이블 마침 -->
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- colspan 엑셀 가로 셀병합 개념 (세로 병합은 rowspan) --> 
					<textarea id="comment" name="comment" rows="15" cols="95" style="width: 99%"></textarea>
				</td>
			</tr>
		</table>
		<!-- 테이블 마침 -->
		<!-- 별점(콤보박스), 추가버튼 -->
		<table>
			<tr>
	
				<td width="300" style="text-align: left; font-size: 15px;">*별점<br>
					
					
					<input type="radio" name="star" value="1"> <label for="1">1점</label>
					<input type="radio" name="star" value="2"> <label for="2">2점</label>
					<input type="radio" name="star" value="3"> <label for="3">3점</label>
					<input type="radio" name="star" value="4"> <label for="4">4점</label>
					<input type="radio" name="star" value="5"> <label for="5">5점</label>
					
				</td>
			
				<td width="600" style="text-align: right;">
				 	<!-- input 타입을 submit으로 변경 -->
				 	<input type="submit" id="btnSave" value="수정하기" />
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>