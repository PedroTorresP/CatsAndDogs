<%@ page import="domaine.Product" %>
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
    <title>Home</title>
    <link rel="stylesheet" href="../style/home.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<%@include  file="menu.jsp" %>

<div id="container mx-auto">
    <div class="row">
        <div class="col">
            <h1><a href="${pageContext.request.contextPath}/products">Welcome to e-shop</a></h1>
            <br>
            <p><a href="${pageContext.request.contextPath}/products">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et augue vitae dui vestibulum eleifend ut vel metus.
                Donec urna mauris, scelerisque id vulputate eu, iaculis pretium nibh. Praesent id bibendum purus.
                Duis arcu lectus, gravida non mattis sed, efficitur at orci. Pellentesque vel fringilla lectus.
                Sed id leo malesuada lacus aliquam laoreet at eget risus. Sed mollis odio in nunc molestie tempor ut eu turpis.
                Nunc odio nisl, iaculis id arcu eget, efficitur ullamcorper lorem. Curabitur et sollicitudin libero.
                Sed dictum scelerisque ex non sodales. Ut ultricies eros eget ipsum vehicula, at dictum leo ultrices. Donec dapibus porttitor nisi nec ornare.
                Maecenas consectetur venenatis lacus a laoreet.

                Maecenas et lacinia orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
                Quisque faucibus, risus at dapibus hendrerit, turpis libero imperdiet risus, quis sollicitudin tellus neque at turpis.
                Ut erat sem, cursus eget dignissim et, venenatis ac diam. Aenean et aliquam dolor, sed mattis orci.
                Proin vehicula tempor lorem sed pulvinar. Quisque a tincidunt quam. Nulla nec sapien maximus, tempor augue et, congue urna.
                Quisque pharetra dolor in ligula semper, eget porta est porta. Vestibulum nec diam nunc. Ut tortor libero, tristique eget interdum sed, posuere a neque.
                Pellentesque ut scelerisque leo. Nullam tristique diam eget vulputate tincidunt.</a></p>
        </div>
        <div class="col">
            <img src="${pageContext.request.contextPath}/images/illustration/e-Shop_grau_2432x954px.jpg" alt="">
        </div>
    </div>
    <br>
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
</div>
</body>
</html>
