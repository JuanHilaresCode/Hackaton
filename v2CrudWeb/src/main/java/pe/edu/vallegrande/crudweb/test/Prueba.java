package pe.edu.vallegrande.crudweb.test;

import pe.edu.vallegrande.crudweb.dto.ContactoDTO;
import pe.edu.vallegrande.crudweb.service.ContactoService;

import java.util.List;

public class Prueba {
    public static void main(String[] args) {
        ContactoService service = new ContactoService();
        List<ContactoDTO> lista = service.getAll();
        System.out.println(lista);
    }
}
