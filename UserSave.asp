﻿﻿<%@Language="vbscript" Codepage="65001"%>
<html>
<head>
<title>保存用户信息</title>
</head>
<body>
<%
  UserName = Request.form("UserName")
  UserPwd = Request.form("password")
  city = Request.form("city")
  tel = Request.form("tel")
  intro = Request.form("intro")'Request("Logo") & ".gif"
  Email = Request.form("email")
  birth = CStr(Request.form("birth"))
  regtime = now()
  sex=Request.form("sex")
  avatar = Request("avatar") & ".jpg"

  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")

'判断用户是否存在'
    Set rsUser = conn.Execute("Select * From Users Where username='" & username & "'")
	  If Not rsUser.EOF Then
%>
<script language="javascript">
    alert("已经存在此用户名！");
  history.go(-1);
</script>

<%
	  Else
	    Set rsUser = Nothing
		 '在数据库表Users中插入新用户信息
    	sql="INSERT INTO Users (UserName, UserPwd, tel, Email, intro,city,regtime,birth,avatar,sex) VALUES('" & UserName	& "','" & UserPwd & "','" & tel & "','" & Email & "','" & intro & "','" & city & "','" & regtime & "','" & birth & "','" & avatar & "','" & sex & "')"
	Conn.Execute(sql)
%>
<script>
  alert("您的信息已成功保存！")
</script>
<%
  server.transfer("login.asp")
  End If
%>
</body>

<Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script>
</html>
