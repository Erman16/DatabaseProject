using System;
using System.Web;

namespace DatabaseProject.MyPages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["cookie"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }
        protected void MyLoginButton(object sender, EventArgs e)
        {
            String userPassword = uPassword.Value.ToString();
            String userUsername = email.Value.ToString();

            bool isUserInputsCorrect = getData(userUsername, userPassword);

            if (isUserInputsCorrect)
            {
                if (rMe.Checked)
                {
                    HttpCookie cookie = new HttpCookie("cookie");

                    cookie["username"] = userUsername;
                    cookie["password"] = userPassword;
                    cookie.Expires = DateTime.Now.AddMinutes(2);

                    Response.Cookies.Add(cookie);
                }
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                email.Value = null;
                uPassword.Value = null;
                LinkButton1.Text = "User name or password is incorrect, try again";
            }
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}