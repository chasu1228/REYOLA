<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
div{
    margin: 100px auto;
    width: 60%;
    height:300px;
    padding: 30px;
    background-color: ivory;
}
*{
font-size:1em;
}
body {
  	 	background-image: url("home/home.jpg") ;
   		background-color: #cccccc;
		}
.grad{
font-size:150%;
background:  #FC5C7D;  /* fallback for old browsers */
background:-webkit-linear-gradient(to left, #6A82FB, #FC5C7D);   /* Chrome 10-25, Safari 5.1-6 */

background:linear-gradient(to left, #6A82FB, #FC5C7D);/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
b{
font-size:120%;
background:  #00c3ff;  /* fallback for old browsers */
background:-webkit-linear-gradient(to right, #ffff1c, #00c3ff);   /* Chrome 10-25, Safari 5.1-6 */

background:linear-gradient(to right, #ffff1c, #00c3ff);/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  
}
</style>
</head>
<body>
<%
String num = request.getParameter("home");
if(num.equals("1")){
	%>
	<div>
	<span class="grad">1번 문이 두 개인 집</span>을 선택했다면 <br>
<br>
	외부적인 영역 즉 사회생활에 불만을 가지거나 불편함이 있는 것으로 해석됩니다. <br>
	이로인해 이탈하고 싶은 마음과 다른 방식으로 세상과 소통하고 싶어하는 성향을 가진 사람으로 볼 수 있습니다.<br>
	<h3>그렇지만! 세상에서의 불편함을 찾아 <br>다른 방식으로 소통하며 바꾸어 갈 당신이 바로 <b>Real YOLO</b>!</h3>
	</div>
	<%
}else if(num.equals("2")){
	%>
	<div>
	<span class="grad">2번 창문이 많은 집</span>은 <br>
<br>
	자신이 외부적인 세계를 들여다보는 통로로 많으면 많을 수록 관심받고 싶어하는 성향이 강하다고 볼 수 있습니다. <br>
	다른 사람을 많이 의식하고 인정받고 싶어하는 마음이 있습니다.<br>
	<h3>이젠 다른 사람의 시선보다 자신의 마음에 더욱 귀 기울여 보는 것은 어떨까요? <br> 옆 부스의 <b>SELF-REGARD</b>로 당신을 초대합니다!</h3>
	</div>
	<%
}else if(num.equals("3")){
	%>
	<div>
	<span class="grad">3번 지붕이 큰 집</span>은 <br>
	<br>
	자신을 보호하려는 마음이 강하며 다른사람과 어울리는 것 보다 자신만의 시간을 즐기고 독립적인 성향을 보입니다.<br>
	다른사람에 대한 불신이나 불안감이 많은 사람으로도 볼 수 있습니다.<br>
	<h3>자신의 마음에 귀 기울이는 당신! 옆 부스의 <b>SELF-REGARD</b>로 당신을 초대합니다!</h3>
	</div>
	<%
}else if(num.equals("4")){
	%><div>
	<span class="grad">4번 굴뚝이 있는 집</span>은 <br>
	<br>
	불을 피우는 것으로 따뜻한 집안 즉 가족의 화목을 중요시하는 성향을 가진 사람입니다. <br>
	<h3>학교생활로 바빠 연락하지 못했던 당신, 오늘 <b>사랑하는 가족에게 전화 한 통</b> 어때요?</h3><br>
	</div>
	<%
}else{
	
}

%>
</body>
</html>