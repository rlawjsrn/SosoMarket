<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Real-Time Search Results</title>
</head>
<body>
    <h1>Real-Time Search Results</h1>

    <table border="1">
        <tr>
            <th>게시물 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="post" items="${searchResults}">
            <tr>
                <td>${post.postId}</td>
                <td>${post.postTitle}</td>
                <td>${post.memberId}</td>
                <td>${post.generationDate}</td>
                <td>${post.postViews}</td>
            </tr>
        </c:forEach>
    </table>

    <c:if test="${empty searchResults}">
        <p>No matching posts found.</p>
    </c:if>

    <a href="CommunityPostList.jsp">Back to Community List</a>
</body>
</html>
