<% @ LANGUAGE = "VBScript" Codepage="65001" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>电影日历</title>
  <link rel="icon" href="favicon.ico"/>
</head>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
set rs=conn.execute("select * from movielist")
if rs.eof Then%>
<div class="">
  当前没有影单
</div>
<%else%>

<%
end if
while not rs.EOF
%>
<a href="movielistview.asp?movielistid=<%=rs("movielistid")%>"><%=rs("movielisttitle")%></a>
<%
  id=rs("movielistid")
  set rst=conn.execute("select * from movie where movielistid='"&id&"'")
if rst.eof Then%>

<div class="">
  当前影单没有记录
</div>

<%end if
while not rst.EOF%>
<%=rst("moviename")%>
<%=rst("cast")%>

<%n=n+1
rst.movenext
wend
%>
<%
n=n+1
rs.MoveNext
wend
%>
