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
	<title>车辆管理</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
	<style type="text/css">
		.pagination {
			margin: 0!important;
		}
	</style>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
function toupdatecar(cid){
	location.href="${pageContext.request.contextPath}/carinfo/toupdatecar.action?cid="+cid;
}
function toinsertcar(){
	location.href="${pageContext.request.contextPath}/carinfo/toinsertcar.action";
}
function deletecar(cid){
	var res = confirm("确认删除");
	if(res==true){
		location.href="${pageContext.request.contextPath}/carinfo/deletecar.action?cid="+cid;
		alert("删除成功");
	}else{
		alert("取消删除");
	}
}
function backmain(){
	location.href="${pageContext.request.contextPath}/users/mainpage.action";
}
</script>

<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>车辆管理</li>
		</ol>

		<h2 class="page-header">车辆列表</h2>
        <div class="row">
		<div class="col-sm-3">
        <input type="text" id="searchcid" value="${param.searchcid}" placeholder="请输入车牌号">
        </div>
         <div class=" col-sm-3">
         <a href="#" onclick="query()" class="btn btn-success btn-block">搜索</a>
         </div>
			<div class="col-sm-offset-8 col-sm-4">
				<a href="javascript:toinsertcar();" class="btn btn-success btn-block">增加车辆</a>
			</div>
		</div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>车牌号</th>
				    <th>车品牌</th>
					<th>驾驶证号</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach items="${carpage.list}" var="c">
					<tr>
						<td>${c.cid}</td>
						<td>${c.ctype}</td>
						<td>${c.ccard}</td>
						<td>${c.cbackup}</td>
						<th>
						<a href="javascript:toupdatecar('${c.cid}');" class="btn btn-primary btn-sm update-btn">修改</a>
						<a href="javascript:deletecar('${c.cid}');" class="btn btn-danger btn-sm del-btn" data-id="6">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
		一共查询到${carpage.total}条记录&nbsp;
	
		<input class="btn btn-success btn-block" style="width:100px" id="page1" type="button" onclick="jump(-1)" value="上一页">
		&nbsp;当前是第${carpage.pageNum}页&nbsp;
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
		if(${carpage.pageNum}==1){
			$("#page1").prop("disabled",true);
		}
		if(${carpage.pages}==${carpage.pageNum}){
			$("#page2").prop("disabled",true);
		}
	} )
	 function query(){
		 var param1 = $("#searchcid").val();
		 location.href="${pageContext.request.contextPath}/carinfo/selectcars.action?searchcid="+param1+"&pageno=1";
	 }
	  function jump(i){
		  var param1 = $("#searchcid").val();
		  var pageno = ${carpage.pageNum}+i;
		  location.href="${pageContext.request.contextPath}/carinfo/selectcars.action?searchcid="+param1+"&pageno="+pageno;
	  }   
	</script>
</body>
</html>