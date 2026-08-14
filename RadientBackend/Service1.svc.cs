using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace RadiantBeauty
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        RadiantDataClassDataContext db = new RadiantDataClassDataContext();
        //Login implementation
        public int Login(string Email, string PlainPassword)
        {
            AppUser user = (from u in db.AppUsers
                            where u.Email.Equals(Email) 
                            select u).FirstOrDefault();

            if (user !=null && Secrecy.VerifyPassword(PlainPassword, user.HashedPassword))
            {
                return user.UserID;

            }else
            {
                return -1;

            }
            
                          
        }

        public void Register(AppUser u,String PlainPassword)
        {
            AppUser NewUser = new AppUser
            {
                UserName = u.UserName,
                UserSurname = u.UserSurname,
                Email = u.Email,
                PhoneNumber=u.PhoneNumber,
                HashedPassword = Secrecy.HashPassword(PlainPassword),
                Gender = u.Gender,
                Race = u.Race,
                DOB = u.DOB,  /*Date of birth*/
                DateCreated = DateTime.Now,

            };
            try
            {
                db.AppUsers.InsertOnSubmit(NewUser);
                db.SubmitChanges();
            }catch(Exception ex)
            {
                throw new Exception("DATABASE ERROR: " + ex.Message);

            }
        }
    }

}
