<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>tabs</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>




</head>
<body class="easyui-layout">
<!-- 使用div元素描述每个区域 -->
<div title="XXX管理系统" style="height: 100px" data-options="region:'north'">北部区域</div>
<div title="系统菜单" style="width: 200px" data-options="region:'west'">
    <!-- 制作accordion折叠面板
        fit:true----自适应(填充父容器)
    -->
    <div class="easyui-accordion" data-options="fit:true">
        <!-- 使用子div表示每个面板 -->
        <div data-options="iconCls:'icon-cut'" title="面板一">
            <a id="but1" class="easyui-linkbutton">添加一个选项卡</a>

            <script type="text/javascript">
                $(function () {
                    $("#but1").click(function () {

                        var e = $("#mytabs").tabs("exists","系统管理");
                        if(e){
                            //已经存在,选中就可以
                            $("#mytabs").tabs("select","系统管理");
                        }else {
                            $("#mytabs").tabs("add", {
                                title: '系统管理',
                                iconCls: 'icon-edit',
                                closable: true,
                                content: '<iframe   frameborder="0"  height="100%"  width="100%" src="https://www.baidu.com" ></iframe>'
                            });
                        }
                    })
                })


            </script>


        </div>




        <div title="面板二">
            <ul id="ztree1" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting={
                    };
                    //构造节点数据
                    var zNodes=[
                        {"name":"节点1","children":[{"name":"节点一"},{"name":"节点二"}]},
                        {"name":"节点2"},
                        {"name":"节点3"}
                        ];
                    $.fn.zTree.init($("#ztree1"),setting,zNodes);
                });
                
                
            </script>

        </div>
        <div title="面板三">
            <ul id="ztree2" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting2={
                        data:{
                            simpleData:{
                                enable:true
                            }
                        }

                    };
                    //构造节点数据
                    var zNodes2=[
                        {"id":"1","pId":"0","name":"节点1"},
                        {"id":"2","pId":"1","name":"节点2"},
                        {"id":"3","pId":"2","name":"节点3"}
                    ];
                    $.fn.zTree.init($("#ztree2"),setting2,zNodes2);
                });


            </script>


        </div>

        <div title="面板四">

            <ul id="ztree3" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting3={
                        data:{
                            simpleData:{
                                enable:true
                            }
                        }

                    };
                    //构造节点数据

                    var url="${pageContext.request.contextPath}/json/menu.json";
                    $.post(url,{},function (data) {
                        $.fn.zTree.init($("#ztree3"),setting3,data);
                    },'json');


                });


            </script>




        </div>


    </div>
</div>
<div data-options="region:'center'">
    <!-- 制作一个tabs选项卡面板 -->
    <div id="mytabs" class="easyui-tabs" data-options="fit:true">
        <!-- 使用子div表示每个面板 -->
        <div data-options="iconCls:'icon-cut'" title="面板一">1111</div>
        <div data-options="closable:true" title="面板二">2222</div>
        <div title="面板三">3333</div>
    </div>
</div>
<div style="width: 100px" data-options="region:'east'">东部区域</div>
<div style="height: 50px" data-options="region:'south'">南部区域</div>
</body>
</html>