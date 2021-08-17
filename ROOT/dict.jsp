<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
</head>

<body>
    <center>
    <article>

        <!-- 헤더 시작 -->
        <header id="wordpage_header">
            <div>
                <div id="logo_box" onclick="location.href='/'">
                    <img id='logo_img' src='/resources/images/top_bottom/logo.png'>
                    <div id='logo_txt'>
                        <span id='logo_txt_left'>내일</span>
                        <span id='logo_txt_right'>Cyber Agis<br>Training Platform</span>
                    </div>
                </div>
                <div class="dict_btn" onclick="location.href='#'">
                    용어사전
                </div>
            </div>
        </header>
        <!-- 헤더 끝 -->
		
        <div id="big_contain" style="min-height:82vh; box-shadow: inset 0 -5px 10px -2px #ccc; padding-bottom:15px;">
            <div id="left_contain" class="side_bar_menu">
                <ul id="side_bar_menu_1">
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Network</a>
                        <ul>
                            <li><a id="N001" href="#">DNS Spoofing</a></li>
                            <li><a id="N002" href="#">Syn Flooding</a></li>
                            <li><a id="N003" href="#">Smurf Attack</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>System</a>
                        <ul>
                            <li><a id="S001" href="#">Back Door</a></li>
                            <li><a id="S002" href="#">Scanning Attack</a></li>
                            <li><a id="S003" href="#">password Crack</a></li>
                        </ul>
					</li>
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Web</a>
                        <ul>
                            <li><a id="W001" href="#">XSS</a></li>
                            <li><a id="W002" href="#">SQL Injection</a></li>
                            <li><a id="W003" href="#">Replay Attack</a></li>
                        </ul>
					</li>
                </ul>
            </div>

            <script type='text/javascript'>
                $(window).on('load', function(){
                    var menuids = ["side_bar_menu_1"];

                    for(i = 0 ; i < menuids.length ; i++){
                        var ultags = document.getElementById( menuids[i] ).getElementsByTagName("ul");

                        for(t = 0 ; t<ultags.length ; t++){
                            ultags[t].parentNode.getElementsByTagName("a")[0].className += "subfolderstyle";

                            if(ultags[t].parentNode.parentNode.id == menuids[i]){
                                ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px";
                            }
                            else{
                                ultags[t].style.left = ultags[t-1].getElementsbyTagName("a")[0].offsetWidth+"px";
                            }
                            
                            $(ultags[t].parentNode.getElementsByClassName('subfolderstyle')[0]).click(function(){
                                if( this.parentNode.getElementsByTagName("ul")[0].style.display == "none" ){
                                    this.parentNode.getElementsByTagName("ul")[0].style.display = "block";
                                    this.parentNode.getElementsByTagName("img")[0].src = "/resources/images/dict/down_arrow.png";
                                }
                                else{
                                    this.parentNode.getElementsByTagName("ul")[0].style.display = "none";
                                    this.parentNode.getElementsByTagName("img")[0].src = "/resources/images/dict/right_arrow.png";
                                }
                            });
                        }

                        for(var t=ultags.length-1 ; t > -1 ; t--){
                            ultags[t].style.visibility = "visible";
                            ultags[t].style.display = "none";
                        }
                    }

                    $('.side_bar_menu ul li ul li a').click(function(){
                        // $('.side_bar_menu ul li ul li a').remove(".circle");
                        //$('.side_bar_menu ul li ul li a').css('color', '#282c34');
						$('.side_bar_menu ul li ul li a').attr('style', 'none');
                        $(".circle").remove();
                        $(this).css('color', '#2dc758');
                        $(this).append('<div class="circle">');
						var cid = $(this).attr('id');
						$.ajax({
								url : "dict_content.jsp",
								type : "POST",
								dataType : 'json',
								data : {cid: cid}
						}).done(function(data){
							$('#title').text(data.title);
							$('#type').text(data.type);
							$('#content').html(data.content);
						});
                    });
                });
            </script>
            
            <div id="right_contain">
                <h1 id=title></h1>

                <h4>타입</h4>
                <text id=type></text>

                <h4>내용</h4>
                <text id=content></text>
            </div>
        </div>
		<%@ include file="bottom.jsp" %>	
	</center>
</body>
</html>
