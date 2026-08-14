using System;
using System.Web.UI;
using RadientFrontEnd.ServiceReference1;

namespace RadientFrontEnd
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text.Trim();
            string password = PasswordTextBox.Text;

            Service1Client client = new Service1Client();

            int userID = client.Login(email, password);

            if (userID != -1)
            {
                Session["UserID"] = userID;

                MessageLabel.Text = "Login successful!";
            }
            else
            {
                MessageLabel.Text = "Invalid email or password.";
            }

            client.Close();
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            try
            {
                Service1Client client = new Service1Client();

                AppUser user = new AppUser
                {
                    UserName = UserNameTextBox.Text.Trim(),

                    UserSurname = SurnameTextBox.Text.Trim(),

                    Email = RegisterEmailTextBox.Text.Trim(),
                    
                    PhoneNumber = PhoneNumberTextBox.Text.Trim(),

                    Gender = GenderDropDown.SelectedValue,

                    Race = RaceTextBox.Text.Trim(),

                    DOB = DateTime.Parse(DOBTextBox.Text)
                };

               client.Register(
                    user,
                    RegisterPasswordTextBox.Text
                );

                MessageLabel.Text = "Account created successfully!";

                client.Close();
            }
            catch (Exception ex)
            {
                MessageLabel.Text = ex.Message;
            }
        }
    }
}