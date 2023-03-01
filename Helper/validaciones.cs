using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Helper
{
    static public class validaciones
    {
        static public bool textoVacio(object control)
        {
            if (control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                    return true;
                else
                    return false;
            }

            return false;
        }
       
      
    }
}
