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
	<title>增加驾驶员</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
	function validdid(){
		var did = document.form0.did.value;
		$.get("validdid.action?did="+did,
				function(resp){
			//alert(resp);
			if(resp=="error"){
				$("#msg").css("color","red").html("驾驶证号重复!")
				
			}
			else if(resp=="ok"){
				$("#msg").css("color","green").html("驾驶证号合法!")
			}
		})
	}
	function validinsert(){
	//-------1-----------
	var did = document.form0.did.value;
	var span1 = document.getElementById("span1");
	var flag = true;
	if(did == ""){
		span1.innerHTML="驾驶证号不能为空";
		span1.style.color = "red";
		flag = false;
	}else{
		span1.innerHTML="";
		span1.style.color = "green";
	}
	//-------2-----------
	var dname = document.form0.dname.value;
	var span2 = document.getElementById("span2");
	
	if(dname == ""){
		span2.innerHTML="姓名不能为空";
		span2.style.color = "red";
		flag = false;
	}else{
		span2.innerHTML="";
		span2.style.color = "green";
	}
	//-------3-----------
	var didcard = document.form0.didcard.value;
	var span3 = document.getElementById("span3");
	
	if(didcard == ""){
		span3.innerHTML="身份证号码不能为空";
		span3.style.color = "red";
		flag = false;
	}else{
		span3.innerHTML="";
		span3.style.color = "green";
	}
	//-------4-----------
	var dsex = document.form0.dsex.value;
	var span4 = document.getElementById("span4");
	
	if(dsex == ""){
		span4.innerHTML="性别不能为空";
		span4.style.color = "red";
		flag = false;
	}else{
		span4.innerHTML="";
		span4.style.color = "green";
	}
	//-------5-----------
	var dscore = document.form0.dscore.value;
	var span5 = document.getElementById("span5");
	
	if(dscore == ""){
		span5.innerHTML="总分不能为空";
		span5.style.color = "red";
		flag = false;
	}else{
		span5.innerHTML="";
		span5.style.color = "green";
	}
	//-------6-----------
	var dtel = document.form0.dtel.value;
	var span6 = document.getElementById("span6");
	
	if(dtel == ""){
		span6.innerHTML="手机号不能为空";
		span6.style.color = "red";
		flag = false;
	}else{
		span6.innerHTML="";
		span6.style.color = "green";
	}
	//-------7-----------
	var dmoney = document.form0.dmoney.value;
	var span7 = document.getElementById("span7");
	
	if(dmoney == ""){
		span7.innerHTML="余额不能为空";
		span7.style.color = "red";
		flag = false;
	}else{
		span7.innerHTML="";
		span7.style.color = "green";
	}
	if(flag==false){
		return false;
	}
}
	
	//BACK
	/* function backdlist(){
		location.href="${pageContext.request.contextPath}/driver/selectalldriver.action";
	} */
</script>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="#">驾驶员管理</a></li>
				<li>增加驾驶员</li>
		</ol>

		<h2 class="page-header">增加驾驶员</h2>
		<form id="form1" class="form-horizontal" action="${pageContext.request.contextPath}/driver/insertdriver.action" method="post" 
				enctype="multipart/form-data" name="form0" onsubmit="return validinsert();">
			<div class="form-group">
				<label for="" class="col-sm-2">驾驶证号</label>
				<div class="col-sm-10">
					<input type="text" id="deptName" name="did" placeholder="请输入驾驶证号" value="" onblur="validdid()" class="form-control"/>
					<span id="msg"></span><span id="span1"></span>
				</div>					
			</div>	
			<div class="form-group">
				<label for="" class="col-sm-2">姓名</label>
				<div class="col-sm-10">
					<input type="text" id="" name="dname" placeholder="请输入姓名" class="form-control"/>
					<span id="span2"></span>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">身份证号码</label>
				<div class="col-sm-10">
					<input type="text" id="" name="didcard" placeholder="请输入身份证号码" class="form-control"/>
					<span id="span3"></span>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">性别</label>

				 <div class="radio-list col-sm-10">
				         <label>
				             <input type="radio" name="dsex" value="1" checked="checked">女

				         </label>
				         <label>
				              <input type="radio" name="dsex" value="2">男
				         </label>
				         <span id="span4"></span>
				</div>
			</div>
			<div class="form-group">
				<!-- <label for="" class="col-sm-2">总分</label> -->
				<div class="col-sm-10">
					<input type="hidden" id="" name="dscore" value="12" class="form-control"/>
					<span id="span5"></span>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">手机号</label>
				<div class="col-sm-10">
					<input type="text" id="" name="dtel" placeholder="请输入手机号" class="form-control"/>
					<span id="span6"></span>
				</div>					
			</div>
			<div class="form-group">
				<!-- <label for="" class="col-sm-2">余额</label> -->
				<div class="col-sm-10">
					<input type="hidden" id="" name="dmoney" value="0" class="form-control"/>
					<span id="span7"></span>
				</div>					
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2">备注</label>
				<div class="col-sm-10">
					<textarea name="cbackup" id="empInfo" rows="5" placeholder="请输入备注介绍" class="form-control"></textarea>
				</div>					
			</div>
			<div class="form-group">					
				<div class="col-sm-10 col-sm-offset-2">
					<input type="submit"  value="增加驾驶员" class="btn btn-success" />
					<input type="button"  value="取消" class="btn btn-danger" onclick="history.back();"/>
				</div>
			</div>		
		</form>
	</div>

	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<<!-- script type="text/javascript">
		
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