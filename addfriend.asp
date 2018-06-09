<%@Language="vbscript" Codepage="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" > 

<%
friendid=request.querystring("ussid")
userid=session("userid")

Set Conn=Server.CreateObject("ADODB.Connection")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
strsql="select * from friend where userid='"& userid &"' and friendid='"& friendid &"'"
set rs=conn.execute(strsql)

' 如果没有关注过
if rs.eof then
sql="insert into friend(userid,friendid) values('" & userid	& "','" & friendid & "')"
set rsadd=conn.execute(sql)

'  button换成取消关注

%> 
   <script language="javascript">
    alert("关注成功(๑¯◡¯๑)！");
 location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%  else
%>


<%end if
%>
</body>


</html>
