<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>
<style>
body{
	background-image: url("img/bg.jpg");
}
</style>
<link href="css/write_css.css" rel="stylesheet" type="text/css">
<script language="javascript">
	// 자바 스크립트 시작
	function modify() {
		var form = document.modifyform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return location.href="javascript:history.back()";
		}

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.comment.value) {
			alert("내용을 적어주세요");
			form.comment.focus();
			return;
		}

		form.submit();
	}
</script>
<%	//int pg = Integer.parseInt(request.getParameter("pg"));
	int idx = Integer.parseInt(request.getParameter("idx"));
			//데이터베이스 접속을 위한 클래스
			Connection conn = null;
			// 접속 후 질의문을 실행시킬 클래스
			java.sql.Statement st = null;
			// 질의문에 대한 결과값이 있는 클래스
			ResultSet rs = null;
			request.setCharacterEncoding("UTF-8");
			Class.forName("com.mysql.jdbc.Driver");

			String name = "";
			String password = "";
			String title = "";
			String comment = "";

			try {

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
				st = conn.createStatement();
				st.execute("use yolo;");
				
				String sql = "SELECT nickname, PASSWORD, TITLE, comment FROM share WHERE id=" + idx;
				rs = st.executeQuery(sql);
				

				if (rs.next()) {
					name = rs.getString(1);
					password = rs.getString(2);
					title = rs.getString(3);
					comment = rs.getString(4);
				}

				rs.close();
				st.close();
				conn.close();

			} catch (SQLException e) {
				out.println(e.toString());
			}%>

</head>
<body>
	<center>
			<div id="content">
				<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">
					<table border=1 cellspacing=0 align="center">
						<tr class=tr1 align="center">
							<td class=tt colspan=2>수정하기</td>
						</tr>

						<tr>
							<td class=title colspan=2>제목 <input type=text class=wtt
								name="title" maxlength="30" value="<%=title%>"></td>
						</tr>
						<tr>
							<td class=content colspan=2>내용</td>
						</tr>
						<tr>
							<td class=cc colspan=2><textarea class=ct name="comment"
									rows=19 cols=83 ><%=comment%></textarea></td>
						</tr>
						<tr>
							<td class=pass align=left colspan=2>비밀번호 <input
								type=password class=tw name="password"></td>
						</tr>
						<tr>
							<td align=center colspan=2><input type=submit class=save
								name="save" value="수정" OnClick="modify()"></td>
						</tr>
					</table>
				</form>
			</div>
	</center>
</body>
</html>