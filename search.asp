<% @ LANGUAGE = "VBScript" Codepage="65001" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>搜索结果显示</title>
    <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="css/movielistview.css">
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


	  <%
      Dim keywords
      keywords=request("keywords")
      a1=cint(request("select"))
      dim conn,rs,strSql
      set conn=Server.CreateObject("ADODB.Connection")
      conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")%>

      <div class="container">
      <div class="col-md-12" style="padding:0 5px;">

<!-- 查找电影 -->
<% if a1=1 then
      set rs=conn.execute("select * from movie where MovieName like '%" & keywords & "%'")

      if rs.eof Then%>
      <div class="container">没有找到该电影！</div>
      <%end if%>
      <!-- ' If rs.eof then
      '   response.write  "当前关键词没有记录,请返回!!"
      '  End if -->
   <% While Not rs.eof %>
        <div class="item">
        <div class="subject">
             <div class="post"><a href="detail.asp?movid=<%=rs("MovieId") %>" target="view_window"><img class="cont-pic" width="120" height="180" src="posters/<%=rs("MovieId")%>.jpg"></a></div>
             <div class="title"><a href="detail.asp?movid=<%=rs("MovieId") %>" target="view_window"><h3><%=rs("moviename")%></h3></a></div>
             <div class="rating"><%=rs("score")%>分</div>
             <div class="cast">导演：&nbsp<%=rs("director")%></div>
             <div class="cast">演员：&nbsp<%=rs("cast")%></div>
             <div class="cast">类型：&nbsp<%=rs("type")%></div>
        </div>
         </div>


    <%
    n=n+1
    rs.movenext
    wend
   %>

<!-- 查找用户 -->
<%else  strSql="select * from users where username like '%" & keywords & "%'"
        set rs=conn.execute(strsql)
        if rs.eof Then%>
        <div class="container" style="padding:80px">没有找到该用户！</div>
        <%Sql="select * from users"
        set rst=conn.execute(sql)%>
        <div class="userlist">
          <fieldset class="layui-elem-field layui-field-title" >
            <legend style="font-size:30px!important">🦀您可以关注以下用户</legend>
          </fieldset>
       </div>
       <div class="row">
        <% While Not rst.eof %>
          <div class="col-md-3 movie-item">
           <div class="profile">
             <a style="position:relative;display:block;padding-bottom: 15px;"  href="profile.asp?usid=<%=rst("userId") %>">
             <div class="UserAvatar" align="center"><img src="avatars/<%=rst("avatar")%>" alt="" height="160px" width="160px">
             </div>
             </a>
             <div class="username" align="center">
             <h4 style="padding-right:80px"><a href="profile.asp?usid=<%=rst("userId") %>"><% = rst("userName") %></a></h4>
             </div>

           </div>
          </div>

        <%
        n=n+1
        rst.movenext
        wend%>
        <% end if %>
</div>
         <% While Not rs.eof %>
           <div class=" col-md-3 movie-item">
            <div class="movie-item-in">
              <div class="UserAvatar">
              <a  style="position:relative;display:block;"  href="profile.asp?usid=<%=rs("userId") %>">
              <img src="avatars/<%=rs("avatar")%>" alt="" height="160px" width="160px"></a></div>
              <div class="item-hover"></div>
              </a>
              <br>
              <div  class="username" align="center">
              <h4 style="padding-right:90px"><a href="profile.asp?usid=<%=rs("userId") %>"><% = rs("userName") %></a></h4>
              </div>

            </div>
           </div>

         <%
         n=n+1
         rs.movenext
         wend
         end if%>

</div>
</div>




  <!--页脚-->
<!-- <div class="foot">
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
</div>
  -->


</body>
</html>
