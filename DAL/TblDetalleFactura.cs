//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class TblDetalleFactura
    {
        public int codigoDetalle { get; set; }
        public int codigoFactura { get; set; }
        public string codigoProducto { get; set; }
        public Nullable<int> cantidad { get; set; }
        public decimal precio { get; set; }
        public decimal subTotal { get; set; }
    
        public virtual TblProducto TblProducto { get; set; }
        public virtual TblProducto TblProducto1 { get; set; }
        public virtual TblProducto TblProducto2 { get; set; }
        public virtual TblFactura TblFactura { get; set; }
    }
}
