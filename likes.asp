
<!-- #include file="ChkPwd.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<%
  Userid = session("userid")
  commentid = request.querystring("commentid")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")

' 查询点赞表
  set rs=conn.execute("select * from likes where userid='" & session("userid") &"' and [commentid]='"& commentid &"'")
  if rs.eof then
  sql="INSERT INTO likes (userid,commentid,status) VALUES('" & Userid	& "','" & commentid & "',true)"
	Conn.Execute(sql)
	%>
		 <script language="javascript">
    alert("您已成功点赞！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%
  else
       if rs("status")=true then
       strsql="UPDATE likes SET [status]= false Where userid='" & session("userid") &"' and [commentid]='"& commentid &"'"
    	 Conn.Execute(strsql)%>
		 <script language="javascript">
    alert("您已取消了对他的赞");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%
       Else
       strsql="UPDATE likes SET [status]= true Where userid='" & session("userid") &"' and [commentid]='"& commentid &"'"
    	 Conn.Execute(strsql)%>
		 <script language="javascript">
    alert("您已成功点赞！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%
  End If
  End If
%>
