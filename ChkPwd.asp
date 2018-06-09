<%@Language="vbscript" Codepage="65001"%>
<%
Response.Charset="utf-8"
%>
<%
  '如果尚未定义Passed对象，则将其定义为False，表示没有通过身份认证
  If IsEmpty(Session("Passed")) Then
    Session("Passed") = False
  End If
  If Session("Passed")=False  Then
	'读取从表单传递过来的身份数据
    UserName = Request.Form("UserName")
    UserPwd = Request.Form("UserPwd")

    If UserName = "" Then
      Session("Errmsg") = "请输入用户名和密码"
    Else
	  '=============连接数据库===============
    Dim cnn, rst, sSQL
  	Set cnn = Server.CreateObject("ADODB.Connection")
  	Set rst = Server.CreateObject("ADODB.Recordset")
  	cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  	cnn.Open
  	sSQL = "SELECT * FROM Users WHERE UserName='" & Trim(UserName) & "'"
  	rst.Open sSQL, cnn
	  '=============身份验证===========================
	  If rst.EOF Then
    	Session("Errmsg") = "用户不存在"
   	  Else
	    If UserPwd <> rst.Fields("UserPwd") Then
      Session("Errmsg") = "密码错误！"
        Else  '登录成功
	      Session("Passed") = True
	      Session("UserName") = rst.Fields("UserName")
	      Session("UserId") = rst.Fields("UserId")
	      Session("Errmsg") = ""
        '转向个人中心
        Response.Redirect("index.asp")
	   End If
	  End If
    End If
    '转向首页
    Response.Redirect("login.asp")
  End If


%>
