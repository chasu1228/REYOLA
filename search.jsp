<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색</title>
<link href="css/search_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
		<div id="t">
			<div id="logo"><img class=imglogo src="img/logo.png"></img></div>
			<div id="menu">
				<div class="btn0">
					<button class="button" onclick="location='Yolo_Interduce.jsp'">
						<img src="img/MENU_YOLO.png"></img>
					</button>
					<div class="btn0_1">
						<a>욜로족을 소개합니다.</a>
					</div>
				</div>
				<div class="btn0">
					<button class="button">
						<img src="img/MENU_TRAVEL.png"></img>
					</button>
					<div class="btn0_1">
						<a>여행을 추천합니다.</a>
					</div>
				</div>
				<div class="btn0">
					<button class="button" onclick="location='Share_Board.jsp'">
						<img src="img/MENU_SHARE.png"></img>
					</button>
					<div class="btn0_1">
						<a>소통합니다.</a>
					</div>
				</div>
				<div class="btn0">
					<button class="button">
						<img class="imgbtn" src="img/MENU_MADE.png"></img>
					</button>
					<div class="btn0_1">
						<a>개발자를 소개합니다.</a>
					</div>
				</div>
			</div>
			
			<table border=1 cellspacing=0 align="center">
			<tr class=tr1 align="center">
				<td class="num">번호</td>
				<td class="tittle">제목</td>
				<td class="writer">글쓴이</td>
				<td class="date">날짜</td>
				<td class="read">조회수</td>
			</tr>
			<%
				//데이터베이스 접속을 위한 클래스
				Connection conn = null;
				// 접속 후 질의문을 실행시킬 클래스
				java.sql.Statement st = null;
				java.sql.Statement st2 = null;
				// 질의문에 대한 결과값이 있는 클래스
				ResultSet rs = null;
				ResultSet rs2 = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					request.setCharacterEncoding("UTF-8");
					String kind = request.getParameter("s");
					String search = request.getParameter("se");

					conn = DriverManager.getConnection("jdbc:mysql://localhost:1228/yolo", "root", "1234");
					st = conn.createStatement();
					st2 = conn.createStatement();

					if (kind.equals("제목")) {
						rs = st.executeQuery("SELECT * FROM share WHERE title like '%" + search + "%' order by id desc");
						rs2 = st2.executeQuery("SELECT count(*) FROM share WHERE title like '%" + search + "%'");
						System.out.println(rs);
						if (rs2.next()) {
							for (int i = 0; i < rs2.getInt(1); i++) {
								if (rs.next()) {
									int id = rs.getInt(1);
									String name = rs.getString(2);
									String title = rs.getString(4);
									String time = rs.getString(6);
									int hit = rs.getInt(7);
			%>
			<tr align="center">
				<td class="num"><%=id%></td>
				<td class="tittle2"><a href="View.jsp?idx=<%=id%>"><%=title%></a></td>
				<td class="writer"><%=name%></td>
				<td class="date"><%=time%></td>
				<td class="read"><%=hit%></td>
			</tr>
			<%
				}
							}
						}
					}%>
					<%if (kind.equals("작성자")) {
						rs = st.executeQuery("SELECT * FROM share WHERE nickname like '%" + search + "%' order by id desc");
						rs2 = st2.executeQuery("SELECT count(*) FROM share WHERE nickname like '%" + search + "%'");
						System.out.println(rs);
						if (rs2.next()) {
							for (int i = 0; i < rs2.getInt(1); i++) {
								if (rs.next()) {
									int id = rs.getInt(1);
									String name = rs.getString(2);
									String title = rs.getString(4);
									String time = rs.getString(6);
									int hit = rs.getInt(7);
			%>
			<tr align="center">
				<td class="num"><%=id%></td>
				<td class="tittle2"><a href="View.jsp?idx=<%=id%>"><%=title%></a></td>
				<td class="writer"><%=name%></td>
				<td class="date"><%=time%></td>
				<td class="read"><%=hit%></td>
			</tr>
			<%
				}
							}
						}
					}%>
					<%if (kind.equals("제목+내용")) {
						rs = st.executeQuery("SELECT * FROM share WHERE title like '%" + search + "%' or comment like '%"+search+"%' order by id desc");
						rs2 = st2.executeQuery("SELECT count(*) FROM share WHERE title like '%" + search + "%' or comment like '%"+search+"%'");
						System.out.println(rs);
						if (rs2.next()) {
							for (int i = 0; i < rs2.getInt(1); i++) {
								if (rs.next()) {
									int id = rs.getInt(1);
									String name = rs.getString(2);
									String title = rs.getString(4);
									String time = rs.getString(6);
									int hit = rs.getInt(7);
			%>
			<tr align="center">
				<td class="num"><%=id%></td>
				<td class="tittle2"><a href="View.jsp?idx=<%=id%>"><%=title%></a></td>
				<td class="writer"><%=name%></td>
				<td class="date"><%=time%></td>
				<td class="read"><%=hit%></td>
			</tr>
			<%
				}
							}
						}
					} 
					rs2.close();
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
			<tr>
				<td colspan=4><select name="s">
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
						<option value="제목+내용">제목+내용</option>
				</select> <input type=text name='se'> <input class=writting
					type=submit name='go' value="검색"></td>
				<td align=right><input type=button class=writting
					name="writting" value="글쓰기" onclick="location='write.jsp'"></td>
			</tr>
		</table>
			</div>
			
			</center>
</body>
</html>