<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String name;
	String[] check;
	int[] chk;
%>
	<%
	request.setCharacterEncoding("UTF-8");
	check = request.getParameterValues("think");
	name = request.getParameter("name");
	
	int cntS;
	cntS = check.length;
	PrintWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/bbs/checkList.txt");
		//out.println("경로:"+filePath+"<br>");
		writer = new PrintWriter(new FileWriter(filePath, true));
		writer.println(name+'\t'+cntS*10);
		//out.println("<font color='red'>게시물</font>저장되어쑤");
		writer.flush();
	}
	catch(Exception e){
		out.println("오류 발생");
		e.printStackTrace();
	}
	
	%>
	<input type="hidden" name="userCheck" value="<%=cntS*10%>">
	<input type="hidden" name="userName" value="<%=name%>">
	<script>
	alert("결과를 보러 갑시다!");
	location.href="ShowYOLO.jsp?userCheck=<%=cntS*10%>&userName=<%=name%>"; 
	</script>
	<!--  
	<h2>저장되었습니다! 몇등인지 볼까요?</h2>
	<button onclick="location.href='ShowYOLO.jsp'">결과</button>
	-->
</body>
</html>
