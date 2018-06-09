<%@Language="vbscript" Codepage="65001"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
    <link rel="icon" href="favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- 如果当前用户等于点击评论用户名传来的参数或者没有传的参 那么就使它等于当前用户 -->
  <%
  usid=request.QueryString("usid")
  IF session("userid")=usid or usid="" then
  usid=session("userid")
  end if
  ' 连接数据库查询用户表
    	Dim cnn, rst, sSQL
    	Set cnn = Server.CreateObject("ADODB.Connection")
    	Set rst = Server.CreateObject("ADODB.Recordset")
    	cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    	cnn.Open
    	sSQL = "SELECT * FROM users WHERE userid=" & usid
    	rst.Open sSQL, cnn
      rs8=cnn.execute("select * from users where userid=" & session("userid"))
  %>

  <title><%=rst("username")%>的个人主页</title>
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

  <!-- 头像 -->
  <div class="UserAvatar">
    <img  width="160" height="160" src="avatars/<%=rst("avatar")%>">
  </div>


<!-- 写用户信息 -->
<h1 class="username"><%=rst("username")%></h1>


<!-- 自我介绍为空 placeholder -->
<%
if rst("intro")="" Then
response.write      "<div class='signature'>该用户正在思考一个伟大的签名</div>"
else
response.write      "<div class='signature'>" & rst("intro") & "</div>"
end if
%>

<!-- 编辑个人资料按钮 -->
<% if CInt(session("userid"))=CInt(usid) then%>

<button  class="btn btn-success" align="right" onclick="window.open('useredit.asp')">编辑个人资料</button>
<% else %>

<!-- 关注和取消关注按钮 -->
   <%sql11="select * from friend where [userid]='" & session("userid") & "' and [friendid]='" & usid & "'"
   set rsg=cnn.execute(sql11)
   if rsg.eof then  %>
<button  class="btn btn-success" align="right" onclick="window.open('addfriend.asp?ussid=<%=rst("userid")%>')">关注ta</button>
   <%else%>
   <button  class="btn btn-success" align="right" onclick="window.open('delfriend.asp?ussid=<%=rst("userid")%>')">取消关注</button>
   <%end if%>
<%end if%>

</div>
</div>
  </div>
<hr>
<div class="container">
<div class="row">
  <div class=" col-md-3">

<!-- 关注列表 -->
    <%
    Set rsfri=Server.CreateObject("ADODB.Recordset")
    Set rsfri.ActiveConnection = Cnn
    rsfri.CursorType = 3
    rsfri.Open "select * from friend where userid='"&usid&"'"
    rcount=rsfri.Recordcount%>

<h2><% if session("userid")=CInt(usid) then%><a>我的关注&nbsp&nbsp<%=rcount%></a>
       <%else%><a>ta的关注&nbsp&nbsp<%=rcount%></a>
       <%end if%>
</h2>

<!-- 显示关注人 -->
<div class="follow">
<%while not rsfri.eof
Set rsf=Server.CreateObject("ADODB.Recordset")
Set rsf.ActiveConnection = Cnn
rsf.Open "select * from users where userid=" & rsfri("friendid") %>

<div>  <a href="profile.asp?usid=<%=rsfri("friendid")%>" class="UserAvatar"><img  width="60" height="60" src="avatars/<%=rsf("avatar")%>"></a>
  <a style="line-height: 4;" href="profile.asp?usid=<%=rsfri("friendid")%>"><%=rsf("username")%></a></div>
<%n=n+1
rsfri.movenext
wend%>
</div>

<!-- 粉丝列表 -->
    <%
    Set rsfans=Server.CreateObject("ADODB.Recordset")
    Set rsfans.ActiveConnection = Cnn
    rsfans.CursorType = 3
    rsfans.Open "select * from friend where friendid='"& usid &"'"
    rcount1=rsfans.Recordcount%>

<h2><% if session("userid")=CInt(usid) then%><a>我的粉丝&nbsp&nbsp<%=rcount1%></a>
       <%else%><a>ta的粉丝&nbsp&nbsp<%=rcount1%></a>
       <%end if%>
</h2>

<!-- 显示粉丝 -->
<div class="follow">
<%while not rsfans.eof
Set rsf1=Server.CreateObject("ADODB.Recordset")
Set rsf1.ActiveConnection = Cnn
rsf1.Open "select * from users where userid=" & rsfans("userid") %>

