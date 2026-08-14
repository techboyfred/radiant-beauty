using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCrypt.Net;
namespace RadiantBeauty
{
    public static class Secrecy
    {
        //Password hashing for signup(Accout Creation)
        public static String HashPassword(String PlainPassword)
        {
            return BCrypt.Net.BCrypt.HashPassword(PlainPassword);
        }

        //Password verification of loging in
        public static bool VerifyPassword(String PlainPassword,String HashedPassword)
        {
            return BCrypt.Net.BCrypt.Verify(PlainPassword, HashedPassword);
        }
            
    }
}