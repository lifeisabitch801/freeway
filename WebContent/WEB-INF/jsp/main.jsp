<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<frameset cols="260,*" frameborder="no" framespacing="0">
	<frame src="${pageContext.request.contextPath}/nav.jsp">
<!-- 	<frame src="Analysis.html" name="content"> -->
	<frame src="${pageContext.request.contextPath}/bg.jsp" name="content">
</frameset>
<body>
<h1>欢迎来到高速管理系统</h1>
</body>
<!--<body>
主菜单<br>
<a href="${pageContext.request.contextPath}/users/toupdateuseruface.action"><br>
管理员头像<br><img src="${users.uface}" width="100px"></a><br>
<a href="${pageContext.request.contextPath}/users/toupdateupwd.action">修改密码</a><br>
<a href="${pageContext.request.contextPath}/users/toupdateuserinfo.action">修改个人信息</a><br>
<a href="${pageContext.request.contextPath}/station/selectallstation.action">站点管理列表</a><br>
<a href="${pageContext.request.contextPath}/driver/selectalldriver.action">驾驶员管理列表</a><br>
<a href="${pageContext.request.contextPath}/carinfo/selectallcar.action">车辆管理列表</a><br>
<a href="${pageContext.request.contextPath}/users/tologout.action">退出登录</a><br>
</body>  -->
</html>