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

        [HttpPost]
        public async Task<IActionResult> AddDepartamento(Departamento departamento)
        {
            var json = JsonSerializer.Serialize(departamento);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            await _httpClient.PostAsync("/departamento", content);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> AddEmpleado(Empleado empleado)
        {
            var json = JsonSerializer.Serialize(empleado);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            await _httpClient.PostAsync("/empleado", content);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Consulta(int id)
        {
            string endpoint = $"/consulta{id}";
            var response = await _httpClient.GetAsync(endpoint);

            if (!response.IsSuccessStatusCode)
            {
                ViewBag.Error = "Error ejecutando la consulta.";
                return View("Index");
            }

            var json = await response.Content.ReadAsStringAsync();

            var results = JsonSerializer.Deserialize<List<Dictionary<string, object>>>(json);

            ViewBag.ConsultaId = id;
            ViewBag.Results = results;
            return View("Index");
        }
    }
}
