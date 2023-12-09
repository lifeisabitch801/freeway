<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上传头像</title>
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css" />
	<!-- 头像裁剪css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/head/js/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/head/js/sitelogo.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/head/css/font-awesome.min.css">
	<title>修改头像</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>
	
	<!-- 外层容器开始 -->
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="#">高速公路管理系统</a></li>
			<li><a href="#">管理员信息管理</a></li>			
			<li>更换头像</li>
		</ol>
<form action="${pageContext.request.contextPath}/users/updateuserinfo.action" method="post" enctype="multipart/form-data"> 
<input type="hidden" name="uid" value="${users.uid}"><br><br>
<input type="hidden" name="olduface" value="${users.uface}"><br><br>
管理员头像：<input type="file" name="nuface" class="btn btn-primary"><br><br>
<img src="${users.uface}" width="100px"><br><br>
<input type="submit" value="确认修改" class="btn btn-primary"><br><br>
</form>
		<%-- <h2 class="page-header">头像上传</h2>
		
		<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#avatar-modal" style="margin: 10px;">
			更换头像
		</button>

		
		
		<!-- 头像预览 -->
		<img id="headImg" src="${users.uface}" alt="当前头像" style="width:100px" class="img-responsive">
		<!-- 图片base64数据 -->
		<input type="hidden" id="imgBase64" name="imgBase64">
	</div>
	<!-- 外层容器结束 -->

	<!-- 头像裁剪模态层开始 -->
	<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
				<form class="avatar-form"  
				action="${pageContext.request.contextPath}/users/updateuserinfo.action" 
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="uid" value="${users.uid}"><br><br>
				<input type="hidden" name="olduface" value="${users.uface}"><br><br>
				<input type="file" name="nuface"><br><br>
				<input type="submit" value="上传新头像" id="uploadBtn" class="btn btn-success">
				</form> --%>
			<%-- 		<div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">&times;</button>
						<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput" style="line-height: 35px;">图片上传</label>
								<button class="btn btn-danger"  type="button" style="height: 35px;" onClick="$('input[id=avatarInput]').click();">请选择图片</button>
								<span id="avatar-name"></span>
								<input class="avatar-input hide" id="avatarInput" name="nuface" type="file">
								<img src="${users.uface}" width="100px"><br><br>
								<!-- <input type="submit" value="确认修改"> -->
								</div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg" id="imageHead"></div>
									<!--<div class="avatar-preview preview-md"></div>
							<div class="avatar-preview preview-sm"></div>-->
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-4">
									<div class="btn-group">
										<button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
									</div>
									<div class="btn-group">
										<button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
									</div>
								</div>
								<div class="col-md-5" style="text-align: right;">								
									<button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移动">
									<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
									</span>
								  </button>
								  <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
									<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
									  <!--<span class="fa fa-search-plus"></span>-->
									</span>
								  </button>
								  <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
									<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
									  <!--<span class="fa fa-search-minus"></span>-->
									</span>
								  </button>
								  <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
										<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)" aria-describedby="tooltip866214">
										</span>
								   </button>
								</div>
								<div class="col-md-3">
									<button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal">保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>--%>
			</div>
		</div>
	</div> 
	<!-- 头像裁剪模态层 -->

	<!--引入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- 引入全局公共js文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/global.js"></script>
	<!-- 引入参数插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/param.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<!-- 引入layer弹出层js功能 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<!-- 引入头像裁剪相关js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/head/js/cropper.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/head/js/sitelogo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/head/js/html2canvas.min.js"></script>
	<!-- <script type="text/javascript">

		//显示当前登录用户头像
		$.get(baseUrl + '/emp/queryPic',function(data) {

			if (data && data != 'null') {					
				$('#headImg').attr('src',data);
			} 

		});
		
		//做个下简易的验证  大小 格式 
		$('#avatarInput').on('change', function(e) {

			var filemaxsize = 1024 * 1;//1M			
			var target = $(e.target);
			var Size = target[0].files[0].size / 1024;
			
			//判断文件大小
			if(Size > filemaxsize) {
				layer.msg('图片过大，请重新选择小于1M的文件!');
				$(".avatar-wrapper").childre().remove;
				return false;
			}

			//判断文件是否是图片
			if(!this.files[0].type.match(/image.*/)) {
				layer.msg('请选择正确的图片!')
			} else {
				var filename = document.querySelector("#avatar-name");
				var texts = document.querySelector("#avatarInput").value;
				var teststr = texts; //你这里的路径写错了
				testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
				filename.innerHTML = testend;
			}
		
		});
		
		//把裁剪结果转换为base64格式
		$(".avatar-save").on("click", function() {
			var img_lg = document.getElementById('imageHead');
			// 截图小的显示框内的内容
			html2canvas(img_lg, {
				allowTaint: true,
				taintTest: false,
				onrendered: function(canvas) {
					canvas.id = "mycanvas";
					//生成base64图片数据
					var dataUrl = canvas.toDataURL("image/jpeg");
					var newImg = document.createElement("img");
					newImg.src = dataUrl;
					
					alert(dataUrl);
					
					//设置当前预览头像
					$('#headImg').attr('src',dataUrl);
					$('#imgBase64').val(dataUrl);
				}
			});
		});

		//上传按钮单击
		$('#uploadBtn').click(function() {

			var imgBase64 = $('#imgBase64');

			// 判读是否重新选择过头像
			if (imgBase64.val() == null || imgBase64.val() == '') {
				layer.msg('请先更换头像！');
				return;
			}

			layer.load(1);

			$.post(baseUrl + '/emp/updatePic',{imgBase64:imgBase64.val()},function(data) {
				
				layer.closeAll();
				layer.msg('上传头像成功！');
			})
			.error(function() {
				layer.msg('网络请求失败');
			});

		});

	</script> -->
</body>
</html>