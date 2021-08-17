<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import= "java.io.*, java.util.*" %>

<%@ page import="Learning.*" %>
<jsp:useBean id="Learn" class="Learning.video" scope="page" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
</head>
<body>
<%
	String [] target = {"N001", "N002", "N003", "S002", "W003"};
	String [] agent = {"N003"};
	String content_s_user_id = (String)session.getAttribute("session_userid");
	String content_p_user_id = request.getParameter("user_id");
	String content_attack = request.getParameter("id");
	String content_type = request.getParameter("type");
	String content_id = request.getParameter("conid");

	try{
		if( !(content_s_user_id.equals(content_p_user_id))) {		//다를때
			out.println("<script>alert('잘못된 접근 입니다.');location.href='train.jsp';</script>");
		}
	}catch(NullPointerException e){
		out.println("<script>alert('잘못된 접근 입니다.');location.href='train.jsp';</script>");
	}
%>
    <center>
    <article>

        <!-- 헤더 시작 -->
        <header id="wordpage_header">
            <div>
                <div id="logo_box" onclick="location.href='train.jsp'">
                    <img id='logo_img' src='/resources/images/top_bottom/logo.png'>
                    <div id='logo_txt'>
                        <span id='logo_txt_left'>내일</span>
                        <span id='logo_txt_right'>Cyber Agis<br>Training Platform</span>
                    </div>
                </div>
                <div class="dict_btn" style="width:150px;" onclick="location.href='#'">
                    <%=content_attack%>
                </div>
            </div>
        </header>
        <!-- 헤더 끝 -->

        <div id="big_contain" style="min-height:82vh; box-shadow: inset 0 -5px 10px -2px #ccc; padding-bottom:15px;">
            <div id="left_contain" class="side_bar_menu">
                <ul id="side_bar_menu_1">
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Manual</a>
                        <ul>
                            <li><a id="train" href="#">실습 방법</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Learning</a>
                        <ul>
                            <li><a id="video" href="#">학습영상</a></li>
                            <li><a id="test" href="#">문제풀이</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Attacker</a>
                        <ul>
                            <li><a id="at1" href="#">Attacker 1</a></li>
                        </ul>
                    </li>
					<%
						try {
							int t = Arrays.binarySearch(target, content_id);
							%>
								<script>
									//console.log('<%=t%>');
									//console.log('<%=Arrays.toString(target)%>');
									//console.log('<%=content_id%>');
								</script>
							<%
							if (t >= 0){
					%>
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Target</a>
                        <ul>
                            <li><a id="t1" href="#">Target 1</a></li>
                        </ul>
                    </li>
					<%
							}
						}catch (ArrayIndexOutOfBoundsException e) {}
					%>
					<%
						try {
							int a = Arrays.binarySearch(agent, content_id);
					%>
								<!-- <script>console.log('<%=a%>');</script> -->
					<%
							if (a >= 0){
					%>
							<li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Agent</a>
								<ul>
									<li><a id="a1" href="#">Agent 1</a></li>
								</ul>
							</li>
					<%
							}
						}catch (ArrayIndexOutOfBoundsException e) {}
					%>
                </ul>
            </div>

            <script type='text/javascript'>
                $(window).on('load', function(){
					var content_attack = "<%=content_attack%>".toLowerCase();
					var type = "<%=content_type%>";
					var at1_vnc_url = "";
					var t1_vnc_url = "";
					var a1_vnc_url = "";


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
						<%if ( content_id.equals("N001") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.PNG"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

                            else if ( cid == "at1" ){
                                if ( at1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "dns", type: type, role: cid}
                                    }).done(function(data){
                                        //console.log(data);
                                        at1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(at1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(at1_vnc_url));
                                }
                            }
                            else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "dns", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
                            }

						<%}
						else if ( content_id.equals("N002") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.jpg"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

                            else if ( cid == "at1" ){
                                if ( at1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "scan", type: type, role: cid}
                                    }).done(function(data){
                                        console.log(data);
                                        at1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(at1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(at1_vnc_url));
                                }
                            }
                            else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "scan", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
                            }


						<%}
						else if ( content_id.equals("N003") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.png"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
										<div id="myDIV" style="margin: 60px 40px 60px 40px;">\
											<video\
												id="vid"\
												src="<%=Learn.getVideo(content_id)%>.mp4"\
												width="80%"\
												controls>\
											</video>\
										</div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
								try {
									session.removeAttribute("s_answer_list");
								}catch(err){
									;
								}
								$('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
										<iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
											style="width:100%; height:100vh;" \
											frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
											onclick="next_test_url(<%=content_id%>)" \
										></iframe>\
                                    </div>');
                            }

							else if ( cid == "at1" ){
								if ( at1_vnc_url == "" ){
									$('#right_contain').html('<text>잠시만 기다려주세요.</text>');
									$.ajax({
										url : "vnc_url.jsp",
										type : "POST",
										dataType : 'json',
										data : {content_attack: "smurf", type: type, role: cid}
									}).done(function(data){
										//console.log(data);
										at1_vnc_url = data.url;
										$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
										$("#vnc_url").attr("src",String(at1_vnc_url));
									});
								}else{
									$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
									$("#vnc_url").attr("src",String(at1_vnc_url));
								}
							}
                            else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
										data : {content_attack: "smurf", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
							}
                            else if ( cid == "a1" ){
                                if ( a1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
										data : {content_attack: "smurf", type: type, role: cid}
                                    }).done(function(data){
                                        a1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(a1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(a1_vnc_url));
                                }
							}
						<%}
						else if ( content_id.equals("S001") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.png"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

							else if ( cid == "at1" ){
								if ( at1_vnc_url == "" ){
									$('#right_contain').html('<text>잠시만 기다려주세요.</text>');
									$.ajax({
										url : "vnc_url.jsp",
										type : "POST",
										dataType : 'json',
										data : {content_attack: "back", type: type, role: cid}
									}).done(function(data){
										//console.log(data);
										at1_vnc_url = data.url;
										$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
										$("#vnc_url").attr("src",String(at1_vnc_url));
									});
								}else{
									$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
									$("#vnc_url").attr("src",String(at1_vnc_url));
								}
							}
	
                            else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "back", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
                            }

						<%}
						else if ( content_id.equals("S003") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.png"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

							else if ( cid == "at1" ){
								if ( at1_vnc_url == "" ){
									$('#right_contain').html('<text>잠시만 기다려주세요.</text>');
									$.ajax({
										url : "vnc_url.jsp",
										type : "POST",
										dataType : 'json',
										data : {content_attack: "passwd", type: type, role: cid}
									}).done(function(data){
										//console.log(data);
										at1_vnc_url = data.url;
										$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
										$("#vnc_url").attr("src",String(at1_vnc_url));
									});
								}else{
									$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
									$("#vnc_url").attr("src",String(at1_vnc_url));
								}
							}
	
                            else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
										data : {content_attack: "passwd", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
                            }

						<%}
						else if ( content_id.equals("W001") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.png"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

							else if ( cid == "at1" ){
								if ( at1_vnc_url == "" ){
									$('#right_contain').html('<text>잠시만 기다려주세요.</text>');
									$.ajax({
										url : "vnc_url.jsp",
										type : "POST",
										dataType : 'json',
                                        data : {content_attack: "xss", type: type, role: cid}
									}).done(function(data){
										at1_vnc_url = data.url;
										$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
										$("#vnc_url").attr("src",String(at1_vnc_url));
									});
								}else{
									$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
									$("#vnc_url").attr("src",String(at1_vnc_url));
								}
							}
						<%}
						else if ( content_id.equals("W003") ) {%>
							if ( cid == "diagram" ){
								$('#right_contain').html('<div id="diagram_picture"><img style="width:70%;" src="resources/dict/<%=content_id%>/diagram.png"></div>');
							}
							else if ( cid == "train" ){
								$('#right_contain').html('\
									<div style="" id="train_way">\
										<h4>실습 방법</h4>\
                                        <iframe src="./train_pdf.jsp?type=<%=content_type%>&conid=<%=content_id%>" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                        ></iframe>\
									</div>');
							}
                            else if ( cid == "video" ){
                                $('#right_contain').html('\
                                    <div style="" id="video_way">\
                                        <h4>학습영상</h4>\
                                        <div id="myDIV" style="margin: 60px 40px 60px 40px;">\
                                            <video\
                                                id="vid"\
                                                src="<%=Learn.getVideo(content_id)%>.mp4"\
                                                width="80%"\
                                                controls>\
                                            </video>\
                                        </div>\
                                    </div>');
                            }
                            else if ( cid == "test" ){
                                try {
                                    session.removeAttribute("s_answer_list");
                                }catch(err){
                                    ;
                                }
                                $('#right_contain').html('\
                                    <div style="" id="test_way">\
                                        <h4>문제풀이</h4>\
                                        <iframe id="quiz_url" src="./lms/quiz.jsp?quiz_id=<%=content_id%>&n=1" \
                                            style="width:100%; height:100vh;" \
                                            frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0 \
                                            onclick="next_test_url(<%=content_id%>)" \
                                        ></iframe>\
                                    </div>');
                            }

							else if ( cid == "at1" ){
								if ( at1_vnc_url == "" ){
									$('#right_contain').html('<text>잠시만 기다려주세요.</text>');
									$.ajax({
										url : "vnc_url.jsp",
										type : "POST",
										dataType : 'json',
                                        data : {content_attack: "replay", type: type, role: cid}
									}).done(function(data){
										at1_vnc_url = data.url;
										$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
										$("#vnc_url").attr("src",String(at1_vnc_url));
									});
								}else{
									$('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
									$("#vnc_url").attr("src",String(at1_vnc_url));
								}
							}
		                    else if ( cid == "t1" ){
                                if ( t1_vnc_url == "" ){
                                    $('#right_contain').html('<text>잠시만 기다려주세요.</text>');
                                    $.ajax({
                                        url : "vnc_url.jsp",
                                        type : "POST",
                                        dataType : 'json',
                                        data : {content_attack: "replay", type: type, role: cid}
                                    }).done(function(data){
                                        t1_vnc_url = data.url;
                                        $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                        $("#vnc_url").attr("src",String(t1_vnc_url));
                                    });
                                }else{
                                    $('#right_contain').html('<iframe id="vnc_url" src="" sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
                                    $("#vnc_url").attr("src",String(t1_vnc_url));
                                }
                            }
						<%}%>
                    });
                });
            </script>

            <div id="right_contain">
            </div>
        </div>
        <%@ include file="bottom.jsp" %>
    </center>
</body>
</html>
