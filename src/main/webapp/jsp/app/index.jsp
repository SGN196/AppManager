<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/10
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        /*table tr th:first-of-type{*/
            /*width:9%;*/
        /*}*/
        /*table tr th:nth-of-type(2){*/
            /*width:9%;*/
        /*}*/
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <!-- 条件搜索 -->

            <form class="layui-form" action="">
                <div class="layui-inline">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="number" autocomplete="off" class="layui-input">
                    </div>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="layui-inline">
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="aihao">

                            <option value="0" selected="">-请选择-</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.id}">${obj.valueName}</option>

                            </c:forEach>


                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="aihao">
                           <option type="0" >-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.id}">${obj.valueName}</option>

                            </c:forEach>

                        </select>
                    </div>
                </div><br>
                <!------------------------------------------------->
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-block">
                        <select name="interest" id="levelOne" lay-filter="levelOne">
                            <option>-请选择-</option>
                            <c:forEach items="${levelOne}" var="obj">
                                <option value="${obj.id}">${obj.categoryName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="levelTwo" id="levelTwo">
                            <option value="0">-请选择-</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="levelThree" id="levelThree">
                            <option value="0">-请选择-</option>

                        </select>
                    </div>
                </div>
            </form>


            <!--  个人APP列表-->
            <table class="layui-table">
                <thead>
                    <tr>
                        <th >软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小</th>
                        <th>所属平台</th>
                        <th>所属分类（一级、二级、三级）</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.apkName}</td>
                            <td>${obj.softwareSize} M</td>
                            <td>
                                <c:if test="${obj.flatformId eq 1}">手机</c:if>
                                <c:if test="${obj.flatformId eq 2}">平板</c:if>
                                <c:if test="${obj.flatformId eq 3}">手机、平板</c:if>
                            </td>
                            <td>${obj.categoryLevel1.categoryName} -> ${obj.categoryLevel2.categoryName} -> ${obj.categoryLevel3.categoryName} </td>
                            <td>
                                <c:if test="${obj.status eq 1}">待审核 </c:if>
                                <c:if test="${obj.status eq 2}">审核通过</c:if>
                                <c:if test="${obj.status eq 3}">审核不通过</c:if>
                                <c:if test="${obj.status eq 4}">已上架</c:if>
                                <c:if test="${obj.status eq 5}">已下架</c:if>
                            </td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td><button>点击操作</button></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            共${page.total} 条记录 第 ${page.pageNum}/ ${page.pages}页
                        </td>
                        <td colspan="8">
                            <a href="">首页</a>
                            <a href="">上一页</a>
                            <a href="">下一页</a>
                            <a href="">尾页</a>

                        </td>
                    </tr>
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

        form.on('select(levelOne)', function(){
            var levelOneId = $('#levelOne').val();
            if(levelOneId == 0){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelTwoByLevelOne/' + levelOneId,
                    type:'get',
                    success:function(data){
                        var html = '<option value="0">-请选择-</option>';
                        var len = data.length;
                        for(var i = 0; i < len; i++){
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                        }
                        $('#levelTwo').html(html);
                        form.render();
                    }
                })
            }
        })
        form.on('select(levelTwo)', function(){
            var levelTwoId = $('#levelTwo').val();
            if(levelTwoId == 0){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelThreeByLevelTwo/' + levelTwoId,
                    type:'get',
                    success:function(data){
                        var html = '<option value="0"> 请选择</option>';
                        var len = data.length;
                        for(var i = 0; i < len; i++){
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                        }
                        $('#levelThree').html(html);
                        form.render();
                    }
                })
            }
        })

        // form.on('select(levelOne)',function(){
        //     var html = '<option>手机</option>';
        //     // alert(1231312321);
        //     alert($('#levelTwo').html());
        //       $('#levelTwo').html(html)
        //     form.render();
        // })

    })
</script>

</body>
</html>
