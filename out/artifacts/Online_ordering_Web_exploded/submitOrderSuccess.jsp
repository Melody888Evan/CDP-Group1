<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 引入header.jsp -->
		<jsp:include page="/header.jsp"></jsp:include>
		
		<div style="min-height: 300px">
			<div style="font-size: 30px;margin-top: 100px;margin-left: 200px;">The order has been submitted, waiting for the merchant to receive the order...</div>
			<br>
			<div style="margin-left: 200px">
				<a href="${pageContext.request.contextPath }/myOrders">Check my order</a>
			</div>
		</div>
		
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>