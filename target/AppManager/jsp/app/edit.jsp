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

            <form method="get" action="${ctx}/app/edit" class="layui-form">
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
                <hr>
                <%------------------在逻辑上，新添加的APP都是未审核的，所以不需要APP状态这个选项-------------------------%>
                <%--<div class="layui-inline">--%>
                <%--<label class="layui-form-label">APP状态</label>--%>
                <%--<div class="layui-input-block">--%>
                <%--<select lay-filter="status" name="status">--%>

                <%--<option value="" selected="">-请选择-</option>--%>
                <%--<c:forEach items="${appStatus}" var="obj">--%>
                <%--<option value="${obj.valueId}"  >${obj.valueName}</option>--%>

                <%--</c:forEach>--%>


                <%--</select>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="layui-inline">
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-block">
                        <select lay-filter="appFlatform" id="appFlatform" name="flatformId">
                            <option value="" >-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${app.flatform.valueId eq obj.valueId  }">selected</c:if> >${obj.valueName}</option>

                            </c:forEach>

                        </select>
                    </div>
                </div><br>
                <div class="layui-inline">
                    <label class="layui-form-label">审核状态</label>
                    <div class="layui-input-block">
                        <select lay-filter="appStatus" id="appStatus" name="status">
                            <option value="" >-请选择-</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.valueId}" <c:if test="${app.appStatus.valueId eq obj.valueId  }">selected</c:if> >${obj.valueName}</option>

                            </c:forEach>

                        </select>
                    </div>
                </div><br>
                <!------------------------------------------------->
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-block">
                        <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOnex"  >
                            <option value="" >-请选择-</option>
                            <c:forEach items="${levelOnex}" var="obj">
                                <option value="${obj.id}" <c:if test="${app.categoryLevel1.id eq obj.id  }">selected</c:if> >${obj.categoryName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div><br>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-block">
                        <select name="categoryLevel2.id" lay-filter="levelTwo" id="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-block">
                        <select name="categoryLevel3.id" lay-filter="levelThree" id="levelThree">
                            <option value="">-请选择-</option>

                        </select>
                    </div>
                </div>




                <%-------------------------------------------------%>
                <div class="layui-form-item">
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" width="200px" name="appInfo"  value="${app.appInfo}" placeholder="请输入应用简介" autocomplete="off" class="layui-input">
                        <%--<textarea name="appInfo" value="${app.appInfo}" placeholder="请输入应用简介" autocomplete="off" class="layui-input" cols="30" rows="10"></textarea>--%>
                    </div>

                </div><br>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1" >立即提交</button>

                    </div>

                </div>
            </form>










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

        $(function(){
            var levelOne = $('#levelOne').val();
            if(levelOne != '' && levelOne != null){
                var levelTwo = '${app.categoryLevel2.id}';
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
                    var levelThree = '${app.categoryLevel3.id}';
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

