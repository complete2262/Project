<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#" data-blockbyte-bs-uid="86859"><head>
		<title>Presto</title><link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
	<style>
x	
/*
 * Line Drop Background
 */
#background {
    position: fixed;
    left: 50%;
    top: 50%;
    transform: rotate(-45deg);
    z-index: 1;
}

#background .line {
    position: absolute;
}

/*
 * Header
 */
header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 40px;
    z-index: 3;
    background: #fff;
    border-bottom: 1px solid #ddd;
}

#logo {
    float: left;
    margin: 0;
    height: 40px;
    font-size: 20px;
    line-height: 40px;
    padding: 0 20px;
}

header nav {
    float: right;
}

header nav ul {
    font-size: 0;
    text-align: left;
    margin: 0;
    padding: 0;
}

header nav ul li {
    display: inline-block;
    font-size: 16px;
    vertical-align: middle;
}

header nav ul li a {
    display: block;
    height: 40px;
    line-height: 40px;
    padding: 0 20px;
    color: #242939;
    text-decoration: none;
}

/*
 * Main
 */
main {
    position: relative;
    z-index: 2;
}

main section {
    padding-top: 50px;
    padding-bottom: 50px;
}

main .width {
    width: 1000px;
    margin-left: auto;
    margin-right: auto;
    box-sizing: border-box;
}

main section h2 {
    padding-bottom: 20px;
    text-align: center;
    margin: 0;
    font-size: 35px;
}

/*
 * Main
 */
#presto {
    text-align: center;
    padding-top: 50px;
}

#presto h2 {
    font-size: 70px;
    padding: 0;
}

#presto .description {
	color: #454a67;
    height: 70px;
	font-weight: bold;
    line-height: 30px;
    margin: 0;
    font-size: 20px;
}

#presto .main-image {
    position: relative;
    width: 800px;
    padding: 20px;
    margin-bottom: 30px;
}

#presto .main-image::before,
#presto .main-image::after {
    width: 100px;
    position: absolute;
    height: 100px;
    display: block;
    content: '';
    border: 0 solid #242939;
}

#presto .main-image::before {
    left:  0;
    top: 0;
    border-width: 5px 0 0 5px;
}

#presto .main-image::after {
    right: 0;
    bottom: 0;
    border-width: 0 5px 5px 0;
}

#presto .main-image img {
    width: 100%;
}

#presto .download {
    position: relative;
    padding-left: 60px;
	border-width: 1px;
	border-style: solid;
	border-color: #2a2f4b;
    background-position: 20px 17px;
    background-size: 25px 25px;
    background-repeat: no-repeat;
    background-image: url('../images/windows.svg');
}

#presto .download svg {
    position: absolute;
    width: 25px;
    height: 25px;
    display: block;
    left: 20px;
    top: 17px;
}

.dark {
    background: #242939;
    color: #fff;
}

.light {
    background: #fafafa;
    color: #242939;
}

main section.info {
    font-size: 0;
    padding: 200px 0;
    white-space: nowrap;
}

main section.character {
    font-size: 0;
    padding: 0;
    white-space: nowrap;
}

main section .image {
    display: inline-block;
    vertical-align: middle;
    width: 60%;
    height: 100%;
}

main section .image img {
    width: 100%;
}

main section .text-wrap {
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    width: 40%;
}

main section .text {
    display: inline-block;
    text-align: left;
    font-size: 20px;
}

main section .text h3 {
    font-size: 36px;
    margin: 0;
}

main section .text p {
    margin: 20px 0 0;
}

.clearfix::after {
    display: block;
    content: '';
    clear: both;
}
/*
 * Preview
 */
/*#preview {*/
    /*position: relative;*/
    /*width: 100%;*/
    /*padding: 30px 0;*/
    /*background: #242939;*/
    /*overflow: hidden;*/
/*}*/

/*#preview h2 {*/
    /*color: #fff;*/
/*}*/

/*#preview .images {*/
    /*position: relative;*/
    /*width: 1000px;*/
    /*height: 500px;*/
    /*margin: 0 auto;*/
/*}*/

/*#preview .images .items {*/
    /*position: absolute;*/
    /*left: 0;*/
    /*top: 0;*/
    /*transition: 1s all;*/
    /*font-size: 0;*/
    /*white-space: nowrap;*/
/*}*/

/*#preview .images .item {*/
    /*position: relative;*/
    /*display: inline-block;*/
    /*width: 1000px;*/
    /*height: 500px;*/
    /*margin-right: 50px;*/
/*}*/

/*#preview .images .item img {*/
    /*position: absolute;*/
    /*max-width: 1000px;*/
    /*max-height: 500px;*/
    /*left: 50%;*/
    /*top: 50%;*/
    /*transform: translate(-50%, -50%);*/
/*}*/

/*
 * Download
 */
/*#download {*/
    /*text-align: center;*/
/*}*/

/*!**/
 /** Features*/
 /**!*/
