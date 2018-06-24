<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movie</title>
<link href="css/new.css" rel="stylesheet" type="text/css">
</head>
<body>

	당신은 영화를 볼 때 무슨 음식을 먹나요?
	<form action="movieSave.jsp">

		<input type="radio" name="movie" value="나쵸">나쵸 <input
			type="radio" name="movie" value="팝콘">팝콘 <input type="radio"
			name="movie" value="오징어">오징어 <input type="radio" name="movie"
			value="햄버거">햄버거 <input type="radio" name="movie" value="탄산음료">탄산음료(음료만
		먹을 시에) <input type="radio" name="movie" value="맥주" disabled>맥주
		<input type="radio" name="movie" value="기타">기타 <input
			type="submit" name="결과 보기">
	</form>


	<%
	int cnt=0;
		BufferedReader reader = null;
		int mov[] = new int[7];
		String fod[] = {"나쵸", "팝콘", "오징어", "햄버거", "탄산음료", "맥주", "기타"};
		try {
			String filePath = application.getRealPath("/WEB-INF/bbs/movieFood.txt");
			reader = new BufferedReader(new FileReader(filePath));
			out.print(reader);
			while (true) {
				String str = reader.readLine();
				if (str == null)
					break;
				cnt++;
				switch (str) {
					case "나쵸" :
						mov[0] += 1;
						break;
					case "팝콘" :
						mov[1] += 1;
						break;
					case "오징어" :
						mov[2] += 1;
						break;
					case "햄버거" :
						mov[3] += 1;
						break;
					case "탄산음료" :
						mov[4] += 1;
						break;
					case "맥주" :
						mov[5] += 1;
						break;
					case "기타" :
						mov[6] += 1;
						break;
				}
			}
		} catch (Exception e) {
			out.println("파일을 읽을 수 옶서요");
		}

		int per[] = new int[7];
		for(int i=0; i<7;i++){
			per[i] = ((int)((double)mov[i]/cnt)*100);
		}
	%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
				['Task', 'Hours per Day'],[ '나쵸', <%=mov[0]%> ], [ '팝콘',<%=mov[1]%>], [ '오징어', <%=mov[2]%>],[ '햄버거', <%=mov[3]%> ],
					[ '탄산음료', <%=mov[4]%> ], [ '맥주', <%=mov[5]%> ], [ '기타', <%=mov[6]%> ] ]);

			var options = {
				title : '영화 볼 때 먹는 음식!'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>