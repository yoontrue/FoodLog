<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yoon.ha.FoodLogDao"%>
<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private List<FoodLogVo> list;
	private JSONObject getFoodList(JspWriter out, List<FoodLogVo> searchList) throws Exception {
		list = FoodLogDao.selectAll();
		JSONArray jsArr = new JSONArray();
		JSONObject rootObj = new JSONObject();
		
		for(int i=0; i < searchList.size(); i++) {
			
			JSONObject jsObj = new JSONObject();
			
			jsObj.put("no", searchList.get(i).getNo());
			jsObj.put("fname", searchList.get(i).getFname());
			jsObj.put("store", searchList.get(i).getStore());
			jsObj.put("type", searchList.get(i).getType());
			jsObj.put("price", searchList.get(i).getPrice());
			jsObj.put("star", searchList.get(i).getStar());
			
			jsArr.put(jsObj);
		}
		rootObj.put("food_list", jsArr);
		out.println(rootObj.toString());
		return rootObj; 
	}
%>

<%
	getFoodList(out,list);
%>