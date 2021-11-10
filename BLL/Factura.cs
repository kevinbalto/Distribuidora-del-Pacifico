using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Factura
    {
        public int codigoFactura { set; get; }
        public string cedulaCliente { set; get; }
        public double totalPagar { set; get; }
        public string formaPago { set; get; }
        public double informacionPago { set; get; }
        public double descuento { set; get; }
    }
}
