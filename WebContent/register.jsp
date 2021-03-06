<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>

<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />

<title>Member Registration</title>
<script type="text/javascript">
	//自定义validate校验规则(ajax校验用户名是否存在)
	$.validator.addMethod(
	//规则的名称
	"isExist",
	//校验函数
	function(value, element, params) {
		//value:输入的内容
		//element:被校验的元素对象
		//params:规则对应的参数
		var flag = false;
		$.ajax({
			"async" : false, //取消异步，必须先等服务器返回数据，否则无法确定返回值的真假
			"url" : "${pageContext.request.contextPath}/checkUsername",
			"data" : {
				"username" : value
			},
			"type" : "post",
			"dataType" : "json",
			"success" : function(data) {
				flag = data.isExist;
			}
		});
		return !flag;
	});
	
	$(function() {
		$("#registerForm").validate({
			rules : {
				"username" : {
					"required" : true,
					"isExist" : true
				},
				"password" : {
					"required" : true,
					"rangelength" : [ 6, 16 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 16 ],
					"equalTo" : "#password"
				},
				"email" : {
					"required" : true,
					"email" : true
				},
				"sex" : {
					"required" : true
				}
			},
			messages : {
				"username" : {
					"required" : "username can not be empty",
					"isExist" : "username already exist"
				},
				"password" : {
					"required" : "password can not be empty",
					"rangelength" : "password length 6-16"
				},
				"repassword" : {
					"required" : "password can not be empty",
					"rangelength" : "password length 6-16",
					"equalTo" : "two passwords do not match"
				},
				"email" : {
					"required" : "email can not be empty",
					"email" : "email format is wrong"
				},
				"sex" : {
					"required" : "you don not have third choice"
				}

			}
		});
	});
	//验证码点击切换图片
	function changeImg(obj) {
		obj.src="${pageContext.request.contextPath }/checkImgServlet?time="+new Date().getTime();
	}
</script>
<style type="text/css">
	.error {
		font-size: 90%;
		color: red;
	}
</style>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->
	<div class="container" style="width: 100%;">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<div style="font-size: 150%">USER REGISTER</div>
				<form id="registerForm" class="form-horizontal" style="margin-top: 5px;" action="${pageContext.request.contextPath }/register" method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">Username</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username" name="username" placeholder="Please input the username">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password" name="password" placeholder="Please input the password">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">Confirm Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd" name="repassword" placeholder="Please input the confiramtion password">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="usercaption" name="name" placeholder="Please input your name">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-6">
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex1" value="male"> Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex2" value="female"> Famle
							</label>
							<label class="error" for="sex" style="display: none;">You don't have a third choice</label>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Date of Birth</label>
						<div class="col-sm-6">
							<input type="date" class="form-control" name="birthday">
						</div>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Verification Code</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="checkImg">
						</div>
						<div class="col-sm-3">
								<img onclick="changeImg(this)" style="cursor:pointer" src="${pageContext.request.contextPath }/checkImgServlet" />
						</div>
						<span style="color: red;">${registerInfo }</span>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="register" name="submit" class="mybutton">
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/footer.jsp"></jsp:include>
	<!----End-header----->
</body>
</html>