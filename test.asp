<%@Language="vbscript" Codepage="65001"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>电影日历</title>
  <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="css/moviecalendar.css">
<body>
  <!--导航栏制作-->
  <div class="navbar navbar-default" style="margin-bottom: 1px;">
    <div class="container">
     <div class="navbar-header">
      <!-- 图标 -->
      <a href="index.asp" target="view_window"><img width="80px" height="56px" src="img/1.png"></a>
     </div>
  <nav class="nav navbar-nav">
  <li><a href="index.asp" target="view_window">首页</a></li>
  <li><a href="lists.asp" target="view_window">电影列表</a></li>
  <li><a href="movielistview.asp?movielistid=001" target="view_window">影单推荐</a></li>
  <li><a href="moviecalendar.asp" target="view_window">电影日历</a></li>
  </nav>

  <!-- 搜索框 -->
  <form class="form navbar-form navbar-left" type="post" action="search.asp">
  <div class="form-group searchbar">
      <select class="form-control" name="select">
        <option value="1">电影</option>
        <option value="2">用户</option>
  </div>
  <div class="form-group searchbar">
    <input type="text" name="keywords"class="form-control" placeholder="搜索你感兴趣的电影和人">
  </div>
  <button type="submit" class="btn btn-default">搜索</button>
  </form>

  <nav class="nav profile navbar-nav navbar-right" style="margin-right: 0px;">
  <% If Session("UserName") = "" Then %>
    <li><a href="login.asp" target="view_window">登录</a></li>
    <li><a href="logup.asp" target="view_window">注册</a></li>
  <% Else %>
     <% if session("username")="Admin" then%>
     <div style="margin-right: 14px;margin-top: 4px;">
     <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
     <!-- &nbsp&nbsp&nbsp&nbsp -->
     <p>
     <a href=admin.asp target="view_window">管理员主页</a>&nbsp;
     <a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;
     <a href=logout.asp>退出登录</a>
   </p>
   </div>
     <% else %>
     <div style="margin-right: 14px;margin-top: 4px;">
     <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
     <!-- &nbsp&nbsp&nbsp&nbsp -->
     <p>
     <a href="profile.asp?UserId=<%=Session("UserId")%>" target="view_window">个人中心</a>&nbsp;
     <a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;
     <a href=logout.asp>退出登录</a>
   </p>
   </div>
     <%end if%>
  <% end if %>
  </nav>
  </div>
  </div>
<!-- 导航栏结束 -->


<img style="margin:100px auto" width="1351px" height="600px"src="img/9.jpg" >
<hr>

<%
  Dim cnn, rst, sSQL
  Set cnn = Server.CreateObject("ADODB.Connection")
  Set rst = Server.CreateObject("ADODB.Recordset")
  cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  cnn.Open
%>



<% if request("d1")<>"" then d1 = request("d1")End If
   if request("d2")<>"" then d2 = request("d2")End If
   if request("week")<>"" then week = request("week")End If
    sSQL = "SELECT * FROM calendar WHERE date=#"&d1&"#"
    rst.Open sSQL, cnn
    set rsmov=cnn.execute("select * from movie where movieid='"& rst("movieid") &"'")
  %>

<div class="row">
<div class="img">  <img style="opacity:0.4" width="400px" height="600px" src="posters/<%=rst("movieid")%>.jpg" alt=""></div>
<div class="section1 col-md-6" style="background-image: url(posters/<%=rst("movieid") %>.jpg);"align="center">

<%while not rst.eof
response.write    "<div class='date' align='left'>"
response.write  d1
response.write    "</div>"
response.write    "<div class='week'align='left'>"
response.write week
%>
 &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp <span align="right" class="moviename" >
  《<%=rsmov("moviename")%>》
</span>
<%response.write    "</div>"
response.write    "<div class='day'>"
response.write"" & d2
response.write    "</div>"
%>

<div class="reason">
  【<%=rst("reason")%>】
</div>
<hr>
<span class="comma">
  “
</span>
<div class="dialog">
    <%=rst("dialog")%>
</div>
<span class="comma">
  ”
</span>
<%n=n+1
rst.movenext
wend
%>
</div>
</div>



<hr>

<div class="footer" align="center">
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
</div>

</body>
</html>
