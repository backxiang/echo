<%
  If Session("UserName") <> "Admin" Then
    Response.Write("����Admin�û���û�д�Ȩ��")
    Response.End
  End If
%>
