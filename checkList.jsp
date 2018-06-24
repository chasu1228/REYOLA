<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
    <head>
        <title>AM I YOLO?</title>
		<link href="css/new.css" rel="stylesheet" type="text/css">
		<link href="css/index_css.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
		
    <style>
      body {
        font-family: 'Hanna', serif;
      }
        
    .btn {
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #000000;
  font-size: 20px;
  background: #fffc2e;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  margin:20px;
}

.btn:hover {
  background: #ffdd00;
  text-decoration: none;
}
    </style>
    </head>
    <body>
        <!--  style="background:url(sky.jpg) no-repeat fixed 50%;" -->
<div style="margin:0px 15%; padding:3% 20px; line-height:200%; ">
						<h2 style="height: auto; width: 100%; border-left:5px solid rgb(255, 217, 0);">&nbsp&nbsp당신은 욜로족인가요?</h2>
						<br><br>
						<form action="saveYOLO.jsp" style="height: auto; width: 100%; border-bottom:3px solid gold; font-size:15pt;">
							
							<label for="name">이름/별명</label><input type="text" name="name" id="name" required><br>

							<input type="checkbox" name="think" value="1" class="">나는 하루에 10번 이상 <b>지금</b> 난 행복한지 생각해본다.<br>
				
				
							<input type="checkbox" name="think" value="1" class="">지금 죽도록 공부해서 커서 행복하게 살고 싶다기보다는, 하루하루를 <b>놀면서 행복했으면</b> 좋겠다.<br>
				
							<input type="checkbox" name="think" value="1" class="">항상 <b>나의 행복이 우선</b>이다. 내가 행복하지 않으면 하지 않는다.<br>
				
							<input type="checkbox" name="think" value="1" class="">난 욜로족을 <b>선망</b>해왔고, 꼭 그런 인생을 살아보고 싶다.<br>
					
							<input type="checkbox" name="think" value="1" class="">뒷일은 생각하지 않고 <b>오직 현실에만 충실</b>하게 살고 싶다.<br>
					
							<input type="checkbox" name="think" value="1" class="">나의 가치는 미래에 대한 준비나 타인을 위한 희생 대신 <b>현재 내가 즐길 수 있는 행복</b>이 최고의 가치이다.<br>
						
							<input type="checkbox" name="think" value="1" class="">하고 싶으면 <b>하고 본다</b><br>
					
							<input type="checkbox" name="think" value="1" class="">일이 <b>인생의 전부</b>가 될 수는 없다!<br>
					
                            <input type="checkbox" name="think" value="1" class=""><b>언제라도</b> 여행을 떠날 준비가 되어있다.<br>
					
							<input type="checkbox" name="think" value="1" class="">그래도 가장 중요한 건 <b>할땐 하고 놀땐 노는 마음</b>이다.<br>
							
							<br>
							<input type="submit" value="제출" class="btn">
							</form>
							
<br><br>
							<p><br>현실을 중요하게 생각하는 것은 참 중요하지만, <b>미래</b>가 현재가 된다는 사실도 잊지 마세요!</p>
						</div>
						</body>
                        </html>