<%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-light bg-light sticky-top">
    <a class="navbar-brand" href='${pageContext.request.contextPath}/'>
        <img src="${pageContext.servletContext.contextPath}/images/home.png"/>
    </a>
    <a class="nav-link" href="${pageContext.request.contextPath}/checkout"> <%@include  file="caddie.jsp" %></a>
</nav>
</body>
</html>
