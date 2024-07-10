package pe.edu.vallegrande.crudweb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import pe.edu.vallegrande.crudweb.dto.ContactoDTO;
import pe.edu.vallegrande.crudweb.service.ContactoService;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet({"/ContGetAll", "/ContGetId", "/ContCrear", "/ContActualizar", "/ContBorrar", "/ContEditar"})
public class ContactoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/ContGetAll":
                getAll(req, resp);
                break;
            case "/ContGetId":
                getById(req, resp);
                break;
            case "/ContEditar":
                contEdit(req, resp);
                break;
        }
    }

    private void getAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ContactoDTO> lista;
        ContactoService service = new ContactoService();
        lista = service.getAll();
        req.setAttribute("lista", lista);
        RequestDispatcher rd = req.getRequestDispatcher("contacto.jsp");
        rd.forward(req, resp);
    }

    private void getById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        ContactoService service = new ContactoService();
        ContactoDTO contacto = service.getById(id);

        if (contacto != null) {
            req.setAttribute("contacto", contacto);
            RequestDispatcher rd = req.getRequestDispatcher("detalleContacto.jsp");
            rd.forward(req, resp);
        } else {
            String mensaje = "El contacto con ID " + id + " no fue encontrado";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/ContCrear":
                contCreate(req, resp);
                break;
            case "/ContActualizar":
                contUpdate(req, resp);
                break;
            case "/ContBorrar":
                contDelete(req, resp);
                break;
        }
    }

    private void contCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String nombre = req.getParameter("nombre");
        String correo = req.getParameter("correo");
        String telefono = req.getParameter("telefono");

        if (nombre != null && !nombre.isEmpty() && correo != null && !correo.isEmpty() && telefono != null && !telefono.isEmpty()) {
            ContactoDTO nuevoContacto = new ContactoDTO();
            nuevoContacto.setNombre(nombre);
            nuevoContacto.setCorreo(correo);
            nuevoContacto.setTelefono(telefono);

            ContactoService service = new ContactoService();
            int nuevoContactoId = service.create(nuevoContacto);

            if (nuevoContactoId != 0) {
                String redirectURL = req.getContextPath() + "/ContGetId?id=" + nuevoContactoId;
                resp.sendRedirect(redirectURL);
            } else {
                String mensaje = "Error al crear el nuevo contacto";
                req.setAttribute("mensaje", mensaje);
                resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
            }
        } else {
            String mensaje = "Todos los campos son obligatorios";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
        }
    }


    private void contEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ContactoService service = new ContactoService();
        ContactoDTO contacto = service.getById(id);

        if (contacto != null) {
            req.setAttribute("contacto", contacto);
            RequestDispatcher rd = req.getRequestDispatcher("editarContacto.jsp");
            rd.forward(req, resp);
        } else {
            String mensaje = "El contacto con ID " + id + " no fue encontrado";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
        }
    }

    private void contUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        String correo = req.getParameter("correo");
        String telefono = req.getParameter("telefono");
        String estado = req.getParameter("estado");
        ContactoService service = new ContactoService();
        ContactoDTO contacto = service.getById(id);

        if (contacto != null) {
            contacto.setNombre(nombre);
            contacto.setCorreo(correo);
            contacto.setTelefono(telefono);
            contacto.setEstado(Integer.parseInt(estado));
            service.update(contacto);

            resp.sendRedirect(req.getContextPath() + "/ContGetAll");
        } else {
            String mensaje = "El contacto con ID " + id + " no fue encontrado";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
        }
    }

    private void contDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ContactoService service = new ContactoService();
        boolean eliminado = service.delete(id);

        if (eliminado) {
            String mensaje = "Contacto eliminado correctamente";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/ContGetAll");
        } else {
            String mensaje = "El contacto con ID " + id + " no fue encontrado";
            req.setAttribute("mensaje", mensaje);
            resp.sendRedirect(req.getContextPath() + "/index.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
        }
    }
}
