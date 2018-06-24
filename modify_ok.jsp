<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	//int pg = Integer.parseInt(request.getParameter("pg"));
	Class.forName("com.mysql.jdbc.Driver");	
	//데이터베이스 접속을 위한 클래스
	Connection conn = null;
	// 접속 후 질의문을 실행시킬 클래스
	java.sql.Statement st = null;
	// 질의문에 대한 결과값이 있는 클래스
	ResultSet rs = null;
	String pass = "";
	String password = "";

	try {

		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		String passw = request.getParameter("password");

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
		st = conn.createStatement();
		st.execute("use yolo;");

		String sql = "SELECT PASSWORD FROM share WHERE id=" + idx;
		rs = st.executeQuery(sql);

		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {
			sql = "UPDATE share SET TITLE='" + title + "' ,comment='" + comment + "' WHERE id=" + idx;
			st.executeUpdate(sql);
%>
<script language=javascript>
		self.window.alert("글이 수정되었습니다.");
		location.href="Share_Board.jsp?idx=<%=idx%>";
</script>
<%
	rs.close();
			st.close();
			conn.close();
		}
		
		else {
%>
<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>
<%
	}

	} catch (SQLException e) {
		out.println(e.toString());
	}
%>