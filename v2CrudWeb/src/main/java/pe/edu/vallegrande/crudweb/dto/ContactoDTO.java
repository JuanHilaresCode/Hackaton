package pe.edu.vallegrande.crudweb.dto;

import lombok.*;
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class ContactoDTO {
    private int id;
    private String nombre;
    private String correo;
    private String telefono;
    private int estado;

}
