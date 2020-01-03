<%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Produit</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/style/product.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<%@include  file="menu.jsp" %>
<div class="row">
    <div class="col-sm-8">

        <h3><%=request.getAttribute("productName")%></h3>
        <br>
        <%=request.getAttribute("productDescription")%>
        <div class="row-fluid">
            <table>
                <tr>
                    <td>CHF <%=request.getAttribute("productFare")%></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/checkout" method="post">
                            <input id="prodId" name="prodId" type="hidden" value="<%=request.getAttribute("productId")%>">
                            <input id="whereIFrom" name="whereIFrom" type="hidden" value="products/<%=request.getAttribute("productId")%>">
                            <input type="submit" value="">
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-4">
        <img src="${pageContext.request.contextPath}<%=request.getAttribute("productPicture1")%>" class="imgProduct" alt="...">
        <img src="${pageContext.request.contextPath}<%=request.getAttribute("productPicture2")%>" class="imgProduct" alt="...">
    </div>
</div>

</body>
</html>
