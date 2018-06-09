<% @ LANGUAGE = "VBScript" Codepage="65001" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/moviedetail.css">
  <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="css/movielistview.css">

  <%set conn=Server.CreateObject("ADODB.Connection")
    conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    set rs1=conn.execute("select * from movielist")
  %>

	<title><%=rs1("movielisttitle")%>影单详情页</title>
  <style>
   li{list-style: none;}
   a{text-decoration-style: none;}

   select {
/*/关键：将默认的select选择框样式清除/*/
appearance:none;
-moz-appearance:none;
-webkit-appearance:none;
/*background: url("icon/1.png") no-repeat scroll right center transparent;*/
/*/非框架时，为下拉小箭头留出一点位置，避免被文字覆盖/*/
padding-right: 10px;
height: 26px;
}

  </style>

</head>

<body><!--导航栏制作-->
<div class="navbar navbar-default" style="margin-bottom: 1px;">
  <div class="container">
   <div class="navbar-header">
    <!-- 图标 -->
    <a href="index.asp" target="view_window"><img width="80px" height="56px" src="img/1.png"></a>
   </div>

<nav class="nav navbar-nav">
<li><a href="index.asp" target="view_window">首页</a></li>
<li><a href="lists.asp" target="view_window">电影列表</a></li>
<li><a href="movielistview.asp" target="view_window">影单推荐</a></li>
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

<nav class="nav profile navbar-nav navbar-right ">
<% If Session("UserName") = "" Then %>
  <li><a href="login.asp" target="view_window">登录</a></li>
  <li><a href="logup.asp" target="view_window">注册</a></li>
<% Else %>
   <% if session("username")="Admin" then%>
   <p style="margin-left: 0px;margin-right: 40px;margin-top: 15px;" class="main">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~
   &nbsp&nbsp&nbsp&nbsp<a href=admin.asp target="view_window">管理员主页</a>&nbsp;
   <a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;
   <a href=logout.asp>退出登录</a>
   <% else %>
   <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
   &nbsp&nbsp&nbsp&nbsp<a href="profile.asp?UserId=<%=Session("UserId")%>" target="view_window">个人中心</a>&nbsp;<a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;

   <a href=logout.asp>退出登录</a>
 </p>
   <%end if%>
<% end if %>
</nav>
</div>
</div>


<div class="picture" align="center">
  <img src="timg.jpg" alt="">

</div>

<!-- 循环影单信息 -->
<div class="row">
  <div class="col-md-3" style="margin-top: 40px;">
    <div class="nav_bar" style="padding-left: 40px;">
      <ul class="nav nav-pills nav-stacked">
      <%
      if rs1.eof Then%>
      <div class="">
        当前没有影单
      </div>
      <%end if%>
      <%while not rs1.EOF %>
        <li class="active">
          <a class="movielistid" href="movielistview.asp?id=<%=rs1("movielistid")%>"><%=rs1("movielisttitle")%></a>
        </li>
      <%n=n+1
      rs1.movenext
      wend%>
      </ul>

    </div>
  </div>

 <!-- 循环影单内电影信息 -->
  <div class="col-md-9">
    <fieldset class="layui-elem-field layui-field-title stronge" style=" margin-top: 30px;margin-bottom: 0px;">
      <legend><%=rs1("movielisttitle")%></legend>
    </fieldset>
    <div class="content">
      <%=rs1("content")%>
    </div>

    <%
    id=request.querystring("id")
    set rst=conn.execute("select * from movie where movielistid='"&id&"'")
    %>

    <%if rst.eof Then%>
    <div class="">
      当前影单没有记录
    </div>

    <% else%>

    <%while not rst.EOF%>
        <div class="item">
         <div class="hd"><%=rst("movieid")%></div>
        <div class="subject">
             <div class="post"><a href="detail.asp?movid=<%=rst("MovieId") %>" target="view_window"><img class="cont-pic" width="120" height="180" src="posters/<%=rst("MovieId")%>.jpg"></a></div>
             <div class="title"><a href="detail.asp?movid=<%=rst("MovieId") %>" target="view_window"><h3><%=rst("moviename")%></h3></a></div>
             <div class="rating"><%=rst("score")%>分</div>
             <div class="cast">导演：&nbsp<%=rst("director")%></div>
             <div class="cast">演员：&nbsp<%=rst("cast")%></div>
             <div class="cast">类型：&nbsp<%=rst("type")%></div>
        </div>
         </div>
    <%n=n+1
    rst.MoveNext
    wend
    end if%>
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
</div>
</body>
</html>
