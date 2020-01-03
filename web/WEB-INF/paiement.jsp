<%--
  Created by IntelliJ IDEA.
  User: ThomasMatton
  Date: 2019-06-04
  Time: 08:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Règlement</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/paiement" method="post">
    <div class="form-group">
        <label for="sum">Total à payer</label>
        <input class="form-control" id="sum" name="sum" type="text" value="<%=request.getAttribute("sum")%>" readonly>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="lastName">Nom :</label>
            <input type="text" id="lastName" name="lastName" required placeholder="nom">
        </div>
        <div class="form-group col-md-6">
            <label for="email">Email :</label>
            <input type="email" id="email" name="email" required placeholder="nom@email.com">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="crediCardNumber">N° de carte de paiement :</label>
            <input type="number" id="crediCardNumber" name="crediCardNumber" pattern="[0-9]" required placeholder="0000111122223333">
        </div>
        <div class="form-group col-md-4">
            <label for="validityEndMonth">Mois de fin de validité :</label>
            <input type="text" id="validityEndMonth" name="validityEndMonth" pattern="\d{2}" required placeholder="01">
        </div>
        <div class="form-group col-md-2">
            <label for="validityEndYear">Année de fin de validité :</label>
            <input type="text" id="validityEndYear" name="validityEndYear" pattern="[0-9]{2}" required placeholder="97">
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/products">Retourner à la liste</a>
    <button type="submit" class="btn btn-primary">Commander</button>
</form>
</body>
</html>
