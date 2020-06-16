<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Online Order System</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		<link href="./css/slider.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/jquery.min.js"></script>
		<script type="text/javascript" src="./js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="./js/camera.min.js"></script>
		<script type="text/javascript" src="./js/jquery.lightbox.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/lightbox.css" media="screen" />
		<script type="text/javascript">
			$(function() {
				$('.gallery a').lightBox();
			});
		</script>
		<script type="text/javascript">
			jQuery(function() {
				jQuery('#camera_wrap_1').camera({
					pagination: false,
					time:100,
				});
			});
			
		</script>
	</head>

	<body>

		<!----start-header----->
		<jsp:include page="/header.jsp"></jsp:include>
		<!----End-header----->
		
		<!--start-image-slider---->
		<div class="slider">
			<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
				<div data-src="./images/slider1.jpg"> 12</div>
				<div data-src="./images/slider2.jpg"> </div>
				<div data-src="./images/slider3.jpg"> </div>
				<div data-src="./images/slider4.jpg"> </div>
			</div>
			<div class="clear"> </div>
		</div>
		<!--End-image-slider---->
		<!---start-content---->
		<div class="content">
			<div class="top-grids">
				<div class="wrap">
					<div class="top-grid">
						<a href="#"><img src="./images/icon1.png" title="icon-name"></a>
						<h3>About</h3>
						<p>Assignment2 CDP Group1</p>
							<p>Yajie Zhang, Zhuoqun Zhang</p>
						<a class="button" href="${pageContext.request.contextPath }/index">See More</a>
					</div>
					<div class="top-grid">
						<a href="#"><img src="./images/icon2.png" title="icon-name"></a>
						<h3>Our service</h3>
						<p>Users can place orders online and we can provide delivery management services to improve delivery efficiency.
							At the same time, users can also choose to eat in the canteen to save queuing time.</p>
						<a class="button" href="${pageContext.request.contextPath }/index">See More</a>
					</div>
					<div class="top-grid last-topgrid">
						<a href="#"><img src="./images/icon3.png" title="icon-name"></a>
						<h3>Location</h3>
						<p>Palmerston North, New Zealand</p>
						<p>Massey University</p>
						<a class="button" href="${pageContext.request.contextPath }/index">See More</a>


					</div>
					<div class="clear"> </div>
				</div>
			</div>
			<div class="gallerys">
		 		<div class="wrap">
					<h3>Hot Menu</h3>
					<div class="gallery-grids">
						<c:forEach items="${hotMenuList }" var="menu">
							<div class="gallery-grid">
								<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}">
									<img src="${pageContext.request.contextPath }/${menu.image}" alt="">
									<span>$${menu.price}</span>
								</a>
								<h4>${menu.name}</h4>
								<span style="color: red;">$${menu.price}</span>
								<div class="gallery-button">
									<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}">Select</a>
								</div>
							</div>
						</c:forEach>
					</div>					
				    <div class="clear"> </div>
				    <div class="projects-bottom-paination">
						<div class="gallery-button" style="float:right; margin-right:150px; ">
							<a style="background:#e25111;" href="${pageContext.request.contextPath }/menuListByCid">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<div class="gallerys">
		 		<div class="wrap">
					<h3>Recommended</h3>
						<div class="gallery-grids">
							<c:forEach items="${newMenuList }" var="menu">
								<div class="gallery-grid">
									<a href="#">
										<img src="${pageContext.request.contextPath }/${menu.image}" alt="">
										<span>$${menu.price}</span>
									</a>
									<h4>${menu.name}</h4>
									<span style="color: red;">$${menu.price}</span>
									<div class="gallery-button">
										<a href="#">Select</a>
									</div>
								</div>
							</c:forEach>
						</div>				
				    <div class="clear"> </div>
				    <div class="projects-bottom-paination">
						<div class="gallery-button" style="float:right; margin-right:150px; ">
							<a style="background:#e25111;" href="${pageContext.request.contextPath }/menuListByCid">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<div class="mid-grid">
				<div class="wrap">
					<h1>Welcome！</h1>

					<p>This website provides online ordering service of Massey's Canteen.You can place an order in advance and come to the canteen to eat your meals without waiting in line,
						or you can choose to deliver to the dormitory to order your own food and beverage.</p>

				</div>
			</div>
		</div>
		<!---End-content---->
		<!---start-footer---->
		<jsp:include page="footer.jsp"></jsp:include>
		<!---End-footer---->
	</body>
</html>