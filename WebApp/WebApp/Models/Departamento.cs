namespace WebApp.Models
{/*
     *Nombre: Departamento
     *Descripción: Es el modelo por el cual se puede controlar el comportamiento de los datos a recibir e ingresar a la tabla departamento de la base de datos.
    */
    public class Departamento
    {
        public int CodigoDepartamento { get; set; }
        public string NombreDepto { get; set; }
        public decimal Presupuesto { get; set; }
    }
}
