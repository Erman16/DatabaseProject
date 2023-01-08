using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using System.Web.UI.HtmlControls;

namespace DatabaseProject.MyPages
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        public int insertData(String getName, String getSurname, String getEmail, String getPassword, 
            String getAddress, String getNameOnCreditCard, String getCreditCardNo, String getCreditCardExposureDate,
            String getCreditCardCvv, String getCountry)
        {
            int result = 0;
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {                                                   //INSERT usage
                    SqlCommand command = new SqlCommand("INSERT INTO Customers(fname, lname, email, password, country)" + 
                        "VALUES ('" + getName + "','" + getSurname + "','" + getEmail + "','" + getPassword + "','" + getCountry + "')", connection);

                    result = command.ExecuteNonQuery();

                    if (getAddress != "" & getNameOnCreditCard != "" & getCreditCardNo != "" & getCreditCardExposureDate != "" & getCreditCardCvv != "")
                    {                                               //UPDATE usage with WHERE
                        SqlCommand command2 = new SqlCommand("UPDATE Customers SET address = '" + getAddress + "', nameOnCreditCard = '" + getNameOnCreditCard + "', " +
                            "creditCardNo = '" + getCreditCardNo + "', creditCardExposureDate = '" + getCreditCardExposureDate + "', creditCardCvv = '" + getCreditCardCvv + "' WHERE email = '"+ getEmail + "'", connection);
                        command2.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return result;
        }
    }
    public partial class LoginPage : System.Web.UI.Page
    {
        public static String myPersonName, myPersonSurname, myPersonEmail;
        public bool getData(String getEmail, String getPassword)
        {
            bool result = false;
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {                                                       //SELECT usage with WHERE
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT email, password, fname, lname FROM Customers WHERE email = '" + getEmail + "' And password = '" + getPassword + "'; ", connection); 
                    adapter.Fill(dtCourse);

                    if (dtCourse.Rows[0][0].ToString().Trim() == getEmail && dtCourse.Rows[0][1].ToString().Trim() == getPassword)
                    {
                        myPersonEmail = getEmail;
                        myPersonName = dtCourse.Rows[0][2].ToString().Trim();
                        myPersonSurname = dtCourse.Rows[0][3].ToString().Trim();
                        result = true;
                    }
                }
            }
            catch (Exception ex) { }
            return result;
        }
    }
}