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
    <link href="">

</head>
<body>

<table class="table table-striped">
    <thead>
    <tr>
        <th>班级</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <form action="addStu" method="post">
                <td><input type="text" id="claname" name="claname"></td>
               <td><input type="submit" name="submit">添加</td>
            </form>
        </tr>
    </tbody>

</table>

</body>
</html>