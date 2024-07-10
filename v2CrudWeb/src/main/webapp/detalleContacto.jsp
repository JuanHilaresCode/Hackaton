<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Detalles de la Ruta</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Detalles de la Ruta</h1>
    <c:choose>
        <c:when test="${not empty contacto}">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>CORREO</th>
                    <th>TELEFONO</th>
                    <th>ESTADO</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${contacto.id}</td>
                    <td>${contacto.nombre}</td>
                    <td>${contacto.correo}</td>
                    <td>${contacto.telefono}</td>
                    <td>${contacto.estado}</td>
                </tr>
                </tbody>
            </table>
            <a href="index.jsp" class="btn btn-primary">Regresar al Inicio</a>
            <a href="ContGetAll" class="btn btn-success">Ir a Lista de Contacto</a>
        </c:when>
        <c:otherwise>
            <p class="alert alert-warning">El contacto no fue encontrado.</p>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
