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
        <legend>添加用户</legend>
        编号:<input id="userno" name="userno"/>
        姓名:<input id="username" name="username"/>
        电话:<input id="telphone" name="telphone"/>
        地址:<input id="address" name="address"/>
        <button id="btn">添加</button>
    </fieldset>
</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>  id</th>
        <th>编号</th>
        <th>姓名</th>
        <th>电话</th>
        <th>地址</th>
    </tr>
    </thead>
    <tbody id="mybody">
    </tbody>
</table>
</body>
<script>
    //页面加载完成时
    $(function () {
        query();
        //queryCla();
    })
    function query(){
        $.ajax({
            url: "selectUser",
            type:"post",
            dataType:"json",
            success:function (data) {
                //每次加载之前清空表格中的内容
                $("#mybody").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].userid+"</td>";
                    tr+="<td>"+data[i].userno+"</td>";
                    tr+="<td>"+data[i].username+"</td>";
                    tr+="<td>"+data[i].telphone+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                     tr+="</tr>";
                    $("#mybody").append(tr);
                }
            }
        });
    }
    //添加学生
    btn.onclick=function () {
        $.ajax({
            url:"addUser",
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
