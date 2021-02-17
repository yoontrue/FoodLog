<%@ page import="com.yoon.ha.FoodLogDao" %>
<%@ page import="com.yoon.ha.FoodLogVo" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// request에서 데이터를 가져와
String fname = request.getParameter("fname");
String store = request.getParameter("store");
String price = request.getParameter("price");
String star = request.getParameter("star");
String date = request.getParameter("date");
String type = request.getParameter("type");
String comment = request.getParameter("comment");
String pfile = request.getParameter("pfile");
// vo들을 Dao수정에 담는다.
// 클래스 객체를 생성할 땐 생성자를 호출하는데 new 라는 키워드로 호출한다.
// FoodLogVo vo = new FoodLogVo(); >> 안에 아무것도 들어가지 않았으므로 기본 생성자를 호출한것
// new FoodLogVo(fname, store, price, star, date, type, comment, pfile) >> 안에 변수들이 들어갔으므로 기본이 아닌 생성자를 호출한것 (개발자가 만든 것)
FoodLogDao.modify(new FoodLogVo(0, fname, store, price, star, date, type, comment, pfile));

// 수정한후 상세보기로 넘어간다. 수정한값만 보인다. 
// 수정페이지에 목록, 보기, 삭제가 있다.
response.sendRedirect("show.jsp?no="+0);
%>