<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Online Order System</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		function delProFromCart(mid) {
			if (confirm("Are you sure to remove this item from your shopping cart？")) {
				location.href = "${pageContext.request.contextPath}/delMenuFromCart?mid="
						+ mid;
			}
		}
		function clearCart() {
			if (confirm("Are you sure to empty the shopping cart？")) {
				location.href = "${pageContext.request.contextPath}/clearCart";
			}
		}
	</script>
	<style>
	body {
		margin-top: 20px;
		margin: 0 auto;
	}

	.carousel-inner .item img {
		width: 100%;
		height: 300px;
	}

	font {
		color: #3164af;
		font-size: 18px;
		font-weight: normal;
		padding: 0 10px;
	}
	</style>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->
	<!---start-content---->
	<div style="min-height:500px">
		<c:if test="${!empty cart.cartItems }">
			<div class="container">
				<div class="row">
					<div style="margin: 0 auto; margin-top: 25px; width: 950px;">
						<strong style="font-size: 30px; margin: 5px 0;">Cart Details</strong>
						<table class="table table-bordered">
							<tbody>
								<tr class="warning">
									<th>Photo</th>
									<th>Dishes</th>
									<th>Price</th>
									<th>Number</th>
									<th>Subtotal</th>
									<th>Operation</th>
								</tr>

								<c:forEach items="${cart.cartItems }" var="entry">
									<tr class="active">
										<td width="100" width="40%"><input type="hidden" name="id"
										value="22"> <img src="${entry.value.menu.image }"
										width="100%"></td>
										<td width="30%"><a target="_blank">${entry.value.menu.name }</a></td>
										<td width="20%">${entry.value.menu.price }</td>
										<td width="10%"><span>${entry.value.buyNum }</span></td>
										<td width="15%"><span class="subtotal">￥${entry.value.subTotal }</span></td>
										<td><a href="javascript:;" onclick="delProFromCart('${entry.value.menu.mid}')" class="delete">delete</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>

				<div style="margin-right: 130px;">
					<div style="text-align: right;">
						<a href="${pageContext.request.contextPath}/menuListByCid" style="color: #ff6600;"> Back&nbsp;&nbsp; </a>

					</div>
					<div style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
						<a href="javascript:;" id="clear" class="clear" style="color: #19929f;" onclick="clearCart()">Empty the Cart</a>
						<a href="${pageContext.request.contextPath}/submitCart">
							<input type="submit" width="100" value="Pay" name="submit" class="mybutton">
						</a>
					</div>
				</div>

			</div>
		</c:if>

		<c:if test="${empty cart.cartItems }">
			<div class="container">
				<img src="${pageContext.request.contextPath}/img/cart-empty.png" style="float: left;margin-top: 60px;">
				<h2 style="margin-left: 12cm;margin-top: 130px;font-size: 170%">Your shopping cart is empty！</h2>
				<span style="margin-left: 260px;"><a href="${pageContext.request.contextPath}/menuListByCid">Go to order</a></span>
			</div>
		</c:if>
	</div>
	<!---End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp"></jsp:include>
	<!---End-footer---->
</body>
</html>