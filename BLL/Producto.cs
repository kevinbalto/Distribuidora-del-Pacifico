using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Producto
    {
        public string codigoBarra { set; get; }
        public string clasificacion { set; get; }
        public string descripcion { set; get; }
        public Double precioCompra { set; get; }
        public Double porcentajeIV { set; get; }
        public Double porcentajeIVA { set; get; }
        public Double precioImpuestoIncluido { set; get; }
        public int cantidad { set; get; }
        public Boolean exento { set; get; }
        public string unidadMedida { set; get; }
        public Boolean estado { set; get; }
        public string foto { set; get; }
        public string cedulaLegal { set; get; }
    }
}
