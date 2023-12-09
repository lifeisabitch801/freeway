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
	<title>查询员工列表</title>
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
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
 function toupdate(fid){
	 location.href="${pageContext.request.contextPath}/feerecord/toupdatefee.action?fid="+fid;
 }
</script>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li>进站管理</li>
		</ol>

		<h2 class="page-header">进站车辆列表</h2>
        <div class="row">
        	<form class="form-inline" action="${pageContext.request.contextPath}/feerecord/insertfee.action" method="post">
        		<div class="form-group">
        			<label for="">车牌号</label>
        			
        			<select name="cid" class="form-control">
				<c:forEach items="${clist}" var="c">
							<option value="${c.cid}">${c.cid}</option>						
					</c:forEach>
			</select>
			
        		</div>
        		<div class="form-group">
        			<label for="">进站点</label>
        			<select name="beginid" class="form-control">
				<c:forEach items="${slist}" var="s">
						<option value="${s.sid}">${s.sname}</option>
				</c:forEach>
			</select>
        		</div>	
        		<div class="form-group">
        			<div class="input-group">
        				
                    	<span class="input-group-btn">
                        	<button type="submit" class="btn btn-primary">进站</button>
                        </span>	                	
                    </div>					
        		</div>				
        	</form>
        </div>
		<table class="table table-bordered table-striped" id="dataTable">
			<thead>
				<tr>
					<th>车牌号</th>
				    <th>进站点</th>
					<th>出站点</th>
					<th>收费金额</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>	
			<c:forEach items="${feepage.list}" var="fee">
				<tr>
					<td>${fee.cid}</td>
					<td>
					<c:forEach items="${slist}" var="s">
					<c:if test="${s.sid==fee.beginid}">
						${s.sname}
					</c:if>
				</c:forEach>
				</td>
					<td>
					<c:forEach items="${slist}" var="s">
					<c:if test="${s.sid==fee.endid}">
						${s.sname}
					</c:if>
				</c:forEach>
					</td>
					<th>${fee.fprice}</th>
					<td>
					<c:if test="${fee.fstate==1}">已进站</c:if>
					<c:if test="${fee.fstate==0}">已出站</c:if>
					</td>
					<th>
					<c:if test="${fee.fstate==1}">
					<a href="javascript:toupdate(${fee.fid});" class="btn btn-primary btn-sm update-btn">出站</a>
					</c:if>
					</th>
				</tr>
			</c:forEach>			
			</tbody>
		</table>
		<div class="row">
		一共查询到${feepage.total}条记录&nbsp;
	
		<input class="btn btn-success btn-block" style="width:100px" id="page1" type="button" onclick="jump(-1)" value="上一页">
		&nbsp;当前是第${feepage.pageNum}页&nbsp;
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
		if(${feepage.pageNum}==1){
			$("#page1").prop("disabled",true);
		}
		if(${feepage.pages}==${feepage.pageNum}){
			$("#page2").prop("disabled",true);
		}
	} )
	 function query(){
		 //var param1 = $("#searchcid").val();
		 location.href="${pageContext.request.contextPath}/feerecord/feerecordlist.action?pageno=1";
	 }
	  function jump(i){
		  //var param1 = $("#searchcid").val();
		  var pageno = ${feepage.pageNum}+i;
		  location.href="${pageContext.request.contextPath}/feerecord/feerecordlist.action?pageno="+pageno;
	  }   
	</script>
</body>
</html>