<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script type="text/javascript">
 			$(function () {
 				//ajax异步获取属性分类列表
				$.ajax({
					type: "post",
					async : true,
					url : "${pageContext.request.contextPath}/adminCategoryUI",
					dataType : "json",
					success : function(data) {
						var content = "";
						for (var i = 0; i < data.length; i++) {
							content += "<option value='"+data[i].cid+"'>"+data[i].name+"</option>";
						}
						$("#cid").append(content);
					}
				});
 				
 				//ajax提交表单
				$("#submit").click(function () {
					$.ajax({
						type: "post",
						url : "${pageContext.request.contextPath}/adminAddMenu",
						async : true,
						cache: false,
					    data: new FormData($("#form1")[0]),
					    processData: false,
					    contentType: false,
						dataType : "json",
						success : function(data) {
							alert("Add Successfully！");
						},
						error:function(err){
							alert("Add Failed!！");
						}
					});
	 				
				});
 				
			});

		</script>
	</HEAD>
	
	<body>
		<!--  -->
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>Add a Good</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Name：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="name" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Hot?：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="is_hot">
							<option value="1">Yes</option>
							<option value="0">No</option>
						</select>
					</td>	
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Price：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="price" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>

				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Photo：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="file" name="upload" />
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Category：
					</td>
					<td class="ta_01"  bgColor="#ffffff" colspan="3">
						<select id="cid" name="cid">
							<!-- <option value="">套餐类</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Description：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="desc" rows="5" cols="30"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">

						<input type="button" id="submit" value="confirm" class="button_ok">
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="reset" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="back"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>