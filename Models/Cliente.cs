
using System.ComponentModel.DataAnnotations;

namespace LabProgramacion.Models
{
    public class Cliente
    {
        [Required]
        public string Nombre {get;set;}
        [Required]

         public string Email {get;set;}
        [Required]
          public string Asunto {get;set;}
           [Required]
          public string Mensaje {get;set;}
    }
}