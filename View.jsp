<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View</title>
<style>
body {
	background-image: url("img/bg.jpg");
}
</style>

<script language="javascript">

<%int idx = Integer.parseInt(request.getParameter("idx"));%>
	function re()
	  {
	   var form = document.rewriteform;
	   
	   if( !form.rename.value )   // form 에 있는 name 값이 없을 때
	   {
	    alert( "이름을 적어주세요" ); // 경고창 띄움
	    form.rename.focus();   // form 에 있는 name 위치로 이동
	    return;
	   }
	   
	   if( !form.repassword.value )
	   {
	    alert( "비밀번호를 적어주세요" );
	    form.repassword.focus();
	    return;
	   }

	  if( !form.recomment.value )
	   {
	    alert( "내용을 적어주세요" );
	    form.recomment.focus();
	    return;
	   }
	 
	  form.submit(); }
	function del() {
		var url = "delete.jsp?idx=<%=idx%>";
		window.open(url, '',
				'width=400, height=170, left= 30, top=200, scrollbars=no');
	}
</script>
<link href="css/View_css.css" rel="stylesheet" type="text/css">

</head>

<body>
	<center>
<%
			// 데이터베이스 접속을 위한 클래스
			Connection conn = null;
			// 접속 후 질의문을 실행시킬 클래스
			java.sql.Statement st = null;
			java.sql.Statement st2 = null;
			// 질의문에 대한 결과값이 있는 클래스
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
				st = conn.createStatement();
				st2 = conn.createStatement();
				st.execute("use yolo;");
				st2.execute("use yolo;");// 사용할 DB를 선택한다.
				
				rs = st.executeQuery("SELECT * FROM share where id=" + idx);

				while (rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String title = rs.getString(4);
					String comment = rs.getString(5);
					String time = rs.getString(6);
					int hit = rs.getInt(7);
					int recommend = rs.getInt(9);
					hit++;
		%>

		<form name=rewriteform method="post" action="rewrite_ok.jsp?idx=<%=idx%>">
			<div class=tt>
				<div class=tit>
					<h1><%=title%></h1>
					<small class=na>by <b><%=name%></b></small> <small class=na>posted
						<b><%=time%></b>
					</small> <small class=na>hit <b><%=hit%></b></small>
				</div>
			</div>
			<div class=cm>
				<div class=com><%=comment%></div>
			</div>
			<div class=cm2 align=left>
				<input type=button class=list value="목록"
					OnClick="location='Share_Board.jsp'"> <input type=button
					class=list value="추천 <%=recommend%>" OnClick="javascript:pop();">
				<input type=button class=list2 value="수정"
					OnClick="location='modify.jsp?idx=<%=idx%>'"> <input
					type=button class=list2 value="삭제" OnClick="del()">
			</div>
		</form>
		<div class=cm>
			<p></p>
			<jsp:include page="/Share_List.jsp" />
		</div>
		<%
			st2.executeUpdate("UPDATE share set HIT=" + hit + " where id=" + idx);
				}
			} catch (Exception e) {
				e.printStackTrace();
				// try, catch 문 실행 완료 후 실행되는 데 사용객체들을 닫아준다.
			} finally {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				if (conn != null)
					conn.close();
			}
		%>
	</center>
	<script>
function pop() {
	<%
	Connection conn3 = null;
	java.sql.Statement st3 = null;
	ResultSet rs3 = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");

		conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "1234");
		st3 = conn3.createStatement();
		st3.execute("use yolo;");
		
		rs3 = st3.executeQuery("SELECT * FROM share where id=" + idx);
		while (rs3.next()) {
			int recommend = rs3.getInt(9);
			recommend++;
			System.out.println("후"+recommend);
			st3.executeUpdate("UPDATE share set recommend=" + recommend + " where id=" + idx);
		}}catch (Exception e) {
				e.printStackTrace();
				// try, catch 문 실행 완료 후 실행되는 데 사용객체들을 닫아준다.
			} finally {
				if (rs3 != null)
					rs3.close();
				if (st3 != null)
					st3.close();
				if (conn3 != null)
					conn3.close();
			}


	%>

	alert("추천 되었습니다!");
	window.location.reload();
}
</script>
</body>
</html>