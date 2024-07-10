package pe.edu.vallegrande.crudweb.service;

import pe.edu.vallegrande.crudweb.dto.ContactoDTO;

import java.util.ArrayList;
import java.util.List;

public class DB {
    private DB() {

    }

    static List<ContactoDTO> contactos;
    static int contador;

    static {
        contactos = new ArrayList<>();
        contactos.add(new ContactoDTO(1, "Michaell Ibarra", "michaell.ibarra@gmail.com", "97933393", 1));
        contactos.add(new ContactoDTO(2, "Adolfo Berrocal", "adolfo.berrocal@vallegrande.edu.pe", "972740755", 1));
        contactos.add(new ContactoDTO(3, "Isael Fatama", "isael.fatama@vallegrande.edu.pe", "922843355", 1));
        contactos.add(new ContactoDTO(4, "luis valle", "luis.valle@vallegrande.edu.pe", "985928062", 1));
        contactos.add(new ContactoDTO(5, "Gustavo Coronel", "gustavo@gmail.com", "984576876", 1));
        contactos.add(new ContactoDTO(6, "Deyton Garcia", "deyton.garcia@vallegrande.edu.pe", "945328101", 1));
        contactos.add(new ContactoDTO(7, "Jean Palomino", "jean.palomino@vallegrande.edu.pe", "959096705", 1));
contador = 7;
    }
}
