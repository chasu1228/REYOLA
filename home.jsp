<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>심리테스트</title>
<style>
html,body{
            min-height: 100vh;
            min-width: 100vw;
        }
        body {
  	 	background-image: url("home/home.jpg") ;
   		background-color: #cccccc;
		}
        .parent{
            height: 100vh;
        }
        .parent>.row{
            display: flex;
            align-items: center;
            height: 100%;
        }
        .col{
            width: 200%;
        }
        .col img{
            height:200px;
            width: 100%;
            cursor: pointer;
            transition: transform 1s;
            object-fit: cover;
        }
        .col label{
            overflow: hidden;
            position: relative;
        }
        .imgbgchk:checked + label>.tick_container{
            opacity: 1;
        }
/*         aNIMATION */
        .imgbgchk:checked + label>img{
            opacity: 0.8;
        }
        .tick_container {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            cursor: pointer;
            text-align: center;
        }
        .tick {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 6px 12px;
            height: 40px;
            width: 40px;
            border-radius: 100%;
        } 
            .btn {
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #000000;
  font-size: 20px;
  background: #fffc2e;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  margin:20px;
}

.btn:hover {
  background: #ffdd00;
  text-decoration: none;
}
</style>
</head>
<body>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<form action="homeResult.jsp">
    <div class="container parent">
    <div class="row">
        <div class='col text-center'>
        <input type="radio" name="home" id="img1" class="d-none imgbgchk" value="1">
          <label for="img1">
            <img src="home/1.png" alt="문이 두 개인 집">
            <div class="tick_container">
              <div class="tick"><i class="fa fa-check"></i></div>
            </div>
            </label>
        </div>
        <div class='col text-center'>
        <input type="radio" name="home" id="img2" class="d-none imgbgchk" value="2" checked>
          <label for="img2">
            <img src="home/2.png" alt="창문이 많은 집">
            <div class="tick_container">
              <div class="tick"><i class="fa fa-check"></i></div>
            </div>
          </label>
        </div>
        <div class='col text-center'>
        <input type="radio" name="home" id="img3" class="d-none imgbgchk" value="3">
          <label for="img3">
            <img src="home/3.png" alt="지붕이 큰 집">
            <div class="tick_container">
              <div class="tick"><i class="fa fa-check"></i></div>
            </div>
          </label>
        </div>
        <div class='col text-center'>
        <input type="radio" name="home" id="img4" class="d-none imgbgchk" value="4">
            <label for="img4">
              <img src="home/4.png" alt="굴뚝이 있는 집">
              <div class="tick_container">
                <div class="tick"><i class="fa fa-check"></i></div>
              </div>
            </label>
        </div>
        <input type="submit" class="btn">
      </div>
    </div>
    </form>
</body>
</html>
