<!-- #include file="ChkPwd.asp" -->
<!-- #include file="IsAdmin.asp" -->
<html>
<head>
<title>删除电影信息</title>
</head>
<body>
<%
  Dim movieid
  '读取movieid参数
  movieid = Request.QueryString("movieid")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  Conn.Open
  '执行DELETE语句，删除指定电影
  Conn.Execute("DELETE FROM movie WHERE MovieId='"&movieid&"'")
  Conn.Execute("DELETE FROM comment WHERE MovieId='"&movieid&"'")
  Conn.Execute("DELETE FROM calendar WHERE MovieId='"&movieid&"'")
  Conn.Execute("DELETE FROM favorites WHERE MovieId='"&movieid&"'")
  Conn.Execute("DELETE FROM grade WHERE MovieId='"&movieid&"'")

'set rs=conn.execute("select * from likes where movieid='"&movieid&"'")
'if rs.eof  then
'else
'  set rst=conn.execute("select * from likes where movieid='"&movieid&"'and status=true")
'  if rst.eof then
'  else
 ' Conn.Execute("DELETE FROM likes WHERE MovieId='"&movieid&"'")
'end if
'end if
  Response.Write "<h2>成功删除</h2>"
%>
</body>
<script language="javascript">
  opener.location.reload();
  setTimeout("window.close()",1600);
</script>
</html>
