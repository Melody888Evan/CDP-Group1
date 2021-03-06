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
 				//商品属性列表
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
				//表单数据回显
				$.ajax({
					type: "post",
					async : true,
					url : "${pageContext.request.contextPath}/adminEditMenuUI",
					dataType : "json",
					data:{"mid": "${param.mid}"},
					success : function(data) {
						$("#name").attr("value",data.name);
						$("#is_hot option[value='"+data.is_hot+"']").prop("selected",true);
						$("#price").attr("value",data.price);
		 				$("#cid option[value='"+data.cid+"']").prop("selected",true);
		 				$("#desc").html(data.desc);
					}
				});
				$("#submit").click(function () {
					$.ajax({
						type: "post",
						url : "${pageContext.request.contextPath}/adminUpdateMenu?mid=${param.mid}",
						async : true,
						cache: false,
					    data: new FormData($("#form1")[0]),
					    processData: false,
					    contentType: false,
						dataType : "json",
						success : function(data) {
							alert("Change Successfully！");
						},
						error:function(err){
							alert("Change Failed！");
						}
					});
	 				
				});

			});
 			
		</script>
	</HEAD>
	
	<body>
		<!--  -->
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
			
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>Edit the Good </STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Name：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="name" value="" id="name" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Hot?：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						
						<select name="is_hot" id="is_hot">
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
						<input type="text" name="price" value="" id="price" class="bg"/>
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
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="cid" id="cid">
			<!-- 				<option value="">主食菜</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						Description：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="desc" id="desc" rows="5" cols="30"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
		<!-- 				<button type="submit" id="submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button> -->
						<input type="button" id="submit" value="confirm" class="button_ok">
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="Reset" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="back"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>