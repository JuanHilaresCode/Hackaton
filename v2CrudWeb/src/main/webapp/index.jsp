<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Crud Web</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1>Crud Web</h1>
  <br/>
  <a href="ContGetAll" class="btn btn-primary">Ir a Lista de Contacto</a>

  <form action="ContGetId" method="get" class="mt-3">
    <div class="form-row align-items-center">
      <div class="col-auto">
        <label for="idInput" class="mb-0">ID del contacto:</label>
      </div>
      <div class="col-auto">
        <input type="text" id="idInput" name="id" class="form-control form-control-sm">
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-primary">Ir a Detalles del Contacto</button>
      </div>
    </div>
  </form>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<% String mensaje = request.getParameter("mensaje");
  if (mensaje != null && !mensaje.isEmpty()) { %>
<script>
  alert("<%= mensaje %>");
</script>
<% } %>

</body>
</html>
