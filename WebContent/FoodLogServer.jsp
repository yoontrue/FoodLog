<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private ArrayList<FoodLogVo> list = new ArrayList<FoodLogVo>();
{ // 임시로 뿌려볼 자료들... 나중에 지우고 디비연결할것!
	list.add(new FoodLogVo("돈까스김치찌개","얌샘","8000","4","20210111","분식","dongas.png","국물이 자작하니 맛있었다!"));
	list.add(new FoodLogVo("통치즈돈까스","한솥","5800","4","20210114","한식","tong.png","양이 많고 싸서 좋다."));
	list.add(new FoodLogVo("마라탕","라공방","7500","5","20210122","중식","mara.png","야채가 많아서 좋았다."));
}
%>

<%
String bangsik = request.getMethod();	// 리퀘스트 방식 구분용 변수

if("POST".equals(bangsik)) {
	FoodLogVo vo = new FoodLogVo();
	
	vo.setFname(request.getParameter("fname"));
	vo.setStore(request.getParameter("store"));
	vo.setPrice(request.getParameter("price"));
	vo.setStar(request.getParameter("star"));
	vo.setDate(request.getParameter("date"));
	vo.setType(request.getParameter("type"));
	vo.setPfile(request.getParameter("pfile"));
	vo.setComment(request.getParameter("comment"));
	
	list.add(vo);
} else {
	JSONArray jsArr = new JSONArray();
	JSONObject rootObj = new JSONObject();
	
	for(int i=0; i<list.size(); i++) {
		
		JSONObject jsObj = new JSONObject();
		
		jsObj.put("fname", list.get(i).getFname());
		jsObj.put("store", list.get(i).getStore());
		jsObj.put("price", list.get(i).getPrice());
		jsObj.put("star", list.get(i).getStar());
		jsObj.put("date", list.get(i).getDate());
		jsObj.put("type", list.get(i).getType());
		jsObj.put("pfile", list.get(i).getPfile());
		jsObj.put("comment", list.get(i).getComment());
		
		jsArr.put(jsObj);
	}
	rootObj.put("food_list", jsArr);
	out.println(rootObj.toString());
}
%>