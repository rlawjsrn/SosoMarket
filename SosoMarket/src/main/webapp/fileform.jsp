<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>
	<h1>form</h1>
	<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="filename">
		<input type="submit" value="전송">	
	</form>	
</body>
</html>