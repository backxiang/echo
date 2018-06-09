<%
chatcontent=request("chat")
receiverid=
originid=session("userid")
chattime = now()
Set Conn=Server.CreateObject("ADODB.Connection")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
'插入新数据
sql="INSERT INTO chat (chatcontent,receiverid,originid,chattime) VALUES('" & chatcontent & "','" & receiverid & "','" & originid & "','" & chattime & "')"
Conn.Execute(sql)
%>
