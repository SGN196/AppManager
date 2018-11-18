<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/8
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        form{
            width:400px;
            margin:auto;
            margin-top:30%;
        }
    </style>
</head>
<body>
    ${errMsg}

    <div class="layui-container">
        <form class="layui-form" action="${ctx}/dev/login" lay-ignore method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">输入框</label>
                <div class="layui-input-inline">
                    <input type="text" name="devCode" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码框</label>
                <div class="layui-input-inline">
                    <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
</body>
</html>