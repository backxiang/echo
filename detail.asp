<% @ LANGUAGE = "VBScript" Codepage="65001" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/moviedetail.css">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <%
      dim movid
      movid=request.querystring("movid")
      dim conn,rsmov,strSql
      set conn=Server.CreateObject("ADODB.Connection")
          conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
      strSql="select * from movie where movieid='" & movid & "'"
      set rsmov=conn.Execute(strSql)
  %>
	<title><%=rsmov("moviename")%>详情页</title>
  <style>
   li{list-style: none;}
   a{text-decoration-style: none;}
   select {
    appearance:none;
    -moz-appearance:none;
    -webkit-appearance:none;
    padding-right: 10px;
    height: 26px;
  }
  </style>
  <script Language="JavaScript">
    function ChkFields() {
      if (document.formadd.content.value=='') {
        window.alert ("请发表你的影评！");
        formadd.content.focus();
        return false
      }
      return true
    }
  </script>
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
     <div style="margin-right: 40px;margin-top: 8px;">
     <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
     <!-- &nbsp&nbsp&nbsp&nbsp -->
     <p>
     <a href=admin.asp target="view_window">管理员主页</a>&nbsp;
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

<!-- 写电影信息 -->

 <div class='main' style="margin-top:30px">
    <div class='center-wrap'>
      <div class="movietitle">
        <div style="display: inline-block;"><h3 style="float: left;margin-bottom: 0px;margin-right: 25px;" class='cont-title'><%=rsmov("moviename")%></h3>
        </div>

<!-- 评分功能 -->
 <div class="ourscores" style="display: inline-block; ">

<!-- 计算所有用户平均分 -->
<div class="allscore">
<%
sql3="select * from grade where movieid='" & movid & "'"
set rsgra=conn.execute(sql3)
if rsgra.eof Then
%>
<p>还没有人为这部电影打分,成为第一位吧!</p>
<%
else
sql5="select avg(score) as [avg] from grade group by [MovieId] having [movieid]='" & movid & "'"
set rsavg=conn.execute(sql5)

Set rs8=Server.CreateObject("ADODB.Recordset")
Set rs8.ActiveConnection = Conn
rs8.CursorType = 3
rs8.Open "select * from grade where movieid='" & movid & "'"
r19 = rs8.RecordCount
%>
<div class="cs1" style="display: inline-block;padding-left: 20px;margin-bottom: 20px;">
<h2 style="color: #64a077"><%=rsavg("avg")%>分</h2>
<p style="margin-bottom: 4px;font-size: 12px;">共<%=r19%>人评分</p>
</div>
<%r2=rsavg("avg")
sql4="update movie set [score]= "&r2&" where movieid='"& movid & "'"
conn.execute(sql4)%>
<%end if%>
</div>
</div>


<div class="rate" style="display: inline-block; float: right;">

<!-- 评分表单 -->
 <div class="" style="display: inline-block;margin-right: 30px;margin-top: 12px;">
<form  method="POST" action="rate.asp?movieid=<% =rsmov("MovieId") %>" name="form1">
  <select  name="rate">
    <option value="1">1分</option>
    <option value="2">2分</option>
    <option value="3">3分</option>
    <option value="4">4分</option>
    <option value="5">5分</option>
    <option value="6">6分</option>
    <option value="7">7分</option>
    <option value="8">8分</option>
    <option value="9">9分</option>
    <option value="10">10分</option>
  </select>
  <input class="btn btn-default btn-sm" style="padding-left:2px"type="submit" value="⭐评分"></input>
</form>
<br>


<div class="myscore">
<%
Set rsfind = conn.Execute("Select * From grade Where movieid='"& movid &"' and userid='"& session("userid") &"'" )
if rsfind.eof then %>
<p>"您还没有过评分"</p>
<%
else
response.write"<p>我的评分：" &rsfind("score")& "分</p>"
end if
%>
</div>
</div>
</div>
</div>
<!--  div.title结束 -->

     <!--  显示电影内容 -->
      <div class="center-cont">
        <div class="leftpic" style="display: inline-block;height: 400px;width: 225px;float: left;">
        <div class='cont-pic' style="display: inline-block;height: 312px;">
          <%response.write"<img class='cont-pic' src='posters/"&rsmov("MovieId")&".jpg'>"%>
        </div>
        <!-- 收藏功能 -->
<div class="favorit" style="display: inline-block;height: 34px;width: 225px;margin: 0 auto;">
<%
' 此块内div已配对
sql6="select * from favorites where userid='" & session("userid") &"'and [movieid]='"&movid&"'"
set rsfav=conn.execute(sql6)

' 如果未收藏
if rsfav.eof then
%>
<div>
<form method="POST" action="favoritesadd.asp?movid=<% =rsmov("MovieId") %>" name="form2">
 <input class="btn btn-success" style="display: block;text-align: center; width: 138px;height: 34px;margin-top: 35px;margin-left: 40px;margin-right: 40px;"type="submit" value="添加到我的收藏夹"></input>