<div><a href="profile.asp?usid=<%=rsf1("userid")%>" class="UserAvatar"><img  width="60" height="60" src="avatars/<%=rsf1("avatar")%>"></a>
  <a style="line-height: 4;" href="profile.asp?usid=<%=rsf1("userid")%>"><%=rsf1("username")%></a></div>
<%n=n+1
rsfans.movenext
wend%>
</div>

<!-- 个人资料显示 -->
<div class="personal">
    <h1>个人资料</h1>
    <%response.write "<p>📞&nbsp电话：   " &rst("tel")& "</p>"
    response.write "<p>🌏&nbsp所在城市：   " &rst("city")& "</p>"
    response.write "<p>📧&nbsp邮箱：    " &rst("email")&" </p>"
    response.write "<p>🔮&nbsp性别：    " &rst("sex")&" </p>"
    response.write "<p>🍉&nbsp生日：   " &rst("birth")& "</p>"
    response.write "<p>🚵‍&nbsp加入于：   " &rst("regtime")& "</p>"

    %>
</div>
  </div>


<!-- 我评过分的电影显示 -->
<div class="mycomments col-md-7">

<!-- 功能导航条 -->
<div class="tag-list">
  <ul class="nav nav-tabs" style="padding-bottom:0">
<% if session("userid")=cint(usid) then%>
     <li data-toggle="tab"><a href="moments.asp" >好友动态</a></li>
     <li><a href="profile.asp" data-toggle="tab">我的影评</a></li>
<%else%><li><a href="profile.asp?usid=<%=rst("userid")%>"><%=rst("username")%>的影评</a></li>
<%end if%>
<li><a href="myrate.asp?usid=<%=rst("userid")%>">评过分的电影</a></li>
<li class="active"><a href="mylikes.asp?usid=<%=rst("userid")%>">点过赞的评论</a></li>
<li><a href="myboard.asp?usid=<%=rst("userid")%>">留言板</a></li>
</ul>
</div>
<br>


<div class="contentwrapper">
<%
set rs= cnn.execute("select * from likes where userid='" & usid &"'and [status]=true ")
if rs.eof then
response.write "<div class='item'> 还没有点过赞噢。 </div>"
%>
<%end if%>

<% While Not rs.eof
id=cint(rs("commentid"))
set rs1=cnn.execute("select * from comment where [commentid]="&id)
set rs2=cnn.execute("select * from users where [userid]="&cint(rs1("userid")))
set rs3=cnn.execute("select * from movie where [movieid]='"&rs1("movieid")&"'")%>
<div class="item">
        <div class="status"><a href="profile.asp?usid=<%=rs2("userid")%>"><%=rs2("username")%></a>&nbsp&nbsp评论于：<%=rs1("commenttime")%></div>
        <a style="position:relative;display:block;"  href="detail.asp?movid=<% =rs3("MovieId") %>" target="view_window">        <div class="moviename"><%=rs3("moviename")%></div></a>
        <div class="words"><%=rs1("content")%></div>
        <div class="likes" style="float:right">赞&nbsp<%=rs1("likes")%></div>
</div>

<%
n=n+1
rs.movenext
wend
%>
</div>
  </div>


  <!-- 收藏夹 -->
<div class="favorites col-md-2">
<a href="myfavorites.asp?ussid=<%=rst("userid")%>">
  <% if session("userid")=cint(usid) then%>   <h2>我的收藏夹</h2></a>
  <%else%><h2><%=rst("username")%>的收藏夹</h2></a>
  <%end if%>


<%
set rs2=cnn.execute("select * from favorites where userid='" & usid &"'")
if rs2.eof then
response.write "<div class='item'> 还没有收藏任何电影喔~ </div>"
%>

<%
end if
%>

<% While Not rs2.eof
id1=rs2("movieid")
set rs3=cnn.execute("select * from movie where movieid='"& id1 &"'")%>
<div >
        <div class="content"><%=rs3("moviename")%></div>
        <a class="fav"style="position:relative;display:block;"  href="detail.asp?movid=<% =rs2("MovieId") %>" target="view_window"><img src="posters/<% =rs2("MovieId") %>.jpg" alt="" height="200px" width="135px"></a>
</div>
<%
n=n+1
rs2.movenext
wend
%>
</div>
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
