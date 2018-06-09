<% @ LANGUAGE = "VBScript"  Codepage="65001" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>回响——影界听到你的回声</title>
    <link rel="icon" href="favicon.ico"/>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/movielist.css">
  </head>
  <body>
 <!--导航栏制作-->
  <div class="navbar navbar-default" style="margin-bottom: 1px;">
    <div class="container">
     <div class="navbar-header">
      <!-- 图标 -->
      <a href="index.asp" target="view_window"><img width="80px" height="56px" src="img/1.png"></a>
     </div>
  <nav class="nav navbar-nav" style="display:inline-block;width: 335px;height: 50px;padding-right: 0px;">
  <li><a href="index.asp" target="view_window">首页</a></li>
  <li><a href="lists.asp" target="view_window">电影列表</a></li>
  <li><a href="movielistview.asp?movielistid=001" target="view_window">影单推荐</a></li>
  <li><a href="moviecalendar.asp" target="view_window">电影日历</a></li>
  </nav>

  <!-- 搜索框 -->
  <form class="form navbar-form navbar-left" type="post" action="search.asp"  style="padding-right: 0px;padding-left: 0px;width: 338px;">
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

  <nav class="nav profile navbar-nav navbar-right" style="margin-right: 0px;width: 250px;padding-left: 22px;padding-right: 0px;">
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
 <br>
<!-- 导航栏结束 -->
<!--
   </div>
 </div>
 -->

    <%
    Dim cnn, sSQL,strcnn,rst,count,i,n
    n=1
    Set cnn = Server.CreateObject("ADODB.Connection")
    Set rst = Server.CreateObject("ADODB.RecordSet")
    cnn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    rst.CursorType = adOpenStatic
    rst.cursorlocation=3
    '待完善'
    tag= request.querystring("tag")
    dist=request.querystring("dist")

    if (tag="" and dist="") then
    sSQL="select * from movie order by score desc"
    end if
    if (tag="全部" and dist="全部") then
    sSQL="select * from movie order by score desc"
    end if
    if (tag="" and dist="国内") then
    sSQL="select * from type,movie where movie.MovieId=type.MovieId and type.国内=true"
    ' response.write sSQL
    end if
    if (tag="" and dist="国外") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.国外=true"
    end if

    if (tag="动作" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.动作=true"
  '   if(dist="国内") then
  '   sSQL=sSQL&"type.国内='true'"
  ' end if
    end if

    if (tag="科幻" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.科幻=true"
    end if
    if (tag="冒险" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.冒险=true"
    end if
    if (tag="剧情" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.剧情=true"
    end if
    if (tag="犯罪" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.犯罪=true"
    end if
    if (tag="爱情" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.爱情=true"
    end if
    if (tag="动画" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.动画=true"
    end if
    if (tag="奇幻" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.奇幻=true"
    end if
    if (tag="喜剧" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.喜剧=true"
    end if
    if (tag="悬疑" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.悬疑=true"
    end if
    if (tag="歌舞" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.歌舞=true"
    end if
    if (tag="家庭" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.家庭=true"
    end if
    if (tag="传记" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.传记=true"
    end if
    if (tag="历史" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.历史=true"
    end if
    if (tag="战争" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.战争=true"
    end if
    if (tag="惊悚" and dist="") then
    sSQL="select * from type,movie where movie.movieid=type.movieid and type.惊悚=true"
    end if



    rst.open sSQL,cnn

    %>
    <%
Dim  currentPage, rowCount, x
currentPage = Request.QueryString("currentPage")	' 从查询字符串中获得页号
If currentPage = "" Then						' 如果页号为空（第一次打开页面时）
  currentPage = 1								' 设置页号为1
End If
If currentPage <1 Then            ' 如果页号为空（第一次打开页面时）
  currentPage = 1               ' 设置页号为1
End If

rst.PageSize = 8								' 设置在一页中显示5行记录

						' 打开记录集
rst.AbsolutePage = CInt(currentPage)		' 设置当前记录所在的页面
rowCount = 0									' 设置当前行号
%>
    <div class="container1">
      <div class="tag-box">
        <table class="table" style="margin-bottom:10px;">
          <tbody>
            <tr>
              <td class="tag-span2">地区：</td>
              <td class="tags">
                <a class="tag active" href="lists.asp" data-value="全部">全部</a>
                <a class="tag" href="lists.asp?dist=国内" data-value="国内">国内</a>
                <a class="tag" href="lists.asp?dist=国外" data-value="国外">国外</a>
                <%vdist=request("dist")%>
              </tr>
              <tr style="border-bottom:1px solid #DDD;">
                <td class="tag-span2">影视类型：</td>
                <td class="tags">
                  <a class="tag active" href="lists.asp" data-value="全部">全部</a>
                  <a class="tag" href="lists.asp?tag=动作" data-value="动作">动作</a>
                  <a class="tag" href="lists.asp?tag=科幻" data-value="科幻">科幻</a>
                  <a class="tag" href="lists.asp?tag=冒险" data-value="冒险">冒险</a>
                  <a class="tag" href="lists.asp?tag=剧情" data-value="剧情">剧情</a>
                  <a class="tag" href="lists.asp?tag=犯罪" data-value="犯罪">犯罪</a>
                  <a class="tag" href="lists.asp?tag=爱情" data-value="爱情">爱情</a>
                  <a class="tag" href="lists.asp?tag=动画" data-value="动画">动画</a>
                  <a class="tag" href="lists.asp?tag=奇幻" data-value="奇幻">奇幻</a>
                  <a class="tag" href="lists.asp?tag=喜剧" data-value="喜剧">喜剧</a>
                  <a class="tag" href="lists.asp?tag=悬疑" data-value="悬疑">悬疑</a>
                  <a class="tag" href="lists.asp?tag=歌舞" data-value="歌舞">歌舞</a>
                  <a class="tag" href="lists.asp?tag=家庭" data-value="家庭">家庭</a>
                  <a class="tag" href="lists.asp?tag=传记" data-value="传记">传记</a>
                  <a class="tag" href="lists.asp?tag=历史" data-value="历史">历史</a>
                  <a class="tag" href="lists.asp?tag=战争" data-value="战争">战争</a>
                  <a class="tag" href="lists.asp?tag=惊悚" data-value="惊悚">惊悚</a>
                 <%vtag=request("tag")%>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <!-- <form action="">
          <input type="radio">按评分排序
        </form> -->
        <table border="0" align="center" cellpadding="0" cellspacing="3">
          <tr>

            <% While Not rst.eof And rowCount < rst.PageSize%>



            <% if(tag="" and dist="") then %>
            <td align="center" style="padding: 10px;">
              <a href="detail.asp?movid=<% =rst("MovieId") %>" target="view_window"">
                <img src='posters/<% =rst("MovieId") %>.jpg' alt="" height="340" width="240">
              </a>
              <br>
              <a href="" style="font-size: 18px;"><% = rst("MovieName") %></a>
            </td>

            <% else %>
            <td align="center" style="padding: 10px;">
              <a href="detail.asp?movid=<% =rst("movie.movieid") %>">
                <img src='posters/<% =rst("movie.movieid") %>.jpg' alt="" height="340" width="240">
              </a>
              <br>
              <a href="" style="font-size: 18px;"><% = rst("movie.MovieName") %></a>
            </td>
            <%end if%>
            <%
            if n mod 4=0 then
            %>
          </tr>
          <tr>
            <%
            end if
            %>

          <%
rowCount = rowCount + 1



          n=n+1
          rst.movenext
          wend%>
           </table>
        </div>

        <hr>

		<p style="text-align:center;padding: 0px;margin: auto;">
      <div style="width: 380px;height: 40px;margin: auto;">
      <ul class="pagination" style="text-align: center;">
        <li>
          <%if currentPage=1 then%>
          <a class="disabled">首页</a>
          <%else%>
          <a href="?currentPage=<%=1%>&dist=<%=vdist%>&tag=<%=vtag%>">首页</a>
          <%end if%>
        </li>
        <li>
          <%if currentPage>1 then%>
           <a href="?currentPage=<%=currentpage-1%>&dist=<%=vdist%>&tag=<%=vtag%>">上一页</a>
          <%else%>
          <a class="disabled">上一页</a>

          <%end if%>
        </li>
        <li>
          <a>当前页次：<% = currentPage %>/<% = rst.PageCount %>&nbsp;&nbsp;</a>
        </li>
        <li>
          <%if rst.pagecount<currentPage+1 then%>
          <a class="disabled">下一页</a>
          <%else%>
          <a href="?currentPage=<%=currentPage+1%>&dist=<%=vdist%>&tag=<%=vtag%>">下一页</a>
          <%end if%>
        </li>
        <li>
          <%if rst.pagecount<currentPage+1 then%>
          <a class="disabled">尾页</a>
          <%else%>
          <a href="?currentPage=<%=rst.pagecount%>&dist=<%=vdist%>&tag=<%=vtag%>">尾页</a>
          <%end if%>
        </li>
<!--         <li>
          <a>共<% = rst.PageCount %>页&nbsp;</a>
        </li> -->

      </ul>
      </div>
    </p>

    <br>
          <%
          rst.Close
          set rst=Nothing
          %>
          <%
          cnn.Close
          Set cnn = Nothing
          %>


        </div>



      <footer>
        <div class="foot">
          <p>
            免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
            <br>
            目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
          </p>
          <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
        </div>
      </footer>

    </body>
  </html>
