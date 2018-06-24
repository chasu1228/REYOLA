<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link href="css/write_css.css" rel="stylesheet" type="text/css">
<style>
body{
	background-image: url("img/bg.jpg");
}
</style>
<script language = "javascript"> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.nickname.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.nickname.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.comment.value )
   {
    alert( "내용을 적어주세요" );
    form.comment.focus();
    return;
   }
 
  form.submit(); }
 </script>
</head>
<body>
	<center>
			<div id="content">
				<form name=writeform method="post" action="write_ok.jsp">
					<table border=1 cellspacing=0 align="center">
						<tr class=tr1 align="center">
							<td class=tt colspan=2>글쓰기</td>
						</tr>
						<tr>
							<td class=writer>작성자 <input type=text class=tw name="nickname"></td>
							<td class=pass align=right>비밀번호 <input type=password
								class=tw name="password"><a class=pass_2> (수정, 삭제시 반드시
									필요)</a></td>
						</tr>
						<tr>
							<td class=title colspan=2>제목 <input type=text class=wtt
								name="title" maxlength="30"></td>
						</tr>
						<tr>
							<td class=content colspan=2>내용</td>
						</tr>
						<tr>
							<td class=cc colspan=2><textarea class=ct name="comment"
									rows=19 cols=83></textarea></td>
						</tr>
						<tr>
							<td align=center colspan=2><input type=submit class=save
								name="save" value="등록" OnClick="javascript:writeCheck();"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</center>
</body>
</html>