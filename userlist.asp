<!-- #include file="ChkPwd.asp" -->
<!-- #include file="IsAdmin.asp" -->
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>用户管理</title>
    <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/profile.css">
</head>
<script language="JavaScript">
function newwin(url) {
  var newwin=window.open(url,"newwin","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=380");
  newwin.focus();
  return false;
}
</script>
</head>
<body link="#000080" vlink="#008080" background="images/Back.jpg">

<h3 align="center">用户列表</h3>
<table class="table table-striped table-hover" width='90%' align=center cellspacing=0 cellpadding=0 border=1 bordercolor="#808080" bordercolordark="#FFFFFF" bordercolorlight="#E1F5FF" height="42">
<tr>
<td align="center" width='20%' height="22" class="main" valign="bottom"><b><font color="#808080">用户ID</font></b></td>
<td align="center" width='20%' height="22" class="main" valign="bottom"><b><font color="#808080">用户名</font></b></td>
<td align="center" width='30%' height="22" class="main" valign="bottom"><b><font color="#808080">电子邮箱</font></b></td>
<td align="center" width='30%' height="22" class="main" valign="bottom"><b><font color="#808080">操 作</font></b></td>
</tr>
<%
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  Conn.Open
  '定义Recordset对象
  Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '执行SQL语句，读取所有的用户数据，并保存结果到记录集对象rs中
  rs.Open "Select * from users Order by UserId"
  rCount = rs.RecordCount
  '循环显示所有的用户数据，同时画出表格
  Do While Not rs.EOF
%>
<tr>
<td height="16" class="main"><%=rs("UserId")%></td>
<td height="16" class="main"><%=rs("Username")%></td>
<td height="16" class="main"><%=rs("EMAIL")%></td>
<td align="center" height="16" class="main">
<% If rs("UserName")<>"Admin" Then %>
	<a href=UserDelt.asp?userid=<%=rs("UserId")%> onclick="return newwin(this.href)">删除</a> </td>
<% End If %>
</tr>

<%
    rs.MoveNext
  Loop

  If rCount = 0 Then
	Response.Write "<tr align='center'><td colspan=6><font color=red>目前还没有用户记录</font></td></tr>"
  Else
	Response.Write "<tr align='center'><td colspan=6><font color=red>当前共有" & Trim(rCount) &"条用户记录</font></td></tr>"
  end if
%>
</table>
<br>
</body>
</html>
