 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Community 게시판</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Real-time search function
            $("#search").on("input", function() {
                var searchQuery = $(this).val();
                if (searchQuery !== "") {
                    // Make an AJAX request to your RealTimeSearchServlet
                    $.get("RealTimeSearchServlet", { search: searchQuery }, function(data) {
                        // Update the HTML with search results
                        $("#searchResults").html(data);
                    });
                } else {
                    // Clear the results when the search query is empty
                    $("#searchResults").empty();
                }
            });
        });
    </script>
</head>
<body>
    <h1>Community 게시판</h1>

    <form>
        <label for="search">검색:</label>
        <input type="text" id="search" name="search">
    </form>

    <table border="1">
        <tr>
            <th>게시물 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <tbody id="searchResults">
            <!-- Search results will be displayed here -->
        </tbody>
    </table>
</body>
</html>
 