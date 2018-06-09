<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>管理界面</title>
  <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="admin.css">
</head>
<body>
<%@Language="vbscript" Codepage="65001"%>
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
     <div style="margin-right: 40px;margin-top: 6px;">
     <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
     <!-- &nbsp&nbsp&nbsp&nbsp -->
     <p>
     <a href=profile.asp?UserId=<%=Session("UserId")%>>个人中心</a>&nbsp;
     <a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;
     <a href=logout.asp>退出登录</a>
   </p>
   </div>
     <% else %>
     <div style="margin-right: 40px;margin-top: 8px;">
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
<div class="container">
<div class="col-md-2 nav">
  <div class="nav_bar">
    <ul class="nav nav-pills nav-stacked">
      <li>
        <a href=userlist.asp target="test"><div class="nav_bar_i">用户管理</div> </a>&nbsp;
      </li>
      <li>
        <a href=movielist.asp target="test"><div class="nav_bar_i">电影管理</div> </a>&nbsp;
      </li>
      <li>
        <a href=UserEditadminver.asp?UserId=<%=Session("UserId")%> target="test" onClick="return newwin(this.href)" ><div class="nav_bar_i">修改用户信息</div> </a>&nbsp;
      </li>
      <li>
         <a href=calenadd.asp target="test"><div class="nav_bar_i">电影日历管理</div> </a>&nbsp;
      </li>
    </ul>

  </div>
</div>
<div class="col-md-10">
  <iframe src="userlist.asp"  name="test" frameborder="0" class="Displayarea" height="782" width="950"></iframe>
</div>

</div>







<div class="footer" align="center">
  <hr>
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
</div>

</body>
</html>
