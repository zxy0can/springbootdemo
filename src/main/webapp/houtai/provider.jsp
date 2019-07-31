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
        <legend>添加供应商信息</legend>
        供应商编号<input id="providernumber" name="providernumber">
        供应商名称 <input id="providername" name="providername">
        联系人 <input id="contacts" name="contacts">
        联系电话 <input id="telphone" name="telphone"><br><br>
        地址 <input id="address" name="address">
        邮箱 <input id="email" name="email">
        开户银行 <input id="bank" name="bank">
        开户账号 <input id="bankaccount" name="bankaccount">
        <button type="button" class="layui-btn layui-btn-normal" id="btn">增加</button>
    </fieldset>
</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>供应商id</th>
        <th>供应商编号</th>
        <th>供应商名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>地址</th>
        <th>邮箱</th>
        <th>开户银行</th>
        <th>开户账号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mybody">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">供应商信息</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="myform2">
                        供应商id<input type="text" class="providerid" name="providerid" readonly><br><br>
                        供应商编号<input type="text" class="providernumber" name="providernumber"><br><br>
                        供应商名称 <input type="text" class="providername" name="providername"><br><br>
                        联系人 <input type="text" class="contacts" name="contacts"><br><br>
                        联系电话 <input type="text" class="telphone" name="telphone"><br><br>
                        地址 <input type="text" class="address" name="address"><br><br>
                        邮箱 <input type="text" class="email" name="email"><br><br>
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
    </tbody>
</table>
</body>
<script>
    //页面加载完成时
    $(function () {
        query();
    })
    function query(){
        $.ajax({
            url: "getProvider",
            type:"post",
            dataType:"json",
            success:function (data) {
                //每次加载之前清空表格中的内容
                $("#mybody").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].providerid+"</td>";
                    tr+="<td>"+data[i].providernumber+"</td>";
                    tr+="<td>"+data[i].providername+"</td>";
                    tr+="<td>"+data[i].contacts+"</td>";
                    tr+="<td>"+data[i].telphone+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                    tr+="<td>"+data[i].email+"</td>";
                    tr+="<td>"+data[i].bank+"</td>";
                    tr+="<td>"+data[i].bankaccount+"</td>";
                    tr+="<td><button onclick='deleteProvider("+data[i].providerid+")'type='button' class='btn btn-primary btn-lg'>删除</button>";
                    tr+=" <button  class='btn btn-primary btn-lg update' data-toggle='modal' data-target='#myModal'>更新</button></td>";
                    tr+="</tr>";
                    $("#mybody").append(tr);
                }
            }
        });
    }
    //点击修改时需要将被点击行的数据填充到form中
    $("#mybody").on("click",".update",function () {
        $(".providerid").val($(this).parent().parent().find("td").eq(0).html());
        $(".providernumber").val($(this).parent().parent().find("td").eq(1).html());
        $(".providername").val($(this).parent().parent().find("td").eq(2).html());
        $(".contacts").val($(this).parent().parent().find("td").eq(3).html());
        $(".telphone").val($(this).parent().parent().find("td").eq(4).html());
        $(".address").val($(this).parent().parent().find("td").eq(5).html());
        $(".email").val($(this).parent().parent().find("td").eq(6).html());
        $(".bank").val($(this).parent().parent().find("td").eq(7).html());
        $(".bankaccount").val($(this).parent().parent().find("td").eq(8).html());
    })
    /*$("#mytbd").on("click","button",function(){
        alert($(this).val())
      $.ajax({
          url:"delstu",
          type:"post",
          data:{"id":$(this).val()},
          dataType:"json",
          success:function(data){
              //重新执行一次查询，刷新页面
              query();
          }
      })
    })*/
    //点击删除按钮时，删除操作
    function deleteProvider(val) {
        $.ajax({
            url: "deleteProvider",
            type: "post",
            data:{"providerid":val},
            dataType:"json",
            success:function (data){
                query();
            }
        });
    }
    //页面加载时查询班级信息，以下拉框的形式显示班级
    // function queryCla() {
    //     $.ajax({
    //         url:"selectCla",
    //         type: "post",
    //         dataType: "json",
    //         success:function (data) {
    //             for(var i=0;i<data.length;i++) {
    //                 var option="<option value="+data[i].claid+">"+data[i].claname+"</option>";
    //                 //  var option="<option value="+data[i].claid+">"+data[i].claname+"</option>";
    //                 $("#claid").append(option);
    //                 $("#claid1").append(option);//更新的下拉框
    //
    //             }
    //         }
    //     });
    // }
    //更新供应商信息
    updateconfirm.onclick=function () {
        if(confirm("确认修改吗")){
            $.ajax({
                url:"updateProvider",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"json",
                success:function (data) {
                    query();
                    $('#myModal').modal('hide');
                }
            })
        }
    }

    //添加供应商
    btn.onclick=function () {
        $.ajax({
            url:"addProvider",
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
