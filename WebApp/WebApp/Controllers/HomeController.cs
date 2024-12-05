using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly HttpClient _httpClient;

        public HomeController(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("http://localhost:3000");
        }

        public async Task<IActionResult> Index()
        {
            return View();
        }

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
                ViewBag.Error = "Error al agregar el departamento.";
                return RedirectToAction("Index");
            }

            ViewBag.Message = "Departamento agregado exitosamente.";
            return RedirectToAction("Index");
        }

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
