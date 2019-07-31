<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/18
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="http://localhost:8080/springbootdemo/"></base>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"></link>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form id="myform">
    <fieldset>
        <legend>添加员工信息</legend>
        角色id <select id="roleid" name="roleid"></select>
        员工编号 <input id="employeenumber" name="employeenumber">
        密码 <input id="password" name="password">
        姓名 <input id="name" name="name">
        性别 <input id="sex" name="sex"><br><br>
        电话 <input id="telphone" name="telphone">
        邮箱 <input id="email" name="email">
        住址 <input id="address" name="address">
        籍贯 <input id="origo" name="origo">
        民族<input id="nation" name="nation">
        学历 <input id="education" name="education"><br><br>
        毕业院校 <input id="graduation" name="graduation">
        开户银行 <input id="bank" name="bank">
        开户账号 <input id="bankaccount" name="bankaccount">
        <button type="button" class="layui-btn layui-btn-normal" id="btn">增加</button>
    </fieldset>
</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>员工id</th>
        <th>角色</th>
        <th>员工编号</th>
        <th>密码</th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>住址</th>
        <th>籍贯</th>
        <th>民族</th>
        <th>学历</th>
        <th>毕业院校</th>
        <th>开户银行</th>
        <th>开户账号</th>

        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mybody">

    </tbody>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">供应商信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    员工id<input type="text" class="employeeid" name="employeeid" readonly><br><br>
                    角色<select class="roleid" name="roleid"></select>
                    <br><br>
                    员工编号<input type="text" class="employeenumber" name="employeenumber"><br><br>
                    密码<input type="text" class="password" name="password"><br><br>
                    姓名<input type="text" class="name" name="name"><br><br>
                    性别<input type="text" class="sex" name="sex"><br><br>
                    电话 <input type="text" class="telphone" name="telphone"><br><br>
                    地址 <input type="text" class="address" name="address"><br><br>
                    邮箱 <input type="text" class="email" name="email"><br><br>
                    籍贯<input type="text" class="origo" name="origo"><br><br>
                    民族<input type="text" class="nation" name="nation"><br><br>
                    学历<input type="text" class="education" name="education"><br><br>
                    毕业院校<input type="text" class="graduation" name="graduation"><br><br>
                    开户银行 <input type="text" class="bank" name="bank"><br><br>
                    开户账号 <input type="text" class="bankaccount" name="bankaccount"><br><br>
                    <%--班级名称<select class="claid" name="claid" id="claid1"></select><br><br>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateconfirm">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    //页面加载完成时
    $(function () {
        query();
        getRoleName();
    })

    //页面加载时角色，以下拉框的形式显示角色
    function getRoleName(){
        $.ajax({
            url:"getRoleName",
            type:"post",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    //option:value（提交到服务器），text(用户直观看到的)
                    var option="<option value="+data[i].roleid+">"+data[i].rolename+"</option>";
                    $("#roleid").append(option);
                    $("#myform2 select").append(option);
                }
            }
        });
    }


    function query(){
        $.ajax({
            url: "user/getEmployee",
            type:"post",
            dataType:"json",
            success:function (data) {
                //每次加载之前清空表格中的内容
                $("#mybody").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].employeeid+"</td>";
                    tr+="<td>"+data[i].rolename+"</td>";
                    tr+="<td>"+data[i].employeenumber+"</td>";
                    tr+="<td>"+data[i].password+"</td>";
                    tr+="<td>"+data[i].name+"</td>";
                    tr+="<td>"+data[i].sex+"</td>";
                    tr+="<td>"+data[i].telphone+"</td>";
                    tr+="<td>"+data[i].email+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                    tr+="<td>"+data[i].origo+"</td>";
                    tr+="<td>"+data[i].nation+"</td>";
                    tr+="<td>"+data[i].education+"</td>";
                    tr+="<td>"+data[i].graduation+"</td>";
                    tr+="<td>"+data[i].bank+"</td>";
                    tr+="<td>"+data[i].bankaccount+"</td>";
                    tr+="<td><button onclick='deleteEmployee("+data[i].employeeid+")'type='\button\' class='btn btn-primary btn-lg'>删除</button>";
                    tr+=" <button  class='btn btn-primary btn-lg update' data-toggle='modal' data-target='#myModal'>更新</button></td>";
                    tr+="</tr>";
                    $("#mybody").append(tr);
                }
            }
        });
    }
    //点击修改时需要将被点击行的数据填充到form中
    $("#mybody").on("click",".update",function () {
        $(".employeeid").val($(this).parent().parent().find("td").eq(0).html());
       // $(".roleid").val($(this).parent().parent().find("td").eq(1).html());
        $(".employeenumber").val($(this).parent().parent().find("td").eq(2).html());
        $(".password").val($(this).parent().parent().find("td").eq(3).html());
        $(".name").val($(this).parent().parent().find("td").eq(4).html());
        $(".sex").val($(this).parent().parent().find("td").eq(5).html());
        $(".telphone").val($(this).parent().parent().find("td").eq(6).html());
        $(".address").val($(this).parent().parent().find("td").eq(7).html());
        $(".email").val($(this).parent().parent().find("td").eq(8).html());
        $(".origo").val($(this).parent().parent().find("td").eq(9).html());
        $(".nation").val($(this).parent().parent().find("td").eq(10).html());
        $(".education").val($(this).parent().parent().find("td").eq(11).html());
        $(".graduation").val($(this).parent().parent().find("td").eq(12).html());
        $(".bank").val($(this).parent().parent().find("td").eq(13).html());
        $(".bankaccount").val($(this).parent().parent().find("td").eq(14).html());
    })
    //点击删除按钮时，删除操作
    function deleteEmployee(val) {
        $.ajax({
            url: "user/deleteEmployee",
            type: "post",
            data:{"employeeid":val},
            dataType:"json",
            success:function (data){
                query();
            }
        });
    }
    //更新学生信息
    updateconfirm.onclick=function () {
        if(confirm("确认修改吗")){
            $.ajax({
                url:"user/updateEmployee",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交ty
                dataType:"json",
                success:function (data) {
                    query();
                    $('#myModal').modal('hide');
                }
            })

        }
    }

    //添加员工信息
    btn.onclick=function () {
        $.ajax({
            url:"user/addEmployee",
            type:"post",
            data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
            dataType:"json",
            success:function (data) {
                query();
            }
        })
    }
</script>
</html>
