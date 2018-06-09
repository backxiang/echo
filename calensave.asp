﻿<%@Language="vbscript" Codepage="65001"%>
<html>
<head>
<title>保存电影日历信息</title>
</head>
<body>
<%
  movieid = Request.form("movieid")
  reason = Request.form("reason")
  duration = Request.form("Duration")
  date1 = cdate(Request.form("date1"))

  

  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")


    	sql="INSERT INTO [calendar] (reason, date1, movieid, dialog) VALUES('" & reason	& "',#" & date1 & "#,'" & movieid & "','" & duration & "')"

      ' response.write sql
      ' response.write TypeName(date1)
      ' response.write duration
      ' response.write date1
	Conn.Execute(sql)
%>
<script>
  alert("您的信息已成功保存！")
</script>
<!-- <%
 '' server.transfer("admin.asp")
%> -->
</body>

<Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script>
</html>
