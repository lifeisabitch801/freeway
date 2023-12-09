<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>LOGIN</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>
    <!--登陆主体开始-->
    <div id="main">
        <!-- 头像区开始-->
        <div id="header-border">
            <!-- 头像区内部开始-->
            <div id="header-pic">

            </div>
            <!-- 头像区内部结束-->
        </div>
        <!-- 头像区结束-->
        <!-- 账号密码区开始-->
        <div id="account">
            <form action="${pageContext.request.contextPath}/users/login.action" method="post">
                <div class="input">
                    <input type="text" id="empLoginName" name="uid" value="${param.uid}" placeholder="请输入用户账号" />
                    <!--  <span style="color:red">${msg1}</span>-->
                </div>
                <div class="input">
                    <input type="password" id="empPwd" name="upwd" value="${param.upwd}"  placeholder="请输入密码"/>
                   <!--  <span style="color:red">${msg2}</span>-->
                </div>
                <span style="color:red">${msg1}</span>
                <span style="color:red">${msg2}</span>
            </form>
        </div>
        <!-- 账号密码区结束-->
        <!-- 登陆按钮开始-->
        <button id="login-btn">登录</button>
        <!-- 登陆按钮结束-->
        <!-- 登陆区底部开始-->
        <div id="footer">
            <a href="#">忘记密码?</a>
        </div>
        <!-- 登陆区底部结束-->
    </div>
    <!--登陆主体结束-->
    
    <!--引入jquery-->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 引入全局公共js文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/global.js"></script>
    <!-- 引入layer弹出层js功能 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            // 判断是否有头像数据
            //if (localStorage.getItem('empPic')) {
              //  $('#header-pic').css('background','url(' + localStorage.getItem('empPic') + ')');
          //  }
            
            //用户登录
            $('#login-btn').click(function(event) {
                $("form").submit();
                 //location.href="${pageContext.request.contextPath}/users/login.action";

            });

        });
    </script>
</body>
</html>