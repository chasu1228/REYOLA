<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	int pg = Integer.parseInt(request.getParameter("pg"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String rename = request.getParameter("rename");
	String repassword = request.getParameter("repassword");
	String recomment = request.getParameter("recomment");

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

		String sql = "insert into reshare values('0','" + rename + "','" + repassword +"','"
				+ recomment + "')";

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
	
	location.href = "View.jsp?idx=<%=idx%>&pg=<%=pg%>";
</script>