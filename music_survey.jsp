<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>노래방 결과</title>
<style>
body{
	border:10px solid #FFCD12;
}
.hGraph ul {
	margin: 0 50px 0 50px;
	padding: 1px 0 0 0;
	border: 1px solid #ddd;
	border-top: 0;
	border-right: 0;
	font-size: 11px;
	font-family: Tahoma, Geneva, sans-serif;
	list-style: none;
}

.hGraph li {
	position: relative;
	margin: 10px 0;
	white-space: nowrap;
	vertical-align: top;
}

.hGraph .gTerm {
	position: absolute;
	width: 40px;
	top: 0;
	left: -170px;
	line-height: 20px;
	text-align: right;
	color: #767676;
	font-weight: bold;

	padding-right:200px;
	font-size:11pt;
}
.hGraph{
	padding-left:130px;
}
.hGraph .gBar {
	margin-top:5px;
	position: relative;
	display: inline-block;
	height: 20px;
	border: 1px solid #ccc;
	border-left: 0;
	background: #FFCD12;
}
<!--숫자-->
.hGraph .gBar span {
	position: absolute;
	width: 40px;
	line-height: 20px;
	top: 0;
	right: -50px;
	color: #767676;
}

</style>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8"); // post방식일 때 무조건 사용해야 함.
		String[] value = request.getParameterValues("music");
		String[] filenames = {};
		int i = 0;
		int num = 0;
		PrintWriter writer = null;
		String result;

		//중복처리
		String dirPath = application.getRealPath("/WEB-INF/music");
		File dir = new File(dirPath);
		String filename[] = dir.list();
		BufferedReader reader = null;
		
		for (; i < value.length; i++) {
			try {
				for (int j = 0; j < filename.length; j++) {

						if (value[i].equals(filename[j])) {
							
							String same = application.getRealPath("/WEB-INF/music/" + value[i]);
							reader = new BufferedReader(new FileReader(same));
					 		String str = reader.readLine();
					 		num=Integer.parseInt(str);

						}

				}

				String filePath = application.getRealPath("/WEB-INF/music/" + value[i]);
				writer = new PrintWriter(filePath);

				writer.printf("%d", 1 + num);

				writer.flush();
				result = "ok";
			} catch (Exception e) {
				out.println("오류발생");
				result = "fail";
			}
		}
		
	%>
<div class="hGraph">
	<ul>
<%
	String dirPath2 = application.getRealPath("/WEB-INF/music");
	File dir2 = new File(dirPath2);
	String filenames2[] = dir2.list();

	for(int j = 0; j < filenames2.length; j++){
%>
			<li><span class="gTerm">
<%
			out.print(filenames2[j]);
%>
		</span>
		
		<span class="gBar" 
		<%
		BufferedReader reader2 = null;
	 	try {
	 		String filePath = application.getRealPath("/WEB-INF/music/" + filenames2[j]);

	 		reader2 = new BufferedReader(new FileReader(filePath));
	 		while (true) {
	 			String str = reader2.readLine();
	 			int num2 = Integer.parseInt(str);
	 			if (str == null)
	 				break;
	 			if(num2 > 10)
	 				num2=10;
	 				%>
	 			style="width:<% out.print(num2*10+"%");%>"><span><b>
	 			<%
	 			out.print(Integer.parseInt(str)+"표");
	 		}

	 	} catch (Exception e) {
	 		
	 	} finally {
	 		reader2.close();
	 	}
%>
	</b></span></span></li><br/><% } %>
	</ul>
</div>
<br/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
</body>
</html>