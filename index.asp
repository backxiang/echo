<% @ LANGUAGE = "VBScript" Codepage="65001" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>回响—影界听到你的回声</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="js/index.js"></script>
</head>

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


   <!--轮播图-->
   <div class="out l">
     <ul class="img ">
               <li>
                   <a href="#">
                       <img src="slider/banner.jpg" width="1010px"
                       height="500px"  alt=" ">
                   </a>
               </li>
               <li>
                   <a href="movielistview.asp?movielistid=001" target="view_window">
                       <img src="slider/banner1.jpg " width="1010px"
                       height="500px" alt=" ">
                   </a>
               </li>
               <li>
                   <a href="movielistview.asp?movielistid=002" target="view_window">
                       <img src="slider/banner2.jpg " width="1010px"
                       height="500px" alt=" ">
                   </a>
               </li>
               <li>
                   <a href="movielistview.asp?movielistid=003" target="view_window">
                       <img src="slider/banner3.jpg " width="1010px"
                       height="500px" alt=" ">
                   </a>
               </li>
               <li>
                   <a href="moviecalendar.asp" target="view_window">
                       <img src="slider/banner4.jpg " width="1010px"
                       height="500px" alt=" ">
                   </a>
               </li>
           </ul>
           <ul class="num "></ul>
          <div class="left btn "><</div>
          <div class="right btn right-btn">></div>
    </div>


  <!--电影热播列表-->

<%
Dim cnn, sSQL,strcnn,rst,count,i,n
n=1
Set cnn = Server.CreateObject("ADODB.Connection")
Set rst = Server.CreateObject("ADODB.RecordSet")
cnn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
rst.CursorType = adOpenStatic
sSQL="select top 12 * from movie order by ReleaseDate DESC"
rst.open sSQL,cnn
%>


<div class="container">

<div class="">
  <fieldset class="layui-elem-field layui-field-title stronge" style=" margin-top: 30px;margin-bottom: 0px;">
    <legend>正在热映</legend>
  </fieldset>
</div>

<div class="col-md-12" style="padding:0 5px;">
   <% While Not rst.eof %>
        <div class="col-md-3 movie-item">
          <div class="movie-item-in">
            <a style="position:relative;display:block;"  href="detail.asp?movid=<% =rst("MovieId") %>" target="view_window">
              <img src="posters/<% =rst("MovieId") %>.jpg" alt="" height="300px" width="220px" class="img1">
              <div class="item-hover"></div>
            </a>
            <div class="meta">
              <h6>
                <a href=""><% = rst("MovieName") %></a>
              <!--   <em> - 3.8分</em> -->
              </h6>

            </div>
          </div>
        </div>

<%
n=n+1
rst.movenext
wend
rst.Close
set rst=Nothing
%>
<%
cnn.Close
Set cnn = Nothing
%>

</div>
</div>

<hr>
  <!--页脚-->
<div class="footer" align="center">
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p><a href="intro.html" target="view_window">关于我们</a></p>
</div>






</body>
</html>
