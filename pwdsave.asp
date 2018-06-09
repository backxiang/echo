<%@Language="vbscript" Codepage="65001"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/useredit.css">
  <title>修改密码</title>
</head>
<body>
<%
  '从表单中接收数据到变量中
  password = Request("Pwd")
  password1 = Request("Pwd1")

  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
 	  '更新用户信息
   	    sql = "UPDATE Users SET userpwd='" & password & "' Where UserId=" & Session("UserId")
   	    Conn.Execute(sql)

%>
<script>  alert("密码已成功更新！")
</script>
</body>
<Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script>
</html>
