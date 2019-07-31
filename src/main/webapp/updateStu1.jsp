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
        <th>学生编号</th>
        <th>学生姓名</th>
        <th>班级名称</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="stu">
        <tr>
            <form action="updateStu" method="post">
                <td><input type="text" id="stuid" name="stuid" value="${stu.stuid}"></td>
                <td><input type="text" id="sname" name="sname" value="${stu.sname}"></td>
                <td><input type="text" id="claid" name="claid" value="${stu.claid}"></td>
                <td><input type="submit" name="submit">更新</td>
            </form>

        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>