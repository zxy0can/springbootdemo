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
<table class="table table-striped">
    <thead>
    <tr>
        <th>采购编号</th>
        <th>采购时间</th>
        <th>采购人</th>
        <th>采购部门</th>
        <th>总价</th>
        <th>创建时间</th>
         <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mybody">
    </tbody>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">供应商信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>采购编号</th>
                        <th>商品编号</th>
                        <th>采购数量</th>
                        <th>小计</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <tbody id="mybody2">
                    </tbody>
                </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateconfirm">审核通过</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    //页面加载完成时
    $(function () {
        query();
    })
    function query(){
        $.ajax({
            url: "getPurchase",
            type:"post",
            dataType:"json",
            success:function (data) {
                //每次加载之前清空表格中的内容
                $("#mybody").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].purordernumber+"</td>";
                    tr+="<td>"+data[i].purchasetime+"</td>";
                    tr+="<td>"+data[i].purchaser+"</td>";
                    tr+="<td>"+data[i].applydepartment+"</td>";
                    tr+="<td>"+data[i].prices+"</td>";
                    tr+="<td>"+data[i].createtime+"</td>";
                    tr+="<td>"+data[i].state+"</td>";
                     tr+="<td><button onclick='deleteEmployee("+data[i].employeeid+")'type='\button\' class='btn btn-primary btn-lg'>删除</button>";
                    tr+=" <button  class='btn btn-primary btn-lg update' data-toggle='modal' data-target='#myModal'>审核</button></td>";
                    tr+="</tr>";
                    $("#mybody").append(tr);
                }
            }
        });
    }
    //点击修改时需要将被点击行的数据填充到form中
    $("#mybody").on("click",".update",function () {
        var val=$(this).parent().parent().find("td").eq(0).html();
        $.ajax({
            url: "getPurchaseDetail",
            type: "post",
            data:{"purordernumber":val},
            dataType:"json",
            success:function (data){
                $("#mybody2").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].purordernumber+"</td>";
                    tr+="<td>"+data[i].goodsnumber+"</td>";
                    tr+="<td>"+data[i].purnumber+"</td>";
                    tr+="<td>"+data[i].subtotal+"</td>";
                    tr+="<td>"+data[i].createtime+"</td>";
                    // tr+="<td><button onclick='deleteEmployee("+data[i].employeeid+")'type='\button\' class='btn btn-primary btn-lg'>删除</button>";
                    tr+=" <button  class='btn btn-primary btn-lg update' data-toggle='modal' data-target='#myModal'>审核</button></td>";
                    tr+="</tr>";
                    $("#mybody2").append(tr);
                }
            }
        });
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
