<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/12/9
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp"></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <div style="padding: 15px;">


                <input type="hidden" value="${app.id}" name="id"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" value="${app.softwareName}" placeholder="请输入软件名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="apkName" value="${app.apkName}" placeholder="请输入APK名称"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportRom" value="${app.supportRom}" placeholder="请输入ROM名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" value="${app.interfaceLanguage}" placeholder="请输入界面语言" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" value="${app.softwareSize}" placeholder="请输入软件大小"  autocomplete="off" class="layui-input">
                    </div>
                </div>

                <h2>历史版本信息</h2>
                <table class="layui-table">
                    <thead>
                        <tr>
                            <th>版本编号</th>
                            <th>APK文件名称</th>
                            <th>APK位置</th>
                            <th>下载链接</th>
                            <th>版本大小</th>
                            <th>版本信息</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${app.appVersions}" var="obj">
                            <tr>
                                <td>${obj.versionNo}</td>
                                <td>${obj.apkFileName}</td>
                                <td>${obj.apkLocPath}</td>
                                <td>${obj.downloadLink}</td>
                                <td>${obj.versionSize}</td>
                                <td>${obj.appInfo}</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>










        </div>
    </div>


    <!-- 底部固定区域 -->
    <jsp:include page="/jsp/common/footer.jsp"/>

</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    // layui.use('element', function(){
    //     var element = layui.element;
    //
    // });
    // //Demo
    // layui.use('form', function(){
    //     var form = layui.form;
    //
    //     //监听提交
    //     form.on('submit(formDemo)', function(data){
    //         layer.msg(JSON.stringify(data.field));
    //         return false;
    //     });
    // });
    layui.use(['element', 'form', 'jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;



    });
</script>
</body>
</html>

