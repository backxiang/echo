<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>电影日历</title>
  <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="css/moviecalendar.css">
  <link rel="stylesheet" href="css/calender.css">
  <style type="text/css">
  	html {
  		font: 500 14px 'roboto';
  		color: #333;
  		background-color: #fafafa;
  	}
    body{
      min-width: 1040px;
     /* width: 1230px;*/
    }
  	a {
  		text-decoration: none;
  	}
  	ul, ol, li {
  		list-style: none;
  		padding: 0;
  		margin: 0;
  	}
  	#demo {
  		width: 1080px;
  		margin: 350px auto;
  	}
  	p {
  		margin: 0;
  	}
  	#dt {
  		margin: 30px auto;
  		height: 28px;
  		width: 200px;
  		padding: 0 6px;
  		border: 1px solid #ccc;
  		outline: none;
  	}
  </style>

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
     <div style="margin-right: 40px;margin-top: 4px;">
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
    Dim cnn, rst, sSQL
    Set cnn = Server.CreateObject("ADODB.Connection")
    Set rst = Server.CreateObject("ADODB.Recordset")
    cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    cnn.Open
    dim d1,d2
    d1= cstr(date())
    d2=day(date)
    week=WeekdayName(Weekday(Date))

    if request("d1")<>"" then d1 = request("d1")End If
    if request("d2")<>"" then d2 = request("d2")End If
    if request("week")<>"" then week = request("week")End If

    sSQL = "SELECT * FROM calendar WHERE date= #" & d1 &"#"
    rst.Open sSQL, cnn

    set rsmov=cnn.execute("select * from movie where movieid='"& rst("movieid") &"'")
  %>

<div id="demo" class="row" style="margin-top: 50px;margin-left: 50px;margin-bottom: 0;margin-right: 50px;width: 1040px;">
  <!-- 左侧 -->
    <div class="col-md-6" style="display:inline-block;">
      <div id="ca"  style="padding-top:50px;">
    </div>
    <div><h1 align="center" style="padding-left: 0px;">一页电影，一页人生</h1>
    <h4 align="center" style="padding-left: 0px;">收录365部高分电影及经典台词短评</h4>
    <h4 align="center" style="padding-left: 0px;">每页日历上的电影，都抒写了这一天的故事</h4></div>
  </div>
  <!-- 右侧 -->
    <div class="col-md-6">
      <div class="section1" align="center"  style="padding-top:0;padding-right: 100px;margin-right: 30px;padding-left: 80px;">
      <!-- style="background-image: url(posters/<%=rst("movieid")%>.jpg); background-size:600px 900px;" -->
      <div class="text">
    <%while not rst.eof
    response.write    "<div class='date' align='left'>"
    response.write  d1
    response.write    "</div>"
    response.write    "<div class='week'align='left'>"
    response.write week
    %>
     &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp
     <span align="right" class="moviename" >
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
</div>
</div>
<hr>
<img style="margin:100px auto" width="1351px" height="600px"src="img/9.jpg" >





<hr>
<!-- <script type="text/javascript">
  function datechange(){
    // 点击后当前日期移一天
previousdate=new Date(new Date()-24*60*60*1000)
d2=previousdate.getDate()
  alert(d2)
  alert(previousdate.getday())
  alert(previousdate)
  }

</script>
<%= d1 %> -->
<div class="footer" align="center">
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
</div>


<script src="js/jquery.js"></script>
<script src="js/calendar.js"></script>
<script>


    $('#ca').calendar({
        width: 380,
        height: 320,
        data: [
            {
                date: '2017/12/24',
                value: 'Christmas Eve'
            },
            {
                date: '2017/12/25',
                value: 'Merry Christmas'
            },
            {
                date: '2017/01/01',
                value: 'Happy New Year'
            }
        ],
        onSelected: function (view, date, data) {

            console.log('view:' + view)
						var d1=date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate()
						var d2=date.getDate()
						var week = "星期" + "日一二三四五六".charAt(date.getDay())
            location.href="moviecalendar.asp?d1="+d1+"&d2="+d2+"&week="+week


            console.log('data:' + (data || 'None'));
        }
    });



    $('#dd').calendar({
        trigger: '#dt',
        zIndex: 999,
        format: 'yyyy-mm-dd',
        onSelected: function (view, date, data) {
            console.log('event: onSelected')
        },
        onClose: function (view, date, data) {
            console.log('event: onClose')
            console.log('view:' + view)
            console.log('date:' + date)
            console.log('data:' + (data || 'None'));
        }
    });
</script>
</body>
</html>
