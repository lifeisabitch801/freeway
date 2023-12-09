<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css" />
	<title>驾驶员列表</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->

	<style type="text/css">
		.pagination {
			margin: 0!important;
		}
	</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
function toinsertdriver(){
	location.href="${pageContext.request.contextPath}/driver/toinsertdriver.action";
}
function toupdatedriver(did){
	location.href="${pageContext.request.contextPath}/driver/toupdatedriver.action?did="+did;
}
function deletedriver(did){
	//确认方法
	var result = confirm("确认删除");
	if(result==true){
		location.href="${pageContext.request.contextPath}/driver/deletedriver.action?did="+did;
		alert("删除成功");
	}else{
		alert("取消删除");
	}
}

function toupdatemoney(did){
	location.href="${pageContext.request.contextPath}/driver/toupdatemoney.action?did="+did;
}
</script>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>驾驶员管理</li>
		</ol>

		<h2 class="page-header">驾驶员列表</h2>
        <div class="row">
         <div class="col-sm-3">
        <input type="text" id="searchdid" value="${param.searchdid}" placeholder="请输入驾驶证号">
        </div>
         <div class=" col-sm-3">
         <a href="#" onclick="query()" class="btn btn-success btn-block">搜索</a>
         </div>
			<div class="col-sm-offset-8 col-sm-4">
				<a href="javascript:toinsertdriver()" class="btn btn-success btn-block">增加驾驶员</a>
			</div>
		</div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>驾驶证号</th>
					<th>姓名</th>
					<th>身份证号</th>
					<th>性别</th>
					<th>总分</th>
					<th>手机号</th>
					<th>余额</th>
					<!-- <th>备注</th> -->
					<th>操作</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach items="${driverpage.list}" var="d">
			<tr>
			<td>${d.did}</td>
			<td>${d.dname}</td>
			<td>${d.didcard}</td>
			<td><c:if test="${d.dsex==2}">男</c:if>
			<c:if test="${d.dsex==1}">女</c:if></td>
			<td>${d.dscore}</td>
			<td>${d.dtel}</td>
			<td>${d.dmoney}</td>
			<%-- <td>${d.cbackup}</td> --%>
			<td>
				<a href="javascript:toupdatedriver('${d.did}');" class="btn btn-primary btn-sm update-btn">修改</a>
				<a href="javascript:deletedriver('${d.did}');" class="btn btn-danger btn-sm del-btn" data-id="6">删除</a>
				<a href="javascript:toupdatemoney('${d.did}');" class="btn btn-primary btn-sm update-btn">充值</a>
				<%-- <input type="button" onclick="toupdatedriver('${d.did}')" value="修改"/>
				<input type="button" onclick="deletedriver('${d.did}')" value="删除"/>
				<input type="button" onclick="toupdatemoney('${d.did}')" value="充值"/> --%>
				</td>
			</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<div class="row">
		一共查询到${driverpage.total}条记录&nbsp;
	
		<input class="btn btn-success btn-block" style="width:100px" id="page1" type="button" onclick="jump(-1)" value="上一页">
		&nbsp;当前是第${driverpage.pageNum}页&nbsp;
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
		//console.log(${page});
		if(${driverpage.pageNum}==1){
			$("#page1").prop("disabled",true);
		}
		if(${driverpage.pages}==${driverpage.pageNum}){
			$("#page2").prop("disabled",true);
		}
	} )
	 function query(){
		 var param1 = $("#searchdid").val();
		 location.href="${pageContext.request.contextPath}/driver/selectdrivers.action?searchdid="+param1+"&pageno=1";
	 }
	  function jump(i){
		  var param1 = $("#searchdid").val();
		  var pageno = ${driverpage.pageNum}+i;
		  location.href="${pageContext.request.contextPath}/driver/selectdrivers.action?searchdid="+param1+"&pageno="+pageno;
	  }   
	</script>
</body>
</html>