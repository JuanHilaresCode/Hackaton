<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Contact List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container p-4">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Lista de Contactos</h1>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead class="table-success">
                    <tr class="text-center">
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>CORREO</th>
                        <th>TELEFONO</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lista}" var="usuario">
                        <tr>
                            <td>${usuario.id}</td>
                            <td>${usuario.nombre}</td>
                            <td>${usuario.correo}</td>
                            <td>${usuario.telefono}</td>
                            <td>${usuario.estado}</td>
                            <td class="text-center">
                                <a href="ContEditar?id=${usuario.id}" class="btn btn-primary">Actualizar</a>
                                <form action="ContBorrar" method="post" style="display: inline;" onsubmit="mostrarAlerta()">
                                    <input type="hidden" name="id" value="${usuario.id}">
                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                </form>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-primary">Regresar al Inicio</a>
        <a href="crearContacto.jsp" class="btn btn-success">Crear Nuevo Contacto</a>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function mostrarAlerta() {
        alert("¡Dato eliminado!");
    }
</script>

</body>
</html>
