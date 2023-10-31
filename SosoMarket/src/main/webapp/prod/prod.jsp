<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>
	<jsp:include page="../resources/header.html" />

	<h1>상품 등록 페이지</h1>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<p>
			글쓴이 : <input type="text" name="memberId">
		<p>
			상품명 : <input type="text" name="prodName">
		<p>
			판매가액 : <input type="text" name="prodPrice">
		<p>
			상품설명 : <input type="text" name="prodDesc">
		<p>
			거래희망장소 : <input type="text" name="place"> <input
				type="submit">
	</form>
	<jsp:include page="../resources/footer.html" />
</body>
</html>