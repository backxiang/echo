<%
  If Session("UserName") <> "Admin" Then
    Response.Write("不是Admin用户，没有此权限")
    Response.End
  End If
%>
