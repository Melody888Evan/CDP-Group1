<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript">
		function addProduct(){
			window.location.href = "/add.jsp";
		}
		function delMenu(mid) {
			var isDel = confirm("Are you sure to delete that good？");
			if(isDel) {
				location.href = "${pageContext.request.contextPath}/adminDelMenu?mid=" + mid;
			}
		}
	</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>List</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="add"
							class="button_add" onclick="addProduct()">
							&#28155;&#21152;</button>

					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="18%">Num</td>
								<td align="center" width="17%">Photo</td>
								<td align="center" width="17%">Name</td>
								<td align="center" width="17%">Price</td>
								<td align="center" width="17%">IsHot</td>
								<td width="7%" align="center">Edit</td>
								<td width="7%" align="center">Delete</td>
							</tr>
							<c:forEach items="${menuList }" var="menu" varStatus="vs">
								<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${vs.count }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">
									<img width="80" src="${ pageContext.request.contextPath }/${menu.image }"></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">${menu.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">${menu.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">${menu.is_hot=="1"?"Yes":"No" }</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/admin/menu/edit.jsp?mid=${menu.mid}">
											<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="javascript:void(0)" onclick="delMenu('${menu.mid}')">
											<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>

			</TBODY>
		</table>
	</form>
</body>
</HTML>

