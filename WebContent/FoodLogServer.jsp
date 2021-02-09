<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.yoon.ha.FoodLogVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private ArrayList<FoodLogVo> list = new ArrayList<FoodLogVo>();
{ // 임시로 뿌려볼 자료들... 나중에 지우고 디비연결할것!
 	list.add(new FoodLogVo("돈까스김치찌개","얌샘","8000","4","20210111","분식","dongaspng","국물이자작하니맛있었다"));
	list.add(new FoodLogVo("통치즈돈까스","한솥","5800","4","20210114","한식","tongpng","양이많고싸서좋다"));
	list.add(new FoodLogVo("마라탕","라공방","7500","5","20210122","중식","marapng","야채가많아서좋았다"));
}

private JSONObject show(JspWriter out, ArrayList<FoodLogVo> searchList) throws Exception{
	
	JSONArray jsArr = new JSONArray();
	JSONObject rootObj = new JSONObject();
	
	for(int i=0; i<searchList.size(); i++) {
		
		JSONObject jsObj = new JSONObject();
		
		jsObj.put("fname", searchList.get(i).getFname());
		jsObj.put("store", searchList.get(i).getStore());
		jsObj.put("price", searchList.get(i).getPrice());
		jsObj.put("star", searchList.get(i).getStar());
		jsObj.put("date", searchList.get(i).getDate());
		jsObj.put("type", searchList.get(i).getType());
		jsObj.put("pfile", searchList.get(i).getPfile());
		jsObj.put("comment", searchList.get(i).getComment());
		
		jsArr.put(jsObj);
	}
	rootObj.put("food_list", jsArr);
	out.println(rootObj.toString()); // 어이없어ㅜ 이 값이 get 방식 data로 넘어감...
	return rootObj;
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
	
	show(out,list);
} else {
	String cmd = request.getParameter("cmd");
	String searchData = request.getParameter("searchData");
	
	if("search".equals(cmd)){
		ArrayList<FoodLogVo> newFoodList = new ArrayList<FoodLogVo>();
		
		for(int i=0;i<list.size();i++){
			FoodLogVo food = list.get(i);
			if(food.getFname().indexOf(searchData) != -1){
				newFoodList.add(food);
			}
		}
		
		show(out, newFoodList);
	} else {
		// 전체목록
		show(out, list);
	}
}
%>