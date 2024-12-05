namespace WebApp.Models
{
    /*
     *Nombre: Empleado
     *Descripción: Es el modelo por el cual se puede controlar el comportamiento y tipos de los datos a recibir e ingresar a la tabla empleado de la base de datos.
    */
    public class Empleado
    {
        public string Dpi { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public int CodDepto { get; set; }
    }
}
