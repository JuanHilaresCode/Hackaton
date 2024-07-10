<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Actualizar Ruta</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Actualizar Contacto</h1>
        </div>
        <div class="card-body">
            <form action="ContActualizar" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombreInput">Nombre:</label>
                        <input type="text" id="nombreInput" name="nombre" class="form-control border border-4" value="${contacto.nombre}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="correoInput">Correo:</label>
                        <input type="email" id="correoInput" name="correo" class="form-control border border-4" value="${contacto.correo}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="telefonoInput">Teléfono:</label>
                        <input type="text" id="telefonoInput" name="telefono" class="form-control border border-4" value="${contacto.telefono}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="estadoInput">Estado:</label>
                        <input type="text" id="estadoInput" name="estado" class="form-control border border-4" value="${contacto.estado}">
                    </div>
                </div>
                <input type="hidden" name="id" value="${contacto.id}">
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
