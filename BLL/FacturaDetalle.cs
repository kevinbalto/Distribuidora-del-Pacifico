using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class FacturaDetalle
    {
        public int codigoDetalle { set; get; }
        public string codigoFactura { set; get; }
        public string codigoProducto { set; get; }
        public int cantidad { set; get; }
        public double precio { set; get; }
        public decimal subTotal { set; get; }
    }
}
