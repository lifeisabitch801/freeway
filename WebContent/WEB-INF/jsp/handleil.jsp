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
	<title>增加部门</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="#">违章管理</a></li>
				<li>处理罚单</li>
		</ol>

		<h2 class="page-header">处理罚单</h2>
		<form id="form1" class="form-horizontal" method="post" 
					action="${pageContext.request.contextPath}/illegalre/updaterstate.action">
		<input type="hidden" name="cid" value="${ill.cid}">
		<input type="hidden" name="rlocation" value="${ill.rlocation}">
		<input type="hidden" name="mtype" value="${ill.rid}">
		<input type="hidden" name="rmoney" value="${rule.rmoney}">
		<input type="hidden" name="rscore" value="${rule.rscore}">
		<input type="hidden" name="iid" value="${ill.iid}">
			<div class="form-group">
				<label for="" class="col-sm-2">车牌号</label>
				<div class="col-sm-10">
					${ill.cid}
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">地点</label>
				<div class="col-sm-10">
					${ill.rlocation}
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">违章原因</label>
				<div class="col-sm-10">
					<c:forEach items="${rlist}" var="r">
						<c:if test="${ill.rid==r.rid}">
							${r.raction}	
						</c:if>						
						</c:forEach>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">扣分</label>
				<div class="col-sm-10">
					<c:forEach items="${rlist}" var="r">
						<c:if test="${ill.rid==r.rid}">
							${r.rscore}	
						</c:if>						
						</c:forEach>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">罚款</label>
				<div class="col-sm-10">
					<c:forEach items="${rlist}" var="r">
						<c:if test="${ill.rid==r.rid}">
							${r.rmoney}	
						</c:if>						
						</c:forEach>
				</div>					
			</div>
			
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="submit"  value="确认" class="btn btn-success" />
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