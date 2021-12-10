<%@ page import="com.koreait.board1.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //스크립틀릿 > jstl, el식
    BoardVO data = (BoardVO)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= data.getTitle() %></title>
</head>
<body>
    <h1>디테일</h1>
    <div>
        <button onclick="isDel(<%= data.getIboard() %>);">삭제</button>
        <a href="/mod?iboard=<%=data.getIboard()%>"><button>수정</button></a>
    </div>
    <div>번호 : <%= data.getIboard() %></div>
    <div>제목 : <%= data.getTitle() %></div>
    <div>작성자 : <%= data.getWriter() %></div>
    <div>작성일시 : <%= data.getRdt() %></div>
    <hr>
    <div>
        <%= data.getCtnt() %>
    </div>
    <script src="/res/js/detail.js"></script>
</body>
</html>
