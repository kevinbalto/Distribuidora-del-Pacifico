using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

using System.Net.Mail;
using System.Net.Mime;
using System.Net;

namespace BLL
{
    public class Reporte
    {

        public void CrearPDF(Factura fac, FacturaDetalle facturaDetalle, String path, string image, string emailCliente, string nombreCliente, decimal precioDolares)
        {

            Document document = new Document();
            PdfWriter.GetInstance(document, new FileStream(path, FileMode.Create));

            document.Open();
            //Imagen de logo
            Image img = Image.GetInstance(image);
            img.ScalePercent(10f);
            img.SetAbsolutePosition(document.Left, document.Top);
            document.Add(img);


            iTextSharp.text.Font _standardFont = new iTextSharp.text.Font
              (iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

            Paragraph paragraph = new Paragraph();
            Font titleFont = new Font(iTextSharp.text.Font.FontFamily.HELVETICA
                                      , 15
                                      , iTextSharp.text.Font.BOLD
                                      , BaseColor.BLACK
                );

          
            
            // Escribimos el encabezamiento en el documento
            document.Add(new Paragraph("Factura electrónica"));
            document.Add(new Paragraph("Fecha:" + DateTime.Now));
            document.Add(new Paragraph("Cliente:" +nombreCliente));
            document.Add(Chunk.NEWLINE);

            //Creamos una tabla que contendrá el nombre, apellido y país
            //de nuestros visitante.
            PdfPTable tblPrueba = new PdfPTable(3);
            tblPrueba.WidthPercentage = 100;

            // Configuramos el título de las columnas de la tabla
            PdfPCell clDescripcion = new PdfPCell(new Phrase("Descripción", _standardFont));
            clDescripcion.BorderWidth = 0;
            clDescripcion.BorderWidthBottom = 0.75f;

            //Chunk clCantidad = new Chunk("Cantidad", _standardFont);
            //paragraph.Add(clCantidad);

            PdfPCell clCantidad = new PdfPCell(new Phrase("Cantidad", _standardFont));
            clCantidad.BorderWidth = 0;
            clCantidad.BorderWidthBottom = 0.75f;

            PdfPCell clPrecio = new PdfPCell(new Phrase("Precio", _standardFont));
            clPrecio.BorderWidth = 0;
            clPrecio.BorderWidthBottom = 0.75f;

            // Añadimos las celdas a la tabla
            tblPrueba.AddCell(clDescripcion);
            tblPrueba.AddCell(clCantidad);
            tblPrueba.AddCell(clPrecio);

            clDescripcion = new PdfPCell(new Phrase(facturaDetalle.codigoProducto, _standardFont));
            clDescripcion.BorderWidth = 0;

            clCantidad = new PdfPCell(new Phrase(facturaDetalle.cantidad + "", _standardFont));
            clCantidad.BorderWidth = 0;

            clPrecio = new PdfPCell(new Phrase(facturaDetalle.cantidad + "", _standardFont));
            clPrecio.BorderWidth = 0;


            // Añadimos las celdas a la tabla
            tblPrueba.AddCell(clDescripcion);
            tblPrueba.AddCell(clCantidad);
            tblPrueba.AddCell(clPrecio);
           // Lo de arriba esta bien


           
            document.Add(tblPrueba);
            document.Add(new Paragraph("Forma de pago: " + fac.formaPago));
            document.Add(new Paragraph("Información de pago: " + fac.informacionPago));
            document.Add(new Paragraph("Descuento aplicado: " + fac.descuento));
            document.Add(new Paragraph("Total en dolares: $" + precioDolares.ToString("0,00")));
            document.Add(new Paragraph("Total: ₡" + fac.totalPagar+"colones"));
            document.Close();

            MailMessage email = new MailMessage();
            email.To.Add(new MailAddress(emailCliente));
            email.To.Add(new MailAddress("distribuidorapacificosa@gmail.com"));
            email.From = new MailAddress("distribuidorapacificosa@gmail.com");
            email.Subject = "Datos de la factura en la compra de Distribuidora Pacífico";
            String html = "Le adjuntamos la factura de su compra, que tenga lindo día";
            email.IsBodyHtml = true;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(html, Encoding.UTF8, MediaTypeNames.Text.Html);
            email.Attachments.Add(new Attachment(path));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("distribuidorapacificosa@gmail.com", "Costarica2020");

            smtp.Send(email);

            email.Dispose();
            smtp.Dispose();

        }



    }





}
