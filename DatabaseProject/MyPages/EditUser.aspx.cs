using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DatabaseProject.MyPages
{
    public partial class EditUser : System.Web.UI.Page
    {
        string[] tableItems = { "fname", "lname", "password", "address", "nameOnCreditCard", "creditCardNo", "creditCardExposureDate", "creditCardCvv", "country" };

        public static int whichButton;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginPage.myPersonEmail == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                companyNamePlace.InnerText = "  " + LoginPage.myPersonName + " " + LoginPage.myPersonSurname;
                successMessage.Style.Add("display", "none");
                errorMessage.Style.Add("display", "none");
                try
                {
                    getOriginValue();
                }
                catch (Exception ex)
                {
                    throw ex;
                };
            }
        }

        public void getOriginValue()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {                                                   //SELECT usage with WHERE
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Customers WHERE email = '" + LoginPage.myPersonEmail + "';", connection);
                    adapter.Fill(dtCourse);

                    if (dtCourse.Rows != null)
                    {
                        firstNameData.InnerText = dtCourse.Rows[0][1].ToString();
                        lastNameData.InnerText = dtCourse.Rows[0][2].ToString();
                        emailData.InnerText = dtCourse.Rows[0][3].ToString();
                        passwordData.InnerText = dtCourse.Rows[0][4].ToString();
                        addressData.InnerText = dtCourse.Rows[0][5].ToString();
                        nameOnCreditCardData.InnerText = dtCourse.Rows[0][6].ToString();
                        creditCardNoData.InnerText = dtCourse.Rows[0][7].ToString();
                        creditCardExposureDateData.InnerText = dtCourse.Rows[0][8].ToString();
                        creditCardCvvData.InnerText = dtCourse.Rows[0][9].ToString();
                        countryData.InnerText = dtCourse.Rows[0][10].ToString();
                    }
                }
            }
            catch (Exception ex) { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Name";
            inputText.InnerHtml = "Name";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Surname";
            inputText.InnerHtml = "Surname";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 2;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Password";
            inputText.InnerHtml = "Password";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 3;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Address";
            inputText.InnerHtml = "Address";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 4;
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Name On Credit Card";
            inputText.InnerHtml = "Name On Credit Card";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 5;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Credit Card No";
            inputText.InnerHtml = "Credit Card No";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 6;
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Credit Card Exposure Date";
            inputText.InnerHtml = "Credit Card Exposure Date";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 7;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Credit Card Cvv";
            inputText.InnerHtml = "Credit Card Cvv";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 8;
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            whichField.InnerHtml = "Country";
            inputText.InnerHtml = "Country";
            inputField.Style.Add("display", "block");
            infoTable.Style.Add("display", "none");
            whichButton = 9;
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {

            int result = 0;
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();


                if (connection.State == ConnectionState.Open)
                {                                              //UPDATE usage
                    SqlCommand command = new SqlCommand("UPDATE Customers SET " + tableItems[whichButton - 1] + " = '" + uInput.Value.ToString().Trim() + "' WHERE email = '" + LoginPage.myPersonEmail + "'", connection);
                    result = command.ExecuteNonQuery();
                    if ((whichButton - 1) == 2 & result != 0)
                    {
                        LoginPage.myPersonEmail = uInput.Value.Trim();
                    }
                }
            }
            catch (Exception ex) { }

            if (result != 0)
            {
                successMessage.Style.Add("display", "block");
            }
            else
            {
                errorMessage.Style.Add("display", "block");
            }
        }

        protected void returnButton_Click(object sender, EventArgs e)
        {
            inputField.Style.Add("display", "none");
            getOriginValue();
            infoTable.Style.Add("display", "block");
            successMessage.Style.Add("display", "none");
            errorMessage.Style.Add("display", "none");
        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
        protected void deleteButton_Click(object sender, EventArgs e)
        {
            int result = 0;
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                if (connection.State == ConnectionState.Open)
                {                                               //DELETE usage
                    SqlCommand command = new SqlCommand("DELETE FROM Customers WHERE email = '" + LoginPage.myPersonEmail + "'", connection); 
                    result = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex) { }

            if (result != 0)
            {
                successMessage.Style.Add("display", "block");
            }
            else
            {
                errorMessage.Style.Add("display", "block");
            }
            Response.AddHeader("REFRESH", "2;URL=RegisterPage.aspx");
        }
    }
}