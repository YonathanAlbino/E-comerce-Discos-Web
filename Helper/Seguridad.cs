using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Helper
{
    public static class Seguridad
    {
        public static string mensajeError(object error)
        {
            return ((Exception)error).Message.ToString();
        }
        public static bool sesionActiva(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            if (usuario != null && usuario.Id != 0)
                return true;
            else
                return false;
        }
        public static bool esAdmin(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return usuario != null ? usuario.Admin : false;
        }
        public static string refrescarImagen(string imagen)
        {
            return "~/imagenesGuardadas/ImagenesPerfil/" + imagen + "?v=" + DateTime.Now.Ticks.ToString();
        }
    }
}