</form>
</div>
<!-- 如果已收藏 -->
<%else%>
<div>
  <form method="POST" action="favoritesdel.asp?movid=<% =rsmov("MovieId") %>" name="form2">
 <input class="btn btn-success" style="display: block;text-align: center; width: 138px;height: 34px;margin-top: 35px;margin-left: 40px;margin-right: 40px;"type="submit" value="取消收藏"></input>
</form>
</div>
<%end if%>
</div>
</div>

<!-- 显示电影详细信息 -->
      <div class='cont-info' style="display: inline-block;height: 400px;">
         <ul class='cont-info' style="padding-left: 25px;">
        <%' 此块内div已配对
        response.write        "<li>导演："&rsmov("director")&"</li>"
        response.write        "<li>主演："&rsmov("cast")&"</li>"
        response.write        "<li>类型："&rsmov("type")&"</li>"
        response.write        "<li>语言："&rsmov("Language")&"</li>"
        response.write        "<li>影片概要："&rsmov("Synopsis")&"</li>"
        response.write        "<li>上映日期："&rsmov("ReleaseDate")&"</li>"
        response.write        "<li>影片时长："&rsmov("Duration")&"</li>"

        %>
         </ul>
      </div>
      </div>


    <!-- 显示评论功能 -->
    <div class="comment-list">
      <div class="showlist">
      <div align="left">
        <h4>用户评论</h4>
      </div>

      <!-- 显示具体内容 -->
<%
 ' if radioValue="1" then
Set rst = conn.execute("select * from comment where movieid ='" & movid & "' order by likes desc")
'  else
' Set rst = conn.execute("select * from comment where movieid ='" & movid & "'") end if

' <!-- 无评论时 -->
if rst.eof then
%>
<div class='item'> 当前暂无评论,来抢沙发吧~ </div>
<%
end if
%>

<!-- 有评论时 -->
<%
'  循环评论
While Not rst.eof
id=rsmov("movieid")
co=rst("commentid")
set rs1=conn.execute("select * from comment where movieid='"& id &"'and commentid= " & co & "" )
userid=Cint(rs1("userid"))
Set rs=Server.CreateObject("ADODB.Recordset")
Set rs.ActiveConnection = conn
rs.Open "select * from users where userid ="& userid
%>

<!-- 评论显示框 -->
   <div class="item">
     <div class="comment-author">
      <a class="useravatar"href="profile.asp?usid=<%=rs1("userid")%>" class="UserAvatar"><img  width="30" height="30" src="avatars/<%=rs("avatar")%>"></a>
      <a href="profile.asp?usid=<%=rs1("userid")%>" style="margin-top: 8px;line-height: 2.4;padding-left: 5px;"><%=rs("username")%></a>
    </div>
    <div class="status">
      评论于：<%=rst("commenttime")%>
    </div>
    <!-- 删除评论 -->
    <div align="right">
      <%
      if session("username")="Admin" or session("username")= rs("username")  then %>
      <a href=commentdelt.asp?commentid=<%=rst("commentid")%> onclick="return newwin(this.href)">删除评论</a>
      <%end if%>
    </div>
    <div class="content">
      <%=rst("content")%>
    </div>
<!-- 点赞按钮 -->
    <div class="likes">
    <%
    Set rs3=Server.CreateObject("ADODB.Recordset")
    Set rs3.ActiveConnection = Conn
    rs3.CursorType = 3
    rs3.Open "select * from likes where commentid= '" & co &"'and status=true"
    r11 = rs3.RecordCount
    sql7="update comment set [likes]= "&r11&" where commentid="&cint(co)
    conn.execute(sql7)
    %>
    <form class="" action="likes.asp?commentid=<%=rst("commentid")%>" method="post">
      <button class="btn btn-success" value="" type="submit">👍<%=rs3.RecordCount%></button>
    </form>
   </div>

  <hr>
   </div>

<%
   n=n+1
   rst.movenext
   wend
%>
</div><!-- showlist -->

<!-- 撰写评论框 -->
<div class="comment" align="center" style="width: 990px;">
  <form method="POST" action="newcommentsave.asp?movieid=<% =rsmov("MovieId") %>" name="formadd" onsubmit = "return ChkFields()">
    <div class="wrapper" align="left">
    <h3 style="margin-top: 10px;">我来说两句</h3>
    </div>
    <div class="words">
      <textarea rows="6" name="content" class="texts" cols="134"></textarea>
    </div>
    <div class="b1" width="500px">
      <input type="submit" align="center"class="btn btn-success" value="畅言一下(●'◡'●)" name="B1">
    </div>
  </form>
  </br>
</div>


</div><!-- commentlist -->





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
