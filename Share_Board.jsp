<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Share 게시판</title>
<link href="css/board_css.css" rel="stylesheet" type="text/css">
<style>
body{
	background-image: url("img/bg.jpg");
}
</style>
</head>
<body>
	<center>
			<div id="content">
				<a href="index.jsp"><img id="logo" src="img/REYOLABLUE.png"><p></p></img></a>
				<jsp:include page="/Share_List.jsp"/>
			</div>
	</center>
</body>
</html>