<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="com.yoon.ha.FoodLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no = Integer.parseInt(request.getParameter("no"));
FoodLogDao.delete(new FoodLogVo(no));
%>
<script>
alert('삭제되었습니다.');
</script>
<%
response.sendRedirect("list.html");
%>