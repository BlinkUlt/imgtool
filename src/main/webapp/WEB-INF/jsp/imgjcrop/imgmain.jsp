<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>图片裁剪示例</title>
    <link rel="stylesheet" href="../../css/common.css" type="text/css" />
    <link rel="stylesheet" href="../../css/jquery.Jcrop.css" type="text/css" />
    <script type="text/javascript" src="../../js/jquery-1.3.2-min.js"></script>
    <script type="text/javascript" src="../../js/jquery.Jcrop.js"></script>
    <style type="text/css">
        .crop_preview{position:absolute; left:430px; top:0; width:200px; height:200px; overflow:hidden;}
        .rel{width: 700px;height:420px; overflow: hidden;margin:40px;overflow: hidden;}
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
//记得放在jQuery(window).load(...)内调用，否则Jcrop无法正确初始化
            $("#aa").Jcrop({
                aspectRatio:1,
                onChange:showCoords,
                onSelect:showCoords,
            });
//简单的事件处理程序，响应自onChange,onSelect事件，按照上面的Jcrop调用
            function showCoords(obj){
                $("#x").val(obj.x);
                $("#y").val(obj.y);
                $("#w").val(obj.w);
                $("#h").val(obj.h);
                if(parseInt(obj.w) > 0){
//计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
                    var rx = $("#preview_box").width() / obj.w;
                    var ry = $("#preview_box").height() / obj.h;
//通过比例值控制图片的样式与显示
                    $("#crop_preview").css({
//预览图片宽度为计算比例值与原图片宽度的乘积
                        width:Math.round(rx * $("#aa").width()) + "px",
//预览图片高度为计算比例值与原图片高度的乘积
                        height:Math.round(rx * $("#aa").height()) + "px",
                        marginLeft:"-" + Math.round(rx * obj.x) + "px",
                        marginTop:"-" + Math.round(ry * obj.y) + "px"
                    });
                }
            }
            $("#crop_submit").click(function(){
                if(parseInt($("#x").val())){
                    $("#crop_form").submit();
                }else{
                    alert("要先在图片上划一个选区再单击确认剪裁的按钮哦！");
                }
            });
        });
    </script>
</head>

<body>
<h1>Jcrop照片剪裁插件高宽比例固定/剪裁效果预览演示</h1>
<div>
    <div class="rel">
        <img id="aa" src="image/xuwanting.jpg" width="60%" />
        <span id="preview_box" class="crop_preview"><img id="crop_preview" src="image/xuwanting.jpg" width="100%"/></span>
    </div>
    <div>
        <form action="<%=basePath%>servlet/JcropImg" method="post" id="crop_form">
            <input  id="x" name="x" />
            <input  id="y" name="y" />
            <input  id="w" name="w" />
            <input  id="h" name="h" />
            <P><input type="button" value="确认剪裁" id="crop_submit"  width="100px" height="100px"/></P>
        </form>
    </div>
</div>
</body>
</html>