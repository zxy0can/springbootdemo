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
        <legend>添加客户</legend>
        &nbsp;&nbsp;&nbsp;&nbsp;id:<input id="customerid" name="customerid"/>
        编号:<input id="number" name="number"/>
        联系人:<input id="contacts" name="contacts"/>
        手机号:<input id="telphone" name="telphone"/><br/><br/>
        地址:<input id="address" name="address"/>
        Email:<input id="email" name="email"/>
        开户银行:<input id="bank" name="bank"/>
        银行卡号:<input id="bankaccount" name="bankaccount"/>
        <button id="btn">添加</button><br/><br/>

    </fieldset>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>id</th>
        <th>编号</th>
        <th>联系人</th>
        <th>手机号</th>
        <th>地址</th>
        <th>Email</th>
        <th>开户银行</th>
        <th>银行卡号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    修改客户信息
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form id="myform2">
                    id<input class="customerid" name="customerid" placeholder="id" readonly/><br/><br/>
                    编号<input class="number" name="number" placeholder="编号" readonly/><br/><br/>
                    联系人<input class="contacts" name="contacts" placeholder="联系人"/><br/><br/>
                    手机号<input class="telphone" name="telphone" placeholder="手机号"/><br/><br/>
                    地址<input class="address" name="address" placeholder="地址"/><br/><br/>
                    Email<input class="email" name="email" placeholder="Email"/><br/><br/>
                    开户银行<input class="bank" name="bank" placeholder="开户银行"/><br/><br/>
                    银行卡号<input class="bankaccount" name="bankaccount" placeholder="银行卡号"/><br/><br/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateconfirm">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script>
    //页面加载完成时
    $(function(){

        query();
    })

    function query(){
        $.ajax({
            url:"selectCustomer",
            type:"post",
            dataType:"json",
            success:function(data){
                //每次加载之前清空表格中的内容
                $("#mytbd").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].customerid+"</td>";
                    tr+="<td>"+data[i].number+"</td>";
                    tr+="<td>"+data[i].contacts+"</td>";
                    tr+="<td>"+data[i].telphone+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                    tr+="<td>"+data[i].email+"</td>";
                    tr+="<td>"+data[i].bank+"</td>";
                    tr+="<td>"+data[i].bankaccount+"</td>";
                    tr+="<td><button onclick='delStu("+data[i].customerid+")' type=\"button\" class='btn btn-primary btn-lg ' >删除</button>" +
                        "<button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                        "</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }

        });

    }

    //点击删除按钮时，删除操作
    function delStu(val){
        $.ajax({
            url:"delCustomerSucess",
            type:"post",
            data:{"customerid":val},
            dataType:"json",
            success:function(data){
                //重新执行一次查询，刷新页面
                query();

            }

        })

    }

    //添加客户
    btn.onclick=function(){
        $.ajax({
            url:"addCustomerSucess",
            type:"post",
            data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
            dataType:"json",
            success:function(data){
                query();

            }

        })

    }
    //点击修改时需要将被点击行的数据填充到form中
    $("#mytbd").on("click",".update",function(){
        //节点
        $(".customerid").val($(this).parent().parent().find("td").eq(0).html());
        $(".number").val($(this).parent().parent().find("td").eq(1).html());
        $(".contacts").val($(this).parent().parent().find("td").eq(2).html());
        $(".telphone").val($(this).parent().parent().find("td").eq(3).html());
        $(".address").val($(this).parent().parent().find("td").eq(4).html());
        $(".email").val($(this).parent().parent().find("td").eq(5).html());
        $(".bank").val($(this).parent().parent().find("td").eq(6).html());
        $(".bankaccount").val($(this).parent().parent().find("td").eq(7).html());
    })
    // 点击确认修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改?")){
            $.ajax({
                url:"updateCustomer",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"json",
                success:function(data){
                    query();
                    $('#myModal').modal('hide');
                }
            })
        }
    }
</script>

