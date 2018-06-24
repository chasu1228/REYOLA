<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");

	String nickname = request.getParameter("nickname");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String comment = request.getParameter("comment");

	// 데이터베이스 접속을 위한 클래스
	Connection conn = null;
	// 접속 후 질의문을 실행시킬 클래스
	java.sql.Statement st = null;
	// 질의문에 대한 결과값이 있는 클래스
	ResultSet rs = null;
	// 날짜
    Calendar c1 = Calendar.getInstance();
    
    java.util.Date date = c1.getTime();
    
    String today = (new SimpleDateFormat("yyyy-MM-dd").format(date));

	java.util.Date utilDate = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	try {
		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
		st = conn.createStatement();
		st.execute("use yolo;"); // 사용할 DB를 선택한다.

		String sql = "insert into share values('0','" + nickname + "','" + password + "','" + title + "','"
				+ comment + "','"+sqlDate+"','0','0','0')";

		st.executeUpdate(sql);

		st.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	} catch (ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
	}
%>
<script language=javascript>
	self.window.alert("작성 하셨습니다.");
	location.href = "Share_Board.jsp";
</script>