<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import= "java.io.*, java.util.*" %>

<%@ page import="Monitoring.*" %>
<jsp:useBean id="Vnc" class="Monitoring.noVNC" scope="page" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/console.css">
</head>
<body>
<%
	String content_s_user_id = (String)session.getAttribute("session_userid");
	String content_s_belong = (String)session.getAttribute("session_belong");
	String admin_code = (String)session.getAttribute("session_admin_code");
	String[] id_list = Vnc.getUserList(admin_code, content_s_user_id);

	try {
		if( !(content_s_user_id.equals("")) ){		//세션값에 값이 있을때
		}
	}catch(NullPointerException e){
        out.println("<script>alert('로그인을 먼저 해주시기 바랍니다.');location.href='login.jsp';</script>");
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
            </div>
        </header>
        <!-- 헤더 끝 -->

        <div id="big_contain" style="min-height:82vh; box-shadow: inset 0 -5px 10px -2px #ccc; padding-bottom:15px;">
            <div id="left_contain" class="side_bar_menu">
                <ul id="side_bar_menu_1">
                    <li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'>Manual</a>
                        <ul>
                            <li><a id="diagram" href="#">사용방법</a></li>
                        </ul>
                    </li>
<%
					Runtime rt = Runtime.getRuntime();
					Process ps = null;
					String command = "";
					String line = "";

					for(String user : id_list){
%>
						<li><a href="#"><img class="tab_arrow" src='/resources/images/dict/right_arrow.png'><%=user%> Server</a>
										<ul>
<%
						command = String.format("python3 /naeil-package/monitor.py %s ", user);

						try{
								ps = rt.exec(command);
								BufferedReader br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream())));

									while((line = br.readLine()) != null){
										//out.print("<script>console.log('"+line+"');</script>");
										String Key = line.split(" ")[0];
										String Value = line.split(" ")[1];
%>
										<li><a id="<%=Key%>" href="#" title="<%=Value%>"><%=Key%></a></li>
<%
									}
								br.close();
							}
							catch(IOException ie){ie.printStackTrace();}
							catch(Exception e){e.printStackTrace();}
%>										
										</ul>
<%
						}
%>				
                    </li>
                </ul>
            </div>

            <script type='text/javascript'>
                $(window).on('load', function(){
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
                        $('.side_bar_menu ul li ul li a').attr('style', 'none');
                        $(".circle").remove();
                        $(this).css('color', '#2dc758');
                        $(this).append('<div class="circle">');
                        var cid = $(this).attr('id');
                        var url = $(this).attr('title');
						$('#right_contain').html('<iframe id="vnc_url" src='+url+' sandbox="allow-scripts allow-same-origin" style="width:100%; height:100vh;"></iframe>');
						
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
