<%@ page import="com.koreait.board1.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //<퍼센트 퍼센트>는 '스크립틀릿'이다. 이 안에서는 자바 문법을 사용할 수 있다.
    List<BoardVO> data = (List<BoardVO>)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/res/css/common.css?ver=1">
    <title>List</title>
</head>
<body>
    <h1>List</h1>
    <div>
        <a href="/write">글쓰기</a>
    </div>
    <div class="container">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일시</th>
            </tr>
            <% for(BoardVO vo : data) { %>
            <tr onclick="moveToDetail(<%= vo.getIboard() %>);">
                <td><%= vo.getIboard() %></td>
                <td><%= vo.getTitle() %></td>
                <td><%= vo.getWriter() %></td>
                <td><%= vo.getRdt() %></td>
            </tr>
            <% } %>
        </table>
    </div>
    <script src="/res/js/list.js"></script>
</body>
</html>