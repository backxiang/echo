<!-- #include file="ChkPwd.asp" -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>保存评分</title>
</head>
<body>
<%
  movieid=request.querystring("movieid")
  rate = cstr(Request.form("rate"))
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
'判断用户是否评过分'
    Set rsUser = conn.Execute("Select * From grade Where movieid='"& movieid &"' and userid='"& session("userid")&"'" )
	  If Not rsUser.EOF Then
	Response.Write("<script language=javascript>opener.location.href=opener.location.href;</script>")

%>
<script language="javascript">
    alert("您已经评过分了！");
  location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%
	  Else
		 '在数据库表Users中插入新评分信息
    	sql="INSERT INTO grade (userid, movieid, score) VALUES('" & session("userid")	& "','" & movieid & "', '" & rate & "' )"
	    Conn.Execute(sql)
%>
<script language="javascript">
    alert("您已成功评分！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%
  End If
%>
</body>

</html>
