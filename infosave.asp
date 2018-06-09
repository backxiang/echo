﻿<%@Language="vbscript" Codepage="65001"%>
<html>
<head>
<title>修改用户信息</title>
</head>
<body>
<%
  '从表单中接收数据到变量中
  vUserName = Request("UserName")
  vcity = Request("city")
  vtel = Request("tel")
  vintro = Request("intro")
  vemail = Request("email")
  vbirth = cstr(Request("birth"))
  avatar = Request("avatar") & ".jpg"
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
 	  '更新用户信息
   	    sql = "UPDATE Users SET username='" & vUserName & "', Email='" & vemail & "', intro='" & vintro & "',city='" & vcity & "',birth='" & vbirth & "',tel='" & vtel & "' ,avatar= '" & avatar & "' Where UserId="& Session("UserId")
  Conn.Execute(sql)
set rsuser=conn.execute("select * from users where userid="&session("userid"))
        session("username")=rsuser("username")
%>
<script>  alert("用户信息已成功更新！")
</script>
</body>
<Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script>
</html>
