<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		//最外层框架跳转到登录页
		window.top.location.href = "${pageContext.request.contextPath}/users/tologin.action";
	</script>
</body>
</html>