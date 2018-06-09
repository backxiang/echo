<%@Language="vbscript" Codepage="65001"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" > 
<title>收藏夹</title>
</head>
<body>
<%
friendid=request.querystring("ussid")
userid=session("userid")

Set Conn=Server.CreateObject("ADODB.Connection")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
strsql="select * from friend where userid='"& userid &"' and friendid='"& friendid &"'"
set rs=conn.execute(strsql)

  if not rs.eof then
	'在数据库表Favorites中删除收藏信息
  sql="delete from friend where userid='"& userid &"' and friendid='"& friendid &"'"
	Conn.Execute(sql)
%>
  <script language="javascript">
    alert("取消关注成功( ⸝⸝⸝°_°⸝⸝⸝ )！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%  else %>

<%end if%>
</body>


</html>
