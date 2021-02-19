<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath = request.getRealPath("pic");

int size = 10*1024*1024;
// 최대 10mb
MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

Enumeration<?> files=multi.getFileNames();

String file = (String)files.nextElement();
String pfile = multi.getFilesystemName(file);
String orifilename = multi.getOriginalFileName(file);

String fname = multi.getParameter("fname");
String store = multi.getParameter("store");
String price = multi.getParameter("price");
String star = multi.getParameter("star");
String date = multi.getParameter("date");
String type = multi.getParameter("type");
String comment = multi.getParameter("comment");
/* String pfile = multi.getParameter("pfile"); */

FoodLogVo vo = new FoodLogVo(0, fname, store, price, star, date, type, comment, pfile);
System.out.println(vo.toString());
System.out.println(uploadPath);
FoodLogDao.insert(vo);

%>