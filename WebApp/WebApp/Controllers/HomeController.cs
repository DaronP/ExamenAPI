using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using WebApp.Models;

namespace WebApp.Controllers
{
    /*
     * Nombre: HomeController
     * Parametros: None
     * Return: Void
     * Inheritance: Extiende de la clase Controller
     * Descripcion: Esta es la clase controladora (controller), intermediaria entre la aplicacion web y la Node REST API, por lo que tambien es considerada como un Web Service.
    */
    public class HomeController : Controller
    {
        private readonly HttpClient _httpClient;

        /*
         * Nombre: HomeController
         * Descripcion: Constructor de la clase HomeController, definiendo este endpoint como cliente hacia la direccion URI del servidor (http://localhost:3000)
        */
        public HomeController(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("http://localhost:3000");
        }

        
        public async Task<IActionResult> Index()
        {
            return View();
        }


        /*
         * Nombre: Consulta()
         * Parametros: Id
         * Devuelve: View("Index")
         * Descripcion: Maneja las consultas dinamicamente a traves del parametro Id recibido desde la vista. Esto lo hace de manera que cuando el usuario presione un boton, 
         * este boton mande su ID al controller y esta funcion pueda concatenarla para obtener el endpoint para la API. Si la respuesta a la consulta es un error, muestra dicho error. 
         * De lo contrario, deserializa la respuesta de formato JSON a diccionario y lo devuelve a la vista.
        */
        public async Task<IActionResult> Consulta(int id)
        {
            string endpoint = $"/consulta{id}";
            var response = await _httpClient.GetAsync(endpoint);

            if (!response.IsSuccessStatusCode)
            {
                ViewBag.Error = "Error executing query...";
                Console.WriteLine(response);
                return View("Index");
            }

            var json = await response.Content.ReadAsStringAsync();

            var results = JsonSerializer.Deserialize<List<Dictionary<string, object>>>(json);

            ViewBag.ConsultaId = id;
            ViewBag.Results = results;
            return View("Index");
        }


        /*
         *Nombre: AgregarDepartamento()
         *Parametros: departamento
         *Devuelve: RedirectToAction("Index")
         *Descripcion: Recibe los datos del departamento que se quiere agregar a la base de datos desde el metodo POST de la vista, los convierte en formato JSON para poder pasarlo 
         *a la API en el endpoint indicado.
        */
        [HttpPost]
        public async Task<IActionResult> AgregarDepartamento(Departamento departamento)
        {
            if (departamento == null || departamento.CodigoDepartamento == 0)
            {
                ViewBag.Error = departamento;
            }
            var json = JsonSerializer.Serialize(departamento);
            Console.WriteLine(json);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync("/departamento", content);

            if (!response.IsSuccessStatusCode)
            {
                ViewBag.Error = "Data insertion to table departamento failed...";
                return RedirectToAction("Index");
            }

            ViewBag.Message = "Data added successfully!";
            return RedirectToAction("Index");
        }


        /*
         *Nombre: AgregarEmpleado()
         *Parametros: empleado
         *Devuelve: RedirectToAction("Index")
         *Descripcion: Recibe los datos del empleado que se quiere agregar a la base de datos desde el metodo POST de la vista, los convierte en formato JSON para poder pasarlo 
         *a la API en el endpoint indicado.
        */
        [HttpPost]
        public async Task<IActionResult> AgregarEmpleado(Empleado empleado)
        {
            var json = JsonSerializer.Serialize(empleado);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync("/empleado", content);

            if (!response.IsSuccessStatusCode)
            {
                ViewBag.Error = "Error al agregar el empleado.";
                return RedirectToAction("Index");
            }

            ViewBag.Message = "Empleado agregado exitosamente.";
            return RedirectToAction("Index");
        }

    }
}
