<%@ page import="domaine.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 08:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des produits</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/style/confirm.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<%@include  file="menu.jsp" %>
<div class="row">
            <% List<Product> alp = (List<Product>)request.getAttribute("products");
                for(Product p : alp){
                    System.out.println(p.getId());%>
            <jsp:include page="product.jsp">
                <jsp:param name="productName" value="<%=p.getName()%>"/>
                <jsp:param name="productPicture" value="<%=p.getUrlPictureOne()%>"/>
                <jsp:param name="productFare" value="<%=p.getFare()%>"/>
                <jsp:param name="productDescription" value="<%=p.getDescription()%>"/>
                <jsp:param name="productId" value="<%=p.getId()%>"/>
            </jsp:include>
            <%}%>
</div>
<div class="container text-white">
    <div id="add" class="overlay">
        <div class="popup">
            <h2>Confirmation</h2>
            <a class="close" href="#">&times;</a>
            <div class="content">
                Merci pour votre commande !
            </div>
        </div>
    </div>
</div>
</body>
</html>
