<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css" />
	<title>修改个人信息</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="#">高速管理系统</a></li>
			<li><a href="#">管理员信息管理</a></li>			
			<li>修改个人信息</li>
		</ol>

		<h2 class="page-header">修改个人信息</h2>
		<form id="form1" class="form-horizontal" 
		action="${pageContext.request.contextPath}/users/updateuserinfo.action" 
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="uid" value="${users.uid}"><br><br>
		<input type="hidden" name="olduface" value="${users.uface}"><br><br>
			<div class="form-group">
				<label for="" class="col-sm-2">管理员姓名</label>
				<div class="col-sm-10">
					<input type="text" id="oldPwd"  name="uname" value="${users.uname}" class="form-control"/>
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">头像</label>
				<div class="col-sm-10">
					<input  id="empPwd" type="file" name="nuface"  class="form-control"/>
				</div>					
			</div>
			
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="submit"  value="立即修改" class="btn btn-success" id="updateBtn"/>
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>		
		</form>
	</div>
	
	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- 引入全局公共js文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/global.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<!-- 引入layer弹出层js功能 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<!-- 	<script type="text/javascript">
		
		$(document).ready(function() {
			
			/*表单验证函数*/
			function checkForm() {
				
				//旧密码验证
				var oldPwd = $('#oldPwd');
				
				var flag = true;

				$.ajax({
					url: baseUrl + '/emp/getPwd',
					type: 'POST',
					dataType: 'text',
					async:false
				})
				.done(function(data) {
					if (oldPwd.val() != data) 
						flag = false;
				})
				.fail(function() {
					console.log("error");
				})
				
				if (!flag) {
					layer.msg('原始密码输入不正确');
					return false;
				}

				//密码验证
				var empPwd = $('#empPwd');
				var empPwd2 = $('#empPwd2');
				
				if (empPwd.val() == '' || empPwd.val().length < 6 || empPwd.val().length > 12) {
					layer.msg('密码必须6~12位');
					empPwd.focus();
					return false;
				}

				if (empPwd.val() != empPwd2.val()) {
					layer.msg('两次密码输入不一致！');
					empPwd2.focus();
					return false;
				}
												
				return true;
			}

			// 修改按钮单击事件
			$('#updateBtn').click(function() {

				if ( !checkForm() )
					return;

				// 表单序列化
				var params = $('#form1').serialize();

				// 加载层
				layer.load();

				// 发出ajax请求
				$.post(baseUrl + '/emp/updatePwd',params,function(data){
				
					layer.closeAll();
					layer.msg('密码修改成功，下次登录生效');
					
					setTimeout(function() {
						location.href = 'logout.html';
					},500);
				});

			});


		});		

	</script> -->
</body>
</html>