<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css" />
	<title>增加车辆</title>
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
			<li><a href="#">车辆管理</a></li>
				<li>增加新车</li>
		</ol>

		<h2 class="page-header">增加新车</h2>
		<form id="form1" class="form-horizontal" action="${pageContext.request.contextPath}/carinfo/insertcar.action" method="post">
			<div class="form-group">
				<label for="" class="col-sm-2">车牌号</label>
				<div class="col-sm-10">
					<input type="text" id="deptName" name="cid" placeholder="请输入车牌号" class="form-control"/>
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">品牌</label>
				<div class="col-sm-10">
					<input type="text" id="" name="ctype" placeholder="请输入品牌" class="form-control"/>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">驾驶证</label>
				<div class="col-sm-10">
					<select name="ccard">
				<c:forEach items="${driverlist}" var="driver">
					<%-- <c:if test="${driver.did==car.ccard}">
						<option value="${driver.did}" selected>${driver.did}</option>
					</c:if> --%>
					<c:if test="${driver.did!=car.ccard}">
						<option value="${driver.did}">${driver.did}</option>
					</c:if>
				</c:forEach>
			</select>
				</div>					
			</div>
						<div class="form-group">
				<label for="" class="col-sm-2">备注</label>
				<div class="col-sm-10">
					<input type="text" id="" name="cbackup" placeholder="请输入备注" class="form-control"/>
				</div>					
			</div>
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="submit"  value="增加新车" class="btn btn-success"/>
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>		
		</form>
	</div>

	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
</body>
</html>