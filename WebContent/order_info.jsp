<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.validate.min.js" type="text/javascript"></script>
	<title>Order Info</title>
	<style type="text/css">
	.error {
		font-size: 90%;
		color: red;
	}
</style>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong>Order Details</strong>
				<table class="table table-bordered">
					<tbody>
						<tr class="warning">
							<th colspan="5">Order Num:${order.oid }</th>
						</tr>
						<tr class="warning">
							<th>Photo</th>
							<th>Dishes</th>
							<th>Price</th>
							<th>Number</th>
							<th>Subtotal</th>
						</tr>
						<c:forEach items="${order.orderItems }" var="orderItem">
							<tr class="active">
								<td width="60" width="40%"><input type="hidden" name="id" value="22"> <img src="${pageContext.request.contextPath}/${orderItem.menu.image}" height="60"></td>
								<td width="30%"><a target="_blank"> ${orderItem.menu.name}</a></td>
								<td width="20%">$ ${orderItem.menu.price}</td>
								<td width="10%">${orderItem.count}</td>
								<td width="15%"><span class="subtotal">$${orderItem.subtotal}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div style="text-align: right; margin-right: 120px;">
				Total: <strong style="color: #ff6600;">$${order.total_price}</strong>
			</div>

		</div>

		<div>
			<hr />
			<form class="form-horizontal" id="orderForm" ;
				style="margin-top: 5px; margin-left: 150px;" action="${pageContext.request.contextPath }/submitOrder" method="post">
				<input type="hidden" name="oid" value="${order.oid }">
				<!--传递oid  -->
				<div class="form-group">
					<label for="username" class="col-sm-1 control-label">Address</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="username" name="address" placeholder="Please input your address">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-1 control-label">Consignee</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="input3" name="name" placeholder="Please input the consignee">
					</div>
				</div>
				<div class="form-group">
					<label for="confirmpwd" class="col-sm-1 control-label">Phone</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="confirmpwd" name="telephone" placeholder="Please input your phone number">
					</div>
				</div>


				<hr />

				<div style="margin-top: 5px;">
					<strong>Modes of Payment：</strong>
					<p>
						<br />
						<input type="radio" name="pay" value="weixin" checked="checked" />Wechat <img src="./img/weixin.jpg" align="middle" style="width: 100px"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pay" value="zfb" />Ali-pay <img src="./img/zfb.jpg" align="middle" style="width: 100px"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<hr />
					<p style="text-align: right; margin-right: 150px;">
						<input type="submit" class="mybutton" value="submit the order">

					</p>
					<hr />

				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function() {
			$("#orderForm").validate({
				rules : {
					"address" : {
						"required" : true,
					},
					"name" : {
						"required" : true,
					},
					"telephone" : {
						"required" : true,
					}
				},
				messages : {
					"address" : {
						"required" : "Please input the address"
					},
					"name" : {
						"required" : "Please input the name of consignee"
					},
					"telephone" : {
						"required" : "Please input the phone number"
					}
				}
			});

		});
	</script>
	

	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>