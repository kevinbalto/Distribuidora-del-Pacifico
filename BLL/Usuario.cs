using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Usuario
    {
        public string cedula { set; get; }
        public string tipoIdentificacion { set; get; }
        public string nombreCompleto { set; get; }
        public string direccion { set; get; }
        public string email { set; get; }
        public string contrasenna { set; get; }
        public string telefono { set; get; }
        public string tipoUsuario { set; get; }
    }
}
