<%@ page import="domaine.ProductOrdered" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.function.ToIntFunction" %><%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Caddie</title>
</head>
<body>
    <table>
        <tr>
            <td>
                <img src="${pageContext.servletContext.contextPath}/images/shopping.png"/>
            </td>
            <td>
                <%=request.getSession().getAttribute("checkoutList") == null ? 0:((List<ProductOrdered>) request.getSession().getAttribute("checkoutList")).stream()
                        .mapToInt(new ToIntFunction<ProductOrdered>() {
                            @Override
                            public int applyAsInt(ProductOrdered value) {
                                return value.getQuantity();
                            }
                        }).sum()%>
            </td>
        </tr>
    </table>
</body>
</html>
