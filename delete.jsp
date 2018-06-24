<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
<script language="javascript">
<% int idx = Integer.parseInt(request.getParameter("idx")); %>
	// 자바 스크립트 시작
	function deleteCheck() {
		var form = document.deleteform;
		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>

<link href="css/delete_css.css" rel="stylesheet" type="text/css">
</head>
<body>

	<form name=deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
		<table>
			<tr>
				<td>
					<table class=d1 width="100%" cellpadding="0" cellspacing="0"
						border="0">
						<tr>
							<td class=d2 width="3">삭제하실려면 비밀번호를 입력해주세요</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td class=d2><input name="password" type="password"
								size="50" maxlength="30"></td>
							<td>&nbsp;</td>
						</tr>
						<tr bgcolor="#FFFFA2">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2"><input type=button class=del value="삭제"
								OnClick="javascript:deleteCheck();"> <input type=button
								class=del value="취소" OnClick="self.close();">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>-
</body>
</html>