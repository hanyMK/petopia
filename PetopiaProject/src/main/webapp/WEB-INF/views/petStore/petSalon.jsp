<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div style="height:500px;">
	
		<div>
		
		${hairSalon}
		</div>
		
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>