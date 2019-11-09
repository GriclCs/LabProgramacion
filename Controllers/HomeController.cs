using LabProgramacion.Models;
using Microsoft.AspNetCore.Mvc;

namespace LabProgramacion.Controllers

{
    public class HomeController : Controller
    {
        
        public IActionResult Index(){
            return View();
        }

       /*  public IActionResult Formulario(){
            return View();

        } */

        [HttpPost]
      public IActionResult VeterinariaH (Cliente e){
            if (ModelState.IsValid){
//TO-DO : Guardar en base de datos
return RedirectToAction ("Confirmación");
            }else{
                return View(e);
                       }
        }

          public IActionResult Confirmacion(){
            return View();

        }
    }
}