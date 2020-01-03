<%@ page import="domaine.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="domaine.ProductOrdered" %><%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 08:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/style/checkout.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<% List<ProductOrdered> products = (List) request.getAttribute("checkoutList"); %>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <%Double somme = 0.0; for (ProductOrdered productOrdered : products ) { somme += productOrdered.total(); %>
        <tr>
            <th scope="row"><%=productOrdered.getProduct().getName()%></th>
            <th scope="row">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <%=productOrdered.getQuantity()%>
                        </div>
                        <div class="col-sm">
                            <form action="${pageContext.request.contextPath}/checkout" method="post">
                                <input id="addProdId" name="addProdId" type="hidden" value="<%=productOrdered.getProduct().getId()%>">
                                <input type="submit" value="" class="add">
                            </form>
                        </div>
                        <div class="col-sm">
                            <form action="${pageContext.request.contextPath}/checkout" method="post">
                                <input id="removeProdId" name="removeProdId" type="hidden" value="<%=productOrdered.getProduct().getId()%>">
                                <input type="submit" value="" class="remove">
                            </form>
                        </div>
                    </div>
                </div>
            </th>
            <th scope="row">
                <form action="${pageContext.request.contextPath}/checkout" method="post">
                    <input id="delProdId" name="delProdId" type="hidden" value="<%=productOrdered.getProduct().getId()%>">
                    <input type="submit" value="" class="del">
                </form>
            </th>
            <th scope="row">CHF <%=productOrdered.total()%></th>
        </tr>
        <% } %>
        </tbody>
    </table>
    <h5>Total : CHF <%= somme%></h5>
    <a href="${pageContext.request.contextPath}/products">Retourner à la liste</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/paiement" role="button">Payer</a>
</div>
</body>
</html>
