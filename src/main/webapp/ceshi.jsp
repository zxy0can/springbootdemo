<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/30
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script>
    $("#btn").click(function () {
        tr+="<td></td>";
        tr+="<td><select class='goodsname'><option>--选择商品--</option></select></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><input></td>";
        tr+="<td></td>";
        tr+="<td><button class='btn'>删除</button></td>";
        tr+="</tr>";
        $("#mttbd").append(tr)
    })
function getGoods() {
        $.ajax({
            url:"",
            type:"",
    dataType:"",
    success: function (data) {
                for(var i in data){
                    var option=""
                }
    }
        })
    $("#mytbd").on("change",".goodsname",function () {


    })

}

</script>
</html>