/*#features {*/
    /*width: 100%;*/
    /*padding: 30px 0;*/
    /*background: #242939;*/
/*}*/

/*#features h2 {*/
    /*color: #fff;*/
/*}*/

/*#features img {*/
    /*display: block;*/
    /*width: 800px;*/
    /*margin: 0 auto;*/
/*}*/

/*
 * Contact
 */
#contact {
    text-align: center;
}

footer {
    position: relative;
    padding: 15px 0;
    text-align: center;
    z-index: 2;
}

/*
 * Common
 */
.button {
    position: relative;
    display: inline-block;
    padding-left: 20px;
    padding-right: 20px;
    height: 46px;
    line-height: 46px;
    background: #454a67;
    color: #fff;
    text-decoration: none;
    font-size: 20px;
}

.button.hexa {
    margin-left: 23px;
    margin-right: 23px;
}

.button.hexa::before,
.button.hexa::after {
    position: absolute;
    display: block;
    content: '';
    top: 0;
    border-top: 23px solid transparent;
    border-bottom: 23px solid transparent;
}

.button.hexa::before {
    left: -23px;
    border-right: 23px solid #242939;
}
.button.hexa::after {
    right: -23px;
    border-left: 23px solid #242939;
}

.button.large {
    height: 60px;
    line-height: 60px;
    font-size: 17x;
}

.button.hexa.large {
    margin-left: 30px;
    margin-right: 30px;
}

.button.hexa.large::before,
.button.hexa.large::after {
    border-top-width: 30px;
    border-bottom-width: 30px;
}

.button.hexa.large::before {
    left: -30px;
    border-right-width: 30px;
}
.button.hexa.large::after {
    right: -30px;
    border-left-width: 30px;
}

.button.left {
	margin-top: 20px;
}

.button.light {
    background: #fff;
    color: #242939;
}

.button.hexa.light::before {
    border-right-color: #fff;
}

.button.hexa.light::after {
    border-left-color: #fff;
}

.blind {
    position: absolute;
    top: -100000px;
    left: -100000px;
    width: 1px;
    height: 1px;
    clip: rect(0 0 0 0);
}

/*
 * Write Animation
 */
@keyframes blink {
    15% { opacity: 1; }
    35% { opacity: 0; }
    65% { opacity: 0; }
    85% { opacity: 1; }
}

.write-animation::after {
    display: inline;
    content: '|';
    animation: blink;
    animation-duration: 1s;
    animation-iteration-count: infinite;
}

.fade {
    opacity: 0;
    transition: opacity 1s, transform 1s;
    transform: scale(1.1) translateY(-10%);
}

.fade.show {
    opacity: 1;
    transform: scale(1) translateY(0);
}</style>


			
</head>
	
	<body style="overflow:scroll;">
	<main>
		<section id="presto">
  

				
			<p id="presto-description" class="description write-animation">P.Dic에 궁금한것들을 물어보세요!</p>
			<div class="main-image width">
		
<div id="titlelogo"></div>
			</div>
			<a href="index" style="font-size: 20px;" class="btn btn-success">Click To Start P.Dic</a>
		</section>

		<section class="info dark">
			<h2 class="blind">라이브러리 관리</h2>

			<div class="width fade show">
				<div class="image"><img src="resources/images/mainbook.png" align="[Hidden Title]"></div>
				<div class="text-wrap">
					<div class="text">
						<h3>P.Dic</h3>
						<p>
							P.Dic은 Programing dictionary의 약자입니다<br>
							P.Dic은 코드에디터와 눈싸움하는 모든 개발자들을 응원합니다<br>
						</p>
					</div>
				</div>
			</div>
		</section>

		<section class="info light">
			<h2 class="blind">스킨 시스템</h2>

			<div class="width fade show">
				<div class="text-wrap">
					<div class="text">
						<h3>사용중인 언어별로 <br>질문을 올려보세요!</h3>
						<p>
			
						</p>
					</div>
				</div>
				<div class="image" style="box-shadow: 0px 0px 20px #000;"><img src="resources/images/ct1.png" align="[Hidden Title]"></div>
			</div>
		</section>


		
		<section id="contact" class="dark">
			<h2>CONTACT</h2>

			<a href="#" class="button light">Email</a>
			<a href="#" class="button light">Facebook</a>
		</section>
	</main>

	   <!--하단 footer-->
   <div class="container-fluid" id="fixedfooter">
      <hr>
      <div class="row">
         <div class="text-center col-lg-6 offset-lg-3">
            <h5>정상원 · 이하은</h5>
            <p>
               Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                  href="#">PDic</a>
            </p>
         </div>
      </div>
   </div>

   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
      <script src="resources/js/jquery-3.2.1.min.js"></script>

  <script>
  $(document).ready(function(){
      $.ajax({
          type:"get",
          url: "pdiclogo",
          success : function(result){
             $("#titlelogo").html(result);
          }//석세스
       });//ajax
  });
  
  </script>
</body></html>

