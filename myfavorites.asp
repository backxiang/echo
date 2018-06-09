<%@Language="vbscript" Codepage="65001"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <%
  ussid=request.querystring("ussid")
  if session("userid")= ussid or ussid="" Then
  ussid=session("userid")
  end if

    Dim cnn, rst, sSQL
    Set cnn = Server.CreateObject("ADODB.Connection")
    Set rst = Server.CreateObject("ADODB.Recordset")
    cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    cnn.Open
    sSQL = "SELECT * FROM users WHERE userid=" & ussid
    rst.Open sSQL, cnn%>
  <meta charset="utf-8">
    <link rel="icon" href="favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title><%=rst("username")%>的收藏夹</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/profile.css">
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




  <div class="ProfileHeader" align="center">
<div class="card" style="background-image: url(img/cover.jpg);">
<div class="content">
  <div class="UserAvatar">
    <img  width="160" height="160" src="avatars/<%=rst("avatar")%>">
  </div>

<%
response.write      "<h1 class='username'>" & rst("username") &"</h1>"
if rst("intro")="" Then
response.write      "<div class='signature'>该用户正在思考一个伟大的签名</div>"
else
response.write      "<div class='signature'>" & rst("intro") & "</div>"
end if
%>
<!--=UserEdit.asp?UserId=<%=Session("UserId")%> onclick="return newwin(this.href)"-->
<% if session("userid")=cint(ussid) then%>  <button  class="btn btn-success" align="right" onclick="window.open('useredit.asp')">编辑个人资料</button>
<%else%>
   <%sql11="select * from friend where [userid]='" & session("userid") & "' and [friendid]='" & ussid & "'"
   set rsg=cnn.execute(sql11)
   if rsg.eof then%>
   <button  class="btn btn-success" align="right" onclick="window.open('addfriend.asp?ussid=<%=rst("userid")%>')">关注ta</button>
   <%else%><button  class="btn btn-success" align="right" onclick="window.open('delfriend.asp?ussid=<%=rst("userid")%>')">取消关注</button>
   <%end if%>
<%end if%>

</div>
</div>
  </div>
<hr>
<div class="container">
<div class="favorites">
  <% if session("userid")=cint(ussid)  or ussid="" then%>   <h2>我的收藏夹</h2></a>
  <%else%><h2><%=rst("username")%>的收藏夹</h2></a>
  <%end if%>
<hr>
<%
set rs2=cnn.execute("select * from favorites where userid='" & ussid &"'")
if rs2.eof then
response.write "<div class='item'> 还没有收藏任何电影喔~ </div>"
%>

<%
end if
%>

<% While Not rs2.eof
id1=rs2("movieid")
set rs3=cnn.execute("select * from movie where movieid='"& id1 &"'")%>
<div class="a3 col-md-3">
                <div class="a2"align="center"><%=rs3("moviename")%></div>
                <div align="center"><a href="detail.asp?movid=<% =rs2("MovieId") %>" target="view_window"><img src="posters/<% =rs2("MovieId") %>.jpg" alt="" height="300px" width="202.5px"></a></div>
                <% if session("userid")=cint(ussid)  or ussid="" then%>  <div class="a1" align="center"><a class="btn btn-success"  name="B1" onclick=window.open("favoritesdel.asp?movid=<% =rs2("MovieId") %>")>取消收藏</a></div>
                <%end if%>
</div>

<%
n=n+1
rs2.movenext
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
