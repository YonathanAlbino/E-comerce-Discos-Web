using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public class Email
    {
        private MailMessage email;
        private SmtpClient server;

        public Email()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("yonaalbino5@gmail.com", "zxpandwaninvgaqd");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreo(string emailDestino, string asunto, string cuerpo, string nombre, string apellido)
        {
            email = new MailMessage();
            email.From = new MailAddress("pepito@gmail.com");
            email.To.Add("yonathan96@outlook.com.ar");
            email.Subject = asunto;
            email.IsBodyHtml = true;
            //email.Body = "<h2> Mensaje recibido de: " + emailDestino + "</h2> <br /> <h2>Nombre: " + nombre + " Apellido: " +apellido+"</h2> <br /> <h3>"+cuerpo+"</h3>";
            email.Body = "<p style=\"text-align: center; font-weight: 600; font-size: 22px;\">Correo recibido de: "+ emailDestino + "</p> <br> <p style=\"font-size: 18px; font-weight: 600;\">Nombre: "+nombre+"</p> <p style=\"font-size: 18px; font-weight: 600;\">Apellido: "+apellido+"</p> <p style=\"padding: 10px; border: 1px solid #000; font-size: 22px; border-radius: 5px;\">"+cuerpo+"</p>";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
