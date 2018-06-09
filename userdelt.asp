<!-- #include file="ChkPwd.asp" -->
<!-- #include file="IsAdmin.asp" -->
<html>
<head>
<title>删除用户信息</title>
</head>
<body>
<%
  Dim uid
  '读取UserId参数
  uid = Request.QueryString("UserId")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  Conn.Open
  '执行DELETE语句，删除指定用户
  Conn.Execute("DELETE FROM users WHERE UserId=" & uid )
  Conn.Execute("DELETE FROM likes WHERE UserId='" & uid &"'")
  Conn.Execute("DELETE FROM favorites WHERE UserId='" & uid &"'")
  Conn.Execute("DELETE FROM friend WHERE UserId='" & uid &"'")
  Conn.Execute("DELETE FROM friend WHERE friendId='" & uid &"'")  
  Conn.Execute("DELETE FROM grade WHERE UserId='" & uid &"'")
  Conn.Execute("DELETE FROM favorites WHERE UserId='" & uid &"'")

  Response.Write "<h2>成功删除</h2>"
%>
</body>
<script language="javascript">
  opener.location.reload();
  setTimeout("window.close()",1600);
</script>
</html>
