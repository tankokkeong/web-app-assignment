using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;

namespace web_app_assignment
{
    public class pwHash
    {
        public static string hashPassword(string password)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();

            byte[] password_bytes = Encoding.ASCII.GetBytes(password);
            byte[] encrypted_bytes = sha1.ComputeHash(password_bytes);
            
            String encypt = Convert.ToBase64String(encrypted_bytes);

            return encypt;
        }

        public static string decyptPassword (string encypt)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();

            byte[] newBytes = Convert.FromBase64String(encypt);

            return BitConverter.ToString(newBytes);



        }
    }
}