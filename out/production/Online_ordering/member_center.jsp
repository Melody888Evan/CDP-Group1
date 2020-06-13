<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<title>Insert title here</title>
	<style>
		.content{
   			margin: 0 auto;
    		min-height: 800px;
    		width: 1200px;
    		height: auto;
    		background: floralwhite;
		}
		.field{
			margin-top: 60px;
			margin-left: 85px;
			
		}
		.field div{
			margin-bottom: 40px;
		}
		.inputField{
			margin-top: 60px;
			margin-left: 85px;
			display: none;
		}
		.inputField div{
			margin-bottom: 45px;
		}
	</style>
	<script type="text/javascript">
		$(function () {
			$("#edit").click(function () {
				$(".field").toggle();
				$(".inputField").toggle();
			
			});
			$("#save").click(function () {
				$("#form1").submit();
			});
 			$("#canel").click(function () {
				$(".inputField").toggle();
				$(".field").toggle();
			});
		});
	</script>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>

	<div class="content">
		<div style="font-size: 30px;margin-left: 30px;padding-top: 25px">Member Center</div>
		<div class="field">
			<div>
				photo：
				<img src="${pageContext.request.contextPath}/${user.image}" style="width: 50px">
			</div>
			<div>username：${user.username }</div>
			<div>integral：<span style="color: red;">${user.point }</span></div>
			<div>Name：${user.name }</div>
			<div>Email：${user.email }</div>
			<div>Phone：${user.telephone }</div>
			<div>Date of Birth：${user.birthday }</div>
			<div>Gender：${user.sex }</div>
			<div>Age：${user.age }</div>
			<div id="edit">
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 450px;">Edit</a>
			</div>
		</div>
		<div class="inputField">
			<form id="form1" action="${pageContext.request.contextPath}/editUserInfo" method="post" enctype="multipart/form-data">
				<div>
					<label>photo：</label>
					<img src="${pageContext.request.contextPath}/${user.image }" style="width: 50px"> 
					<input type="file" id="fileupload" name="image">
				</div>
				<div>
					<input type="hidden" value="${user.uid }" name="uid">
				</div>
				<div>
					<label>Username：</label>
					<input type="text" value="${user.username }" name="username">
				</div>
				<div>
					<label>Name：</label>
					<input type="text" value="${user.name }" name="name">
				</div>
				<div>
					<label>Email：</label>
					<input type="text" value="${user.email }" name="email">
				</div>
				<div>
					<label>Phone：</label>
					<input type="text" value="${user.telephone }" name="telephone">
				</div>
				<div>
					<label>Date of Birth：</label>
					<input type="date" value="${user.birthday }" name="birthday">
				</div>
				<div>
					<label>Gender：</label>
					<input type="radio" name="sex" value="female">Female
					<input type="radio" name="sex" value="male">Male
				</div>
				<div>
					<label>Age：</label>
					<input type="text" value="${user.age }" name="age">
				</div>
			</form>
			<div>
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 400px;" id="save">Save</a>
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 30px;" id="canel">Back</a>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(function () {
			$("input[value='${user.sex}']").attr("checked",true);
		});
	</script>

	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>