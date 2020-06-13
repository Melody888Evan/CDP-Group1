<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<title>Activate Successfully</title>
		<script type="text/javascript">
		$(function () {
			var time = 5;
			var timer = setInterval(function() {
				$("#second").html(time);
				time--;
				if (time == 0) {
					clearInterval(timer);
					location.href = "${pageContext.request.contextPath }/login.jsp";
				}
			}, 1000);
		});
		</script>
	</head>
	<body>
		<h2>Congratulations on successfully activating your account</h2>
		<h3><span style="color: red;" id="second">5</span>automatic jump, direct jump please click<a href="${pageContext.request.contextPath }/login.jsp">here</a></h3>
	</body>
</html>