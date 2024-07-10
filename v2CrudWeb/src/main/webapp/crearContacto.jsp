<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Contacto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
<div class="container centered-form">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title">Crear Nuevo Contacto</h1>
            <form action="ContCrear" method="post">
                <div class="form-group">
                    <label for="nombreInput">Nombre:</label>
                    <input type="text" id="nombreInput" name="nombre" class="form-control">
                </div>
                <div class="form-group">
                    <label for="correoInput">Correo:</label>
                    <input type="email" id="correoInput" name="correo" class="form-control">
                </div>
                <div class="form-group">
                    <label for="telefonoInput">Teléfono:</label>
                    <input type="text" id="telefonoInput" name="telefono" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Crear</button>
            </form>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
