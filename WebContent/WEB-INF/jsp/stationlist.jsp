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
	<title>查询站点列表</title>
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
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
function toinsertstation(){
		location.href="${pageContext.request.contextPath}/station/toinsertstation.action";
	}
function toupdatestation(sid){
	//alert(sid);
	location.href="${pageContext.request.contextPath}/station/toupdatestation.action?sid="+sid;
}
function del(sid){
	//确认方法
	var result = confirm("确认删除");
	if(result==true){
		location.href="deletestation.action?sid="+sid;
		alert("删除成功");
	}else{
		alert("取消删除");
	}
}
</script>
</head>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>站点管理</li>
		</ol>

		<h2 class="page-header">站点列表</h2>
        <div class="row">
        <div class="col-sm-3">
        <input type="text" id="searchsname" value="${param.searchname}" placeholder="请输入站点名">
        </div>
         <div class=" col-sm-3">
         <a href="#" onclick="query()" class="btn btn-success btn-block">搜索</a>
         </div>
			<div class="col-sm-offset-8 col-sm-4">
				<a href="${pageContext.request.contextPath}/station/toinsertstation.action" class="btn btn-success btn-block">增加新站点</a>
			</div>
		</div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>站点编号</th>
					<th>站点名称</th>
					<th>站点收费金额</th>
					<th>站点说明</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach items="${stationpage.list}" var="s">
		<tr>
					<td>${s.sid}</td>
					<td>${s.sname}</td>
					<td>${s.sprice}元</td>
					<td>${s.sbackup}</td> 
					<td>
						<a href="javascript:toupdatestation(${s.sid})" class="btn btn-primary btn-sm update-btn">修改</a>
					    <a href="javascript:del(${s.sid})" class="btn btn-danger btn-sm del-btn" data-id="6">删除</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
		一共查询到${stationpage.total}条记录&nbsp;
	
		<input class="btn btn-success btn-block" style="width:100px" id="page1" type="button" onclick="jump(-1)" value="上一页">
		&nbsp;当前是第${stationpage.pageNum}页&nbsp;
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
		if(${stationpage.pageNum}==1){
			$("#page1").prop("disabled",true);
		}
		if(${stationpage.pages}==${stationpage.pageNum}){
			$("#page2").prop("disabled",true);
		}
	} )
	 function query(){
		 var param1 = $("#searchsname").val();
		 location.href="${pageContext.request.contextPath}/station/stationslist.action?searchname="+param1+"&pageno=1";
	 }
	  function jump(i){
		  var param1 = $("#searchsname").val();
		  var pageno = ${stationpage.pageNum}+i;
		  location.href="${pageContext.request.contextPath}/station/stationslist.action?searchname="+param1+"&pageno="+pageno;
	  }   
	</script>
</body>
</html>