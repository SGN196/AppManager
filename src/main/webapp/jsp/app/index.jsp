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

            <form class="layui-form" action="${ctx}/app/query" method="get">
                <div class="layui-inline">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" value="${appInfoDTO.softwareName}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="hidden" name="pageNum" value="1">
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="layui-inline">
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-block">
                        <select lay-filter="aihao" name="appStatus">

                            <option value="" selected="">-请选择-</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${obj.valueId eq appInfoDTO.appStatus}" >selected</c:if> >${obj.valueName}</option>

                            </c:forEach>


                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-block">
                        <select lay-filter="aihao" id="appFlatform" name="appFlatform">
                           <option value="" >-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${obj.valueId eq appInfoDTO.appFlatform}" >selected</c:if> >${obj.valueName}</option>

                            </c:forEach>

                        </select>
                    </div>
                </div><br>
                <!------------------------------------------------->
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-block">
                        <select name="levelOne" id="levelOne" lay-filter="levelOnex"  >
                            <option value="" >-请选择-</option>
                            <c:forEach items="${levelOnex}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.levelOne}" >selected</c:if> >${obj.categoryName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-block">
                        <select name="levelTwo" lay-filter="levelTwo" id="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-block">
                        <select name="levelThree" lay-filter="levelThree" id="levelThree">
                            <option value="">-请选择-</option>

                        </select>
                    </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>

                    </div>

                </div>
            </form>
            <div class="layui-input-block">
                <a class="layui-btn" lay-submit="" lay-filter="demo1" href="${ctx}/app/toAdd">新增APP基础信息</a>

            </div>

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
                            <td>${obj.flatform.valueName}</td>
                            <%--<td>--%>
                                <%--<c:if test="${obj.flatformId }">手机</c:if>--%>
                                <%--<c:if test="${obj.flatformId eq 2}">平板</c:if>--%>
                                <%--<c:if test="${obj.flatformId eq 3}">手机、平板</c:if>--%>
                            <%--</td>--%>
                            <td>${obj.categoryLevel1.categoryName} -> ${obj.categoryLevel2.categoryName} -> ${obj.categoryLevel3.categoryName} </td>
                            <%--<td>--%>
                                <%--<c:if test="${obj.status eq 1}">待审核 </c:if>--%>
                                <%--<c:if test="${obj.status eq 2}">审核通过</c:if>--%>
                                <%--<c:if test="${obj.status eq 3}">审核不通过</c:if>--%>
                                <%--<c:if test="${obj.status eq 4}">已上架</c:if>--%>
                                <%--<c:if test="${obj.status eq 5}">已下架</c:if>--%>
                            <%--</td>--%>
                            <td>${obj.appStatus.valueName}</td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td>
                                <a href="${ctx}/app/toEdit/${obj.id}" class="layui-btn layui-btn-normal layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe642</i></a>
                                <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe640</i></a>
                                <a href="${ctx}/app/queryById/${obj.id}" class="layui-btn                  layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe615</i></a>
                            </td>

                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            共${page.total} 条记录 第 ${page.pageNum}/ ${page.pages}页
                        </td>
                        <td colspan="8">
                            <a href="javascript:void(0);" page="first">首页</a>
                            <a href="javascript:void(0);" page="prev">上一页</a>
                            <a href="javascript:void(0);" page="next">下一页</a>
                            <a href="javascript:void(0);" page="last">尾页</a>

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

        form.on('select(levelOnex)', function(){
            var levelOneId = $('#levelOne').val();
            if(levelOneId == ''){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelTwoByLevelOne/' + levelOneId,
                    type:'get',
                    success:function(data){
                        var html = '<option value="" >-请选择-</option>';
                        var len = data.length;
                        var level22 = '${appInfoDTO.levelTwo}';


                        for(var i = 0; i < len; i++){
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                            // html += '<option value="' + data[i].id + '"';
                            // if(level22 == data[i].id){
                            //     html += ' selected ';
                            // }
                            // html += '>' + data[i].categoryName + '</option>';


                        }
                        $('#levelTwo').html(html);
                        form.render();
                    }
                });
            }
        });
        form.on('select(levelTwo)', function(){
            var levelTwoId = $('#levelTwo').val();
            if(levelTwoId == ''){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelThreeByLevelTwo/' + levelTwoId,
                    type:'get',
                    success:function(data){
                        var html = '<option value=""> 请选择</option>';
                        var len = data.length;
                        for(var i = 0; i < len; i++){
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                        }
                        $('#levelThree').html(html);
                        form.render();
                    }
                });
            }
        });


        //分页事件====================================================
        $('a[page]').click(function () {

            var pageNum = 1;
            var currPage = '${page.pageNum}';
            var totalPages ='${page.pages}';
            var v = $(this).attr('page');
            switch (v) {
                case "first": pageNum = 1; break;
                case "prev":
                    pageNum = parseInt(currPage) - 1;
                    if(pageNum < 1)
                        pageNum = 1;
                    break;
                case 'next':
                    pageNum = parseInt(currPage) + 1;
                    if(pageNum > totalPages){
                        pageNum = totalPages;
                    }
                    break;
                case "last":
                    pageNum = totalPages;
                    break;
            }
            $('input[name=pageNum]').val(pageNum)
            $('form').submit();
        })



        // form.on('select(levelOne)',function(){
        //     var html = '<option>手机</option>';
        //     // alert(1231312321);
        //     alert($('#levelTwo').html());
        //       $('#levelTwo').html(html)





        //     form.render();
        // })
        /**
         * 用于表单的回显
         */
        $(function(){
            var levelOne = $('#levelOne').val();

            if(levelOne != '' && levelOne != null){
                var levelTwo = '${appInfoDTO.levelTwo}';
                if(levelTwo != null && levelTwo != undefined && levelTwo != ''){
                    $.ajax({
                        url:'${ctx}/category/queryLevelTwoByLevelOne/' + levelOne,
                        type:'get',
                        success:function(data){
                            var html = '<option value="" >-请选择-</option>';
                            var len = data.length;

                            for(var i = 0; i < len; i++){
                                // html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                                html += '<option value="' + data[i].id + '"';
                                if(levelTwo == data[i].id){
                                    html += ' selected ';
                                }
                                html += '>' + data[i].categoryName + '</option>';
                            }
                            $('#levelTwo').html(html);
                            form.render();
                        }
                    });
                    var levelThree = '${appInfoDTO.levelThree}';
                    if(levelThree != null && levelThree != '' && levelThree != undefined){
                         $.ajax({
                             url:'${ctx}/category/queryLevelThreeByLevelTwo/' + levelTwo,
                             type:'get',
                             success:function (data) {
                                 var html = '<option value="">-请选择-</option>';
                                 var len = data.length;

                                 for (var i = 0; i < len; i++) {
                                     html += '<option value="' + data[i].id + '"';
                                     if(levelThree == data[i].id){
                                         html += ' selected ';
                                     }
                                     html += '>' + data[i].categoryName + '</option>';

                                 }
                                 $('#levelThree').html(html);
                                 form.render();

                             }
                         })
                    }
                }
            }
        });


    });
</script>

</body>
</html>
