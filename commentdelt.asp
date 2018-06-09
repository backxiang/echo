<!-- #include file="ChkPwd.asp" -->

<html>
<head>
<title>删除评论信息</title>
</head>
<body>
<%
  Dim commentid
  '读取commentid参数
  commentid = Request.QueryString("commentid")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  Conn.Open
  '执行DELETE语句，删除指定电影
  Conn.Execute("DELETE FROM comment WHERE commentid=" & commentid)
  Conn.Execute("DELETE FROM likes WHERE commentid='" &commentid&"'")
%>
</body>
 <script language="javascript">
    alert("删除成功(๑¯◡¯๑)！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
</html>
