﻿﻿<%@Language="vbscript" Codepage="65001"%>
<html>
<head>
<title>收藏夹</title>
</head>
<body>
<%
  Userid = session("userid")
  movieid = request.querystring("movid")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")

  set rs=conn.execute("select * from favorites where userid='" & session("userid") &"' and [movieid]='"& movieid &"'")
  if not rs.eof then
	'在数据库表Favorites中删除收藏信息
  sql="delete from favorites where userid='" & session("userid") &"' and [movieid]='"& movieid &"'"
	Conn.Execute(sql)
%>  
  <script language="javascript">
    alert("取消收藏成功( ⸝⸝⸝°_°⸝⸝⸝ )！");
  location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%  else
%>

<%end if
%>
</body>


</html>
