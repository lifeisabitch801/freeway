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
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
function backslist(){
	location.href="${pageContext.request.contextPath}/station/stationslist.action?pageno=1";
}
function validupdate(){
	var sname = document.form1.sname.value;
	var span1 = document.getElementById("span1");
	var flag = true;
	if(sname == ""){
		span1.innerHTML="站点名称不能为空";
		span1.style.color = "red";
		flag = false;
	}else{
		span1.innerHTML="";
		span1.style.color = "green";
	}
	var sprice = document.form1.sprice.value;
	var span2 = document.getElementById("span2");
	
	if(sprice == ""){
		span2.innerHTML="收费金额不能为空";
		span2.style.color = "red";
		flag = false;
	}else{
		span2.innerHTML="";
		span2.style.color = "green";
	}
	var span3 = document.getElementById("span3");
	var f = sprice.search(/\./);
	//return false;
	if(f !=-1){
		span3.innerHTML="金额不能为小数";
		span3.style.color = "red";
		flag = false;
	}else{
		span3.innerHTML="";
		span3.style.color = "green";
	}
	
	if(flag==false){
		return false;
	}
}
</script>
<body>	
	<div class="container">
		
		
			<ol class="breadcrumb">
				<li><a href="#">站点管理</a></li>
				<li>修改站点</li>
			</ol>
		
		<h2 class="page-header">修改站点</h2>
		<form id="form1" class="form-horizontal" action="${pageContext.request.contextPath}/station/updatestation.action" 
				method="post" onsubmit="return validupdate();" name="form1">
			<input type="hidden" name="sid" value="${station.sid}">
			<input type="hidden" name="oldsname" value="${station.sname}">
			<div class="form-group">
				<label for="" class="col-sm-2">站点名称</label>
				<div class="col-sm-10">
					<input type="text" id="deptName" name="sname" value="${station.sname}" onblur="validsname()"  class="form-control"/>
					<span id="span1"></span>
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">收费金额</label>
				<div class="col-sm-10">
					<input type="text" id=""   class="form-control" name="sprice" value="${station.sprice}"/>
					<span id="span2"></span><span id="span3"></span>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">站点说明</label>
				<div class="col-sm-10">
					<input type="text" id=""   class="form-control" name="sbackup" value="${station.sbackup}"/>
				</div>					
			</div>
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
				<input type="submit" class="btn btn-success" value="确认修改">  
				<!-- <input type="button" class="btn btn-success" value="取消" onclick="backslist()">
					<input type="button"  value="修改站点" class="btn btn-success" onclick="history.back();"/> -->
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>		
		</form>
	</div>

	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<!-- <script type="text/javascript">
		
		$(document).ready(function() {

			/*表单验证*/
			var deptName = $('#deptName');
			var deptLoc = $('#deptLoc');

			$('#form1').submit(function() {
				
				if (deptName.val() == "" || deptName.val().length > 10)  {
					alert("部门名称不能为空且最多10字符");
					return false;
				}

				if (deptLoc.val() == "" || deptLoc.val().length > 20)  {
					alert("部门地址不能为空且最多20字符");
					return false;
				}

			});

		});		

	</script> -->
</body>
</html>