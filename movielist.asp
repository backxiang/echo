
<!-- #include file="ChkPwd.asp" -->
<!-- #include file="IsAdmin.asp" -->
<!DOCTYPE html>
<html lang="zh">
<head>
    <link rel="icon" href="favicon.ico"/>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>电影管理</title>
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



<h3 align="center">电影列表</h3>
<div>
  <div class="form-group" style="display: inline-block;">
    <form action="MovieList.asp" method="post">
      <input type="text" class="form-control" placeholder="请输入电影名：" name="keywords" style="width: 300px;display: inline-block;">
  <!-- <span>请输入电影名：</span>
  <input type="text" name="keywords" /> -->
     <input type="submit" name="button1" class="btn btn-default" style="display: inline-block;" value="搜索"/>
    </form>
  </div>
  <a href="movieadd.asp" style="text-align: right;display: inline-block;margin-left: 390px;" class="btn btn-success" onclick="return newwin(this.href)" >添加电影</a>
</div>

<table class="table table-striped table-hover"  width='90%' align=center cellspacing=0 cellpadding=0 border=1 bordercolor="#808080" bordercolordark="#FFFFFF" bordercolorlight="#E1F5FF" height="42">
<tr>
<td align="center" width='35%' height="22" class="main" valign="bottom"><b><font color="#808080">电影编号</font></b></td>
<td align="center" width='35%' height="22" class="main" valign="bottom"><b><font color="#808080">电影名</font></b></td>
<td align="center" width='30%' height="22" class="main" valign="bottom"><b><font color="#808080">操 作</font></b></td>
</tr>
<%
Dim keywords

  keywords=trim(request.form("keywords"))

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
  if keywords="" Then
  rs.Open "Select * from movie Order by MovieId"
  rCount = rs.RecordCount
  Else
  sqlString= "Select * From movie Where MovieName='"&Request.Form("Keywords")&"' "
 rs.open sqlString,Conn,3,3

 end if
  %>




<%
  '循环显示所有的版块数据，同时画出表格
  Do While Not rs.EOF
%>
<tr>
<td height="16" class="main"><%=rs("MovieId")%></td>
<td height="16" class="main"><%=rs("MovieName")%></td>
<td align="center" height="16" class="main">
	<a href="moviedelt.asp?movieid=<%=rs("movieid")%>"  onclick="return newwin(this.href)">删除</a> </td>

</tr>

<%
    rs.MoveNext
  Loop
 If keywords<>"" Then
	Response.Write "<tr align='center'><td colspan=6><font color=red>当前共有1条版块记录</font></td></tr>"
 Elseif rCount = 0 Then
	Response.Write "<tr align='center'><td colspan=6><font color=red>目前还没有版块记录</font></td></tr>"

  Else
	Response.Write "<tr align='center'><td colspan=6><font color=red>当前共有" & Trim(rCount) &"条版块记录</font></td></tr>"
  end if
%>
</table>
<br>
</body>
</html>
