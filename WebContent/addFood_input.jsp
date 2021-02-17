<%@ page import="com.yoon.ha.FoodLogDao" %>
<%@ page import="com.yoon.ha.FoodLogVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! // 선언부 - 필드, 메소드 선언
%>
<%
// _service() 메소드 내부
// 클라이언트 HTML)에서 전달한 파라미터 값을 받는다.
// 파라미터 값을 이용해서 MemberVo객체 생성
// MemberVo객체를 MemberDao의 insert()에 전달한다.
// list.jsp로 redirect한다.

String fname = request.getParameter("fname");
String store = request.getParameter("store");
String price = request.getParameter("price");
String star = request.getParameter("star");
String date = request.getParameter("date");
String type = request.getParameter("type");
String comment = request.getParameter("comment");
String pfile = request.getParameter("pfile");

FoodLogVo vo = new FoodLogVo(0, fname, store, price, star, date, type, comment, pfile);
System.out.println(vo.toString());
FoodLogDao.insert(vo);

// 처리가 완료되면 list.jsp로 이동한다.
response.sendRedirect("list.jsp");
%>