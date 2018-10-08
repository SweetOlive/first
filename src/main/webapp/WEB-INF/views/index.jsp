<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>hello world!</p>
<table>
    <c:forEach items="${userDomainList}" var="item">
        <tr>
            <td>${item.userId}</td>
            <td>${item.userName}</td>
            <td>${item.password}</td>
            <td>${item.phone}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
