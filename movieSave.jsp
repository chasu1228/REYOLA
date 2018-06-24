<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>movie</title>
    <link href="css/new.css" rel="stylesheet" type="text/css">
    <script src="css/yolo.js"></script>
</head>
<body>
		<%
		String food = request.getParameter("movie");
		
		PrintWriter writer = null;
		try{
			String filePath = application.getRealPath("/WEB-INF/bbs/movieFood.txt");
			//out.println(filePath);
			writer = new PrintWriter(new FileWriter(filePath, true));
			writer.println(food);
			
			writer.flush();
			response.sendRedirect("ourYOLO.jsp#open8");
		}
		catch(Exception e){
			System.out.print(e);
		}
		%>
</body>
</html>