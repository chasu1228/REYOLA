<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>우리들의 욜로</title>
    <link href="css/new.css" rel="stylesheet" type="text/css">
    <script src="css/yolo.js"></script>


    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/NanumGothic.css">
    <style>
        body {
            font-family: 'Nanum Gothic', serif;
        }
        #logo{height:100px; width:auto;}
        input[type=submit]{
        background-color:#FFE400;
        padding:5px;
        color:black;
        border:0;
        
        }
        .yellowBtn{
        position: absolute;
        top:10px;
        float:right;
        right:10px;
        background-color:#FFE400;
        padding:2px;
        color:black;
        }
        .yellowBtn:hover{
        background-color:#FFBB00;
        color:black;
        }
    </style>
    <script>
function pop_up_post(){
	var pop_title = "popupOpener" ;
    
    window.open("", pop_title, "width=550, height=280, scrollbars=yes") ;
     
    var cafe = document.cafe ;
    cafe.target = pop_title ;
    cafe.action = "cafe_survey.jsp" ;
     
    cafe.submit() ;
}
function pop_up_post2(){
	var pop_title = "popupOpener" ;
    
    window.open("", pop_title, "width=550, height=330, scrollbars=yes") ;
     
    var music = document.music ;
    music.target = pop_title ;
    music.action = "music_survey.jsp" ;
     
    music.submit() ;
}
function popupOpen3(){

	var pop_title = "home.jsp";	//팝업창에 출력될 페이지 URL

	var popOption = "width=1000, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(pop_title,"",popOption);

	}
</script>
</head>

<body>

	<%
	int cnt=0;
		BufferedReader reader = null;
		int mov[] = new int[7];
		String fod[] = {"나쵸", "팝콘", "오징어", "햄버거", "탄산음료", "맥주", "기타"};
		try {
			String filePath = application.getRealPath("/WEB-INF/bbs/movieFood.txt");
			reader = new BufferedReader(new FileReader(filePath));
		
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


<a href="index.jsp"><img id="logo" src="img/REYOLABLUE.png" ></a>
    <div>
        <div id="di0" class=di style="left:360px; top:530px; font-size:3em; z-index:3; ">
            <a href=#open0>건대</a>
        </div>
        <div class=white_content id=open0>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/건대.jpg" width="400px">
                        </td>
                        <td style="width:60%">
                            건대의 "커먼그라운드"는 국내 최초, 세계 최대의 POP-UP컨테이너 쇼핑몰이다.
                            <br> 파란색 컨테이너가 너무 예쁘게 반겨준다 !
                            <br> 그리고 많은 가게들, 맛집들도 꼭 가보자! (양꼬치도...)
                            <br> 다른 대학가들과 조금 다르게, 지하철 한 정거장 정도만 걸으면 오래된 명가 맛집도 있답니다 :)
                            <br>
                            <br>
                            <br> 꿀팁 : 서울 3대 족발집 중 하나가 이곳에 있대요. 바로바로 "성수족발"!!!
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di1" class=di style="left:845px; top:370px; font-size:3em;z-index:3;">
            <a href=#open1>애니메이션보기</a>
        </div>
        <div class=white_content id=open1>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/애니메이션.jpg"
                                width="380px">
                        </td>
                        <td style="width:60%">
                           	 아무래도 밖에 나가는 것보다 집에서 이불 뒤집어 쓰고
                            <br> 애니메이션 보는 것을 즐겨하시는 분 있나요...?
                            <br> 그것 또한 Y O L O !
                            <br>학업에 지친 마음을 집에서 행복하게 녹이자 !
                            <br>
                            <br>
                            <br>
                            <a href="https://www.youtube.com" target="_blank">여러분이 원하는 거 마음껏 보시라구,,, </a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di2" class=di style="left:465px; top:535px;font-size:4em;z-index:3;">
            <a href=#open2>인사동</a>
        </div>
        <div class=white_content id=open2>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/인사동.jpg" width="400px">
                        </td>
                        <td style="width:60%">
                            	인사동은 도심 속에서 낡지만 귀중한 전통의 물건들이 교류되는 소중한 공간이다.
                            <br> 쌈지길은 기본! 화랑, 전통공예점, 고미술점, 전통찻집, 전통음식점, 카페까지,,,,!
                            <br> 그냥 너무 예쁘다. 볼 것도 갈 곳도 많다.
                            <br>
                            <br> 조금만 더 걸어보면 북촌 한옥마을부터 경복궁, 광화문, 청계천,,,,
                            <br> 하루 날 잡고 가서 옛날 구경도 해보고 맛있는 것도 많이 먹으면서 여유를 즐겨보는 건 어떨까?
                            <br>
                            <br>
                            <b>아마 엄청 행복해질걸 ! </b>
                            <br> 꿀팁 : 토요일/일요일은 차 없는 거리랍니다 !!
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di3" class=di
			style="left: 950px; top: 80px; font-size: 3em; z-index: 3;">
			<a href=#open3>노래방</a>
		</div>
		<div class=white_content id=open3>
			<div>
			<form name="music" id="music" method="post">
				<table class=tb style="padding: 40px;width:100%;">
					<tr>
						<td colspan=5 style="width: 70%">
						요즘 노래방 시설들이 많이 늘고 있죠? <br>
							특히나 노래방에서 스트레스를 많이 푼다고 합니다! <br>
							여러분은 노래방에서 어떤 노래를 많이 부르시나요?<br>
						</td>
						</tr>
					<tr>
						<td><input type="radio" value="랩,힙합" name="music">랩/힙합
						</td>
						<td><input type="radio" value="발라드" name="music">발라드
						</td>
						<td><input type="radio" value="댄스" name="music">댄스
						</td>
						<td><input type="radio" value="POP" name="music">POP
						</td>
						<td><input type="radio" value="가요" name="music">가요
						</td>
					</tr>
					<tr>
						<td colspan=5 align=center style="padding-top: 40px;"><input
							type="button" value="제출" class="submit" onclick="javascript:pop_up_post2();"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan=4 align=right><a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
        <div id="di4" class=di style="left:240px; top:120px;font-size:4em;z-index:3;">
            <a href=#open4>이대</a>
        </div>
        <div class=white_content id=open4>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img src="image/이대.jpg"
                                width="400px">
                        </td>
                        <td style="width:60%">
                            젊음과 역사가 공존하는
                            <b>이화여대</b>!
                            <br> 예쁘고 저렴한 옷가게도 많고 맛있는 밥집도 많다 !!
                            <br> 하루 날 잡고 가게란 가게는 다 들어가서 구경하고 그러다보면
                            <br> 어느새 달이 뜰지도 몰라 ^_^
                            <br> 학교 밖에서 신나게 놀다가 한번쯤은 이화여대에 가서 옛 전통도 구경해볼까?
                            <br> 이대 밖에서 놀기만 하기엔 너무 아까워!
                            <br>
                            <br>
                            <a href="http://korean.visitkorea.or.kr/kor/bz15/where/where_main_search.jsp?cid=130949" target="_blank">가는 김에 이화여대 자연사 박물관 가보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di5" class=di style="left:775px; top:53px;font-size:5em;z-index:3; ">
            <a href=#open5>신촌</a>
        </div>
        <div class=white_content id=open5>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/신촌.jpg" width="400px">
                        </td>
                        <td style="width:60%">
                            '신촌을 못가'라는 노래에선 왜 신촌을 못갈까?
                            <br> "신촌을 못가 한번을 못가 혹시 너와 마주칠까 봐"
                            <br> .
                            <br> .
                            <b>서울 부심의 하나이고 근천에 서강대, 연세대, 이화여자대, 홍익대 등 대학 캠퍼스들이 많고
                                <br> 쇼핑을 할 수 있는 유플렉스가 있으며 번화가</b>인 이
                            <b>"신촌"</b> 놀러오세요!
                            <br>
                            <br>
                            <a href="https://www.youtube.com/watch?v=kovTTwKz5cU" target="_blank">신촌을 못가 듣고오기</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di6" class=di style="left:660px; top:515px;font-size:6em;z-index:3; ">
            <a href=#open6>한강</a>
        </div>
        <div class=white_content id=open6>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/한강.jpg" width="400px">
                        </td>
                        <td style="width:60%">
                            한강, 특히 한강공원은 우리들에게 아주 자유로운 곳이다.
                            <br> 한강공원이 무려 13 개가 있어서 골라서 갈 수 있는 재미도 있고,
                            <br> 가끔 열리는 길거리 공연과 봄의 벚꽃축제, 여름의 수영장, 불꽃축제,
                            <br> 그리고 친구들과의 소풍은 지친 마음들을 바람과 함께 날려주는 것 같다!!
                            <br> BUT 무리해서 뛰어다니면 더 지칠 수도 있을지 몰라요,,,,
                            <br>
                            <br>
                            <a href="https://www.youtube.com/watch?v=d6CuKpcF7kE" target="_blank">한강에서 촬영한 무모한 도전 보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di7" class=di style="left:290px; top:400px;font-size:7em; ">
            <a href=#open7>고시촌</a>
        </div>
        <div class=white_content id=open7>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <!-- 고시촌 사진 없음 ㅜㅜ -->
                            <img class=im src="image/고시촌.JPG" width="400px">
                        </td>
                        <td style="width:60%">제일 유명한 고시촌은 "신림 녹두거리" 와 "노량진"
                            <br> 특히 우리
                            <b>미림인</b>들에게 가장 소중할 신림 고시촌!!
                            <br> 물가가 싸서 맛있는 것도 재밌는 것도 조금 더 저렴하게 할 수 있다.
                            <br>
                            <a href="http://www.diningcode.com/list.php?query=%EC%8B%A0%EB%A6%BC%EA%B3%A0%EC%8B%9C%EC%B4%8C" target="_blank">신림 고시촌 맛집도 궁금해?</a>

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div id="di8" class=di style="left:350px; top:20px;font-size:9em; ">
            <a href=#open8>영화관</a>
        </div>
        <div class=white_content id=open8>
        <div>
            	<div style="padding:20px 30px;margin:auto;">
				            <h3>당신은 영화를 볼 때 무슨 음식을 먹나요?</h3> 
							<form action="movieSave.jsp">
								<input type="radio" name="movie" value="나쵸">나쵸
								<input type="radio" name="movie" value="팝콘">팝콘
								<input type="radio" name="movie" value="오징어">오징어 
								<input type="radio" name="movie" value="햄버거">햄버거
								<input type="radio" name="movie" value="탄산음료">탄산음료(음료만 먹을 시에) 
								<input type="radio" name="movie" value="맥주" disabled>맥주
								<input type="radio" name="movie" value="기타">기타&nbsp;&nbsp;&nbsp;
								<input type="submit">
							</form>
				</div>
                        <div id="piechart" style="width: 100%; height: 500px;margin:auto;"></div>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
            </div>
        </div>
        <div id="di9" class=di style="left:235px; top:195px; font-size:11em; ">
            <a href=#open9>홍대</a>
        </div>
        <div class=white_content id=open9>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img src="image/홍대.jpg" width="400px">
                        </td>
                        <td style="width:60%">서울 지하철 2호선 홍대입구역에서 홍익대학교까지의 길을 중심으로 형성된
                            <br>
                            <b>‘홍대 앞 거리’</b>는 독특하고 자유로운 문화가 있는 곳이다.
                            <br> 미술대학이 특히 유명한 홍익대학교 인근에는 갤러리, 아트샵, 미술학원이 많아
                            <br>
                            <b>예술적인 거리 풍경</b>을 만들어낸다.
                            <br> 정기적으로
                            <b>프리마켓</b>이 열려
                            <br>아마추어 예술가들이 직접 만든 소품, 작품을 감상하고 구매할 수 있다.
                            <br>
                            <br>
                            <br>
                            <a href="https://www.sangsangmadang.com/info/HD" target="_blank">홍대 상상마당 놀러가기</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div id="di10" class=di style="left:850px; top:420px;font-size:12em; ">
            <a href=#open10>맛집</a>
        </div>
        <div class=white_content id=open10>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img src="image/맛집.jpg"
                                width="380px">
                        </td>
                        <td style="width:60%">우리에게 젤 필요한 맛 집 !
                            <br> 우리 학생들에게 가장 중요한 것은 아무래도
                            <b>가성비</b> 아닐까?!
                            <br> 아주아주 맛있고 가격도 좋으면 너무너무 행복해진다.
                            <br> 그래서 맛집
                            <b>3위</b>!!!
                            <br>
                            <br>
                            <br>
                            <a href="https://www.diningcode.com/isearch.php?query=%EA%B0%80%EC%84%B1%EB%B9%84" target="_blank">맛집 찾아볼까?</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="di11" class=di
			style="left: 850px; top: 130px; font-size: 13em;">
			<a href=#open11>카페</a>
		</div>
		<div class=white_content id=open11>
			<div>
				<form name="cafe" id="cafe" method="post">
				<table class=tb style="padding: 40px; width:100%;">
					<tr>
						<th colspan="4" style="padding-top: 50px; padding-bottom: 75px;">
							Q. 카페에서 주로 무엇을 하면서 스트레스를 해소하나요?</th>
					</tr>
					<tr>
						<td><input type="radio" value="음료 마시기" name="cafe">음료
							마시기</td>
						<td><input type="radio" value="디저트 먹기" name="cafe">디저트
							먹기</td>
						<td><input type="radio" value="수다 떨기" name="cafe">수다
							떨기</td>
						<td><input type="radio" value="기타" name="cafe">기타
						</td>
					</tr>
					<tr>
						<td colspan=4 align=center style="padding-top: 40px;"><input
							type="button" value="제출" class="submit" onclick="javascript:pop_up_post();"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan=4 align=right><a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
        <div id="di12" class=di style="left:565px; top:150px;font-size:20em; ">
            <a href=#open12>집</a>
        </div>
        <div class=white_content id=open12>
            <div>

                <table class=tb style="padding:40px;">
                    <tr>
                        <td>
                            <img class=im src="image/집.jpg" width="400px">
                        </td>
                        <td style="width:60%">
                            <h2><a href="javascript:popupOpen3();">#집에_가고_싶을_때_하는_심리테스트_하러가기</a></h2>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href=#close class="yellowBtn">&nbsp닫기&nbsp</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>

</html>

