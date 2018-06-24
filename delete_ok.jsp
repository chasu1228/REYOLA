<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%	//int pg = Integer.parseInt(request.getParameter("pg"));
	//데이터베이스 접속을 위한 클래스
	Connection conn = null;
	// 접속 후 질의문을 실행시킬 클래스
	java.sql.Statement st = null;
	// 질의문에 대한 결과값이 있는 클래스
	ResultSet rs = null;

	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");

	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("password");

	try {

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
		st = conn.createStatement();
		st.execute("use yolo;"); // 사용할 DB를 선택한다.
		System.out.println("사용!");
		String sql = "SELECT PASSWORD FROM share WHERE id=" + idx;
		rs = st.executeQuery(sql);

		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {

			sql = "DELETE FROM share WHERE id=" + idx;
			st.executeUpdate(sql);
%>
<script language=javascript>
	self.window.alert("해당 글을 삭제하였습니다.");
	self.close();
	location.href = "Share_Board.jsp";
</script>

<%
	rs.close();
		st.close();
		conn.close();

	} else {
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