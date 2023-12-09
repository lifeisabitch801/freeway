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
	<title>UPDATE MONEY</title>
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
			<li><a href="#">驾驶员管理</a></li>
				<li>充值</li>
		</ol>

		<h2 class="page-header">充值</h2>
		<form id="form1" class="form-horizontal"  
		action="${pageContext.request.contextPath}/feerecord/updatemoneyfee.action"  method="post">
		<input type="hidden" name="fid" value="${fid}">
			<input type="hidden" name="did" value="${driver.did}">
			<input type="hidden" name="oldm" value="${driver.dmoney}">
			<div class="form-group">
				<label for="" class="col-sm-2">驾驶证号</label>
				<div class="col-sm-10">
					${driver.did}
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">姓名</label>
				<div class="col-sm-10">
					${driver.dname}
				</div>					
			</div>
			
			<div class="form-group">
				<label for="" class="col-sm-2">余额</label>
				<div class="col-sm-10">
					${driver.dmoney}元
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">充值金额</label>
				<div class="col-sm-10">
					<input type="text" id="" name="dmoney" placeholder="请输入金额" class="form-control" />
				</div>					
			</div>
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="submit"  value="充值" class="btn btn-success"/>
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>	
		    
		</form>
	</div>

	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
	

	</script>
</body>
</html>