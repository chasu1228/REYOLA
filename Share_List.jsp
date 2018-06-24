<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%  final int ROWSIZE = 5; // 한페이지에 보일 게시물 수
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정
	int pg = 1; //기본 페이지값
	if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
		}
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step)
	int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step)
	
	int allPage = 0; // 전체 페이지수
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	background-image: url("img/bg.jpg");
}
</style>
<title>게시판</title>
<link href="css/Share_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name=writeform method="post" action="search.jsp">
	<center>
	<p></p>
		<table cellspacing=0 align="center">
			<tr class=tr1 align="center">
				<td class="num">번호</td>
				<td class="tittle">제목</td>
				<td class="writer">글쓴이</td>
				<td class="date">날짜</td>
				<td class="read">조회수</td>
			</tr>
			<%
				// 데이터베이스 접속을 위한 클래스
				Connection conn = null;
				// 접속 후 질의문을 실행시킬 클래스
				java.sql.Statement st = null;
				java.sql.Statement st2 = null;
				// 질의문에 대한 결과값이 있는 클래스
				ResultSet rs = null;
				int total = 0;
				String sql = "";
				try {
					Class.forName("com.mysql.jdbc.Driver");

					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306?useSSL=false", "root", "1234");
					st = conn.createStatement();
					st2 = conn.createStatement();
					st.execute("use yolo;"); // 사용할 DB를 선택한다..
					st2.execute("use yolo;"); // 사용할 DB를 선택한다.
					
					String sqlCount = "SELECT COUNT(*) FROM share";
					rs = st.executeQuery(sqlCount);
					
					if(rs.next()){
						total = rs.getInt(1);
					}
					
					rs.close();
					
					int sort=1;
					String sqlSort = "SELECT id from share";
					rs = st.executeQuery(sqlSort);
					
					while(rs.next()){
						int stepNum = rs.getInt(1);	
						sql = "UPDATE share SET step=" + sort + " where id=" +stepNum;
					 	st2.executeUpdate(sql);
					 	sort++;
					} 
					allPage = (int)Math.ceil(total/(double)ROWSIZE);
					
					if(endPage > allPage) {
						endPage = allPage;
					}
					
					String sqlList = "SELECT id, nickname, TITLE, TIME, HIT from share where step >="+start + " and step <= "+ end +" order by step asc";
					rs = st.executeQuery(sqlList);
					 
					rs.close();
					
					String SQL = "select count(*) from share";
					rs = st.executeQuery(SQL);
					
					if(rs.next()){
						total = rs.getInt(1);
					}
					
					rs.close();
					rs = st.executeQuery("SELECT * FROM share order by id desc");

					while (rs.next()) {
						int id = rs.getInt(1);
						String name = rs.getString(2);
						String title = rs.getString(4);
						String time = rs.getString(6);
						int hit = rs.getInt(7);	
						
						Date date = new Date();
						SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
						String year = (String)simpleDate.format(date);
						String yea = time.substring(0,10);

			%>
			<tr align="center">
				<td class="num"><%=id%></td>
				<td class="tittle2"><a href="View.jsp?idx=<%=id%>"><%=title%>
				</a> <%
					if(year.equals(yea)){
					%> <img src='img/new.jpg' class=new /> <% }  %></td>
				<td class="writer"><%=name%></td>
				<td class="date"><%=time%></td>
				<td class="read"><%=hit%></td>
			</tr>
			<%
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
		<input type=button class=main value="메인으로" onclick="location='index.jsp'">
	</center>
</form>
</body>
</html>
