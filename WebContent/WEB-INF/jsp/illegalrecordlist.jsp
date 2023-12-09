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
	<title>违章记录列表</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->

	<style type="text/css">
		.pagination {
			margin: 0!important;
		}
	</style>
</head>
<script>
	function toinsertil(){
		location.href="${pageContext.request.contextPath}/illegalre/toinsertillegals.action";
	}
	function handleil(iid){
		location.href="${pageContext.request.contextPath}/illegalre/toupdaterstate.action?iid="+iid;
	}
</script>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>违章管理</li>
		</ol>

		<h2 class="page-header">违章记录</h2>
		<div class="row">
			<form class="form-inline" action="" method="post" name="form1">
				<div class="form-group">
					<label for="">车牌号</label>
					<input type="text" name="cid" id="cid">
				</div>
				<div class="form-group">
					<label for="">时间</label>
					<select class="form-control" name="optime" id="optime">					
						<option value="0">请选择查询时间</option>
						<option value="1">一个星期内</option>
						<option value="2">一个月内</option>
						<option value="3">三个月内</option>
					</select>
				</div>	
				<div class="form-group">
					<div class="input-group">
						
		            	<span class="input-group-btn">
		                	<button type="button" class="btn btn-primary" onclick="query()" >搜索</button>
		                </span>	                	
		            </div>					
				</div>				
			</form>
		</div>
        <div class="row">
			<div class="col-sm-offset-8 col-sm-4">
				<a href="javascript:toinsertil()" class="btn btn-success btn-block">插入违章车辆</a>
			</div>
		</div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>车牌号</th>
				    <th>时间</th>
					<th>地点</th>
					<th>罚款原因</th>
					<th>状态</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>	
			<c:forEach items="${illist.list}" var="il">		
				<tr>
					<td>${il.cid}</td>
					<td>${il.rcreatetime}</td>
					<td>${il.rlocation}</td>
					<td>
					<c:forEach items="${rlist}" var="r">
						<c:if test="${r.rid==il.rid}">${r.raction}</c:if>
					</c:forEach>
					</td>
					<td>
					<c:if test="${il.rstate==0}">未处理</c:if>
					<c:if test="${il.rstate==1}">已处理</c:if>
					</td>
					<td>${il.ibackup}</td>
					<td><c:if test="${il.rstate==0}">
						<a href="javascript:handleil(${il.iid})" class="btn btn-primary btn-sm update-btn">违章处理</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		
	<div class="row">
		一共查询到${illist.total}条记录&nbsp;
	
		<input class="btn btn-success btn-block" style="width:100px" id="page1" type="button" onclick="jump(-1)" value="上一页">
		&nbsp;当前是第${illist.pageNum}页&nbsp;
		<input class="btn btn-success btn-block" style="width:100px" id="page2"  type="button" onclick="jump(1)" value="下一页">
		</div>
	
	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- 引入全局公共js文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/global.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<!-- 引入layer弹出层js功能 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script>
	$(function(){
		if(${illist.pageNum}==1){
			$("#page1").prop("disabled",true);
		}
		if(${illist.pages}==${illist.pageNum}){
			$("#page2").prop("disabled",true);
		}
	} )
	function query(){
		 var param1 = $("#cid").val();
		 var param2 = $("#optime").val();
		 location.href="${pageContext.request.contextPath}/illegalre/allillegals.action?cid="+param1+"&pageno=1"+"&optime="+param2;
	 }
	  function jump(i){
		  var param1 = $("#cid").val();
		  var param2 = $("#optime").val();
		  var pageno = ${illist.pageNum}+i;
		  location.href="${pageContext.request.contextPath}/illegalre/allillegals.action?pageno="+pageno+"&cid="+param1+"&optime="+param2;
	  }   
	</script>
</body>
</html>