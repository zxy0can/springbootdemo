<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/29
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>采购申请</title>
    <base href="http://localhost:8080/springbootdemo/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<form role="form" class="form-inline">
    <div class="form-group">
        <label for="orderid">流水号&nbsp;</label>
        <input type="text" class="form-control" id="orderid" readonly>&nbsp;&nbsp;
    </div>
    <div class="form-group">
        <label for="caigouperson">申请人&nbsp;</label>
        <input type="text" class="form-control" id="caigouperson" value="${userName.name}">&nbsp;&nbsp;
    </div>
    <div class="form-group">
        <label for="caigoudept">申请部门&nbsp;</label>
        <input type="text" class="form-control" id="caigoudept" >&nbsp;&nbsp;
    </div>
</form>
<button id="btn">添加商品</button>
<button id="submit">提交</button>
<table  class="table">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类别</th>
        <th>商品规格</th>
        <th>计量单位</th>
        <th>采购单价</th>
        <th>数量</th>
        <th>库存总数</th>
        <th>小计(￥元)</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">
    </tbody>
</table>
</body>
</html>
<script>
    var num=0;//区分到底是第几行
    //点击添加商品时
    $("#btn").click(function(){
        var tr="<tr>"
        tr+="<td></td>";
        tr+="<td><select class='goodsname'><option>--选择商品--</option></select></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><input></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><button  class='btn btn-primary btn-lg btn'>删除</button></td>";
        tr+="</tr>";
        //新增的tr追加到
        $("#mytbd").append(tr)
        getGoods();
    });
    //动态读取商品信息
    var goodsinfo;
    function getGoods(){
        $.ajax({
            url:"goods/selectGoods",
            //contextType:"application/json",
            type:"post",
            dataType:"json",
            success:function(data) {
                goodsinfo=data;
                //清空下拉框中的子元素
                for (var i in data) {
                    var option = "<option value='" + data[i].goodsnumber + "'>" + data[i].goodsname + "</option>";
                    $("#mytbd .goodsname").eq(num).append(option);//当前行只会影响，不会影响其他行
                }
                num++;//每添一行num自增1
            }
        })
    }
    //因为下拉框时动态生成的，所有不能直接使用change,B必须使用时间绑定
    //下拉框改变时，将对应的商品信息查询出来记载到对应的td中
    $("#mytbd").on("change",".goodsname",function(){
        //循环进行匹配
        for(var i in goodsinfo){
            if($(this).val()==goodsinfo[i].goodsnumber){
                //$(this).parent().prev().text();
                // $(this).parent().next().text(goodsinfo[i].typeName);
                $(this).parent().parent().children("td").eq(0).text(goodsinfo[i].goodsnumber);
                $(this).parent().parent().children("td").eq(2).text(goodsinfo[i].typename);
                $(this).parent().parent().children("td").eq(3).text(goodsinfo[i].goodsprice);
                $(this).parent().parent().children("td").eq(4).text(goodsinfo[i].measureunit);
                $(this).parent().parent().children("td").eq(5).text(goodsinfo[i].purchaseprice);
                $(this).parent().parent().children("td").eq(7).text(goodsinfo[i].repertory);
            }
        }
    })
    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            $(this).parent().parent().remove();
            num--;
        }
    })
    //键盘抬起时，小计发生变化
    $("#mytbd").on("keyup","input",function () {
        var purchaseprice=$(this).parent().prev().text();
        var num=$(this).val();
        $(this).parent().next().next().text(purchaseprice*num);
    })
    //点击提交按钮时
$("#submit").click(function () {
    var purordernumber=$("#orderid").val();//订单号
    var purchasetime=$("#caigoudate").val();//申请日期
    var purchaser=$("#caigouperson").val();//采购人
    var applydepartment=$("#caigoudept").val();//申请部门
    var goodsarr=new Array();//采购商品的集合
    var sum=0;//订单总价
    $("#mytbd tr").each(function () {
        var goods=new Object();
        goods.goodsnumber=$(this).children("td").eq(0).text();
        goods.purordernumber=purordernumber;
        goods.purnumber=$(this).find("input").val();
        goods.subtotal=$(this).children("td").eq(8).text();
        goodsarr.push(goods);//将当前对象存放到数组中
        sum+=Number($(this).children("td").eq(8).text());
    })
    var jsonstr={"purordernumber":purordernumber,"purchasetime":purchasetime,"purchaser":purchaser,"applydepartment":applydepartment,"prices":sum,"goods":goodsarr}
    $.ajax({
        url:"applyOrder",
        type:"post",
        contentType:"application/json",
        data:JSON.stringify(jsonstr),
        success:function(data){
            if(data=="true"){
                alert("提交成功，等待审核");
                $("#submit").prop("disabled",true);
            }
            else{
                alert("提交失败");
            }
        }
    })
})
    $(function(){
        $.ajax({
            url:"getNo",
            type:"post",
            dataType:"text",
            success:function(data){
                $("#orderid").val(data);
            }
        })
    })
</script>
