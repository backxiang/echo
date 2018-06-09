<!-- #include file="chkpwd.asp" -->
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
  if rs.eof then
	'在数据库表Favorites中插入新收藏信息
  sql="INSERT INTO favorites (userid,movieid) VALUES('" & Userid	& "','" & movieid & "')"
	Conn.Execute(sql)
%>  
  <script language="javascript">
    alert("收藏成功(๑¯◡¯๑)！");
  location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%  else
%>
<%end if
%>
</body>


</html>
