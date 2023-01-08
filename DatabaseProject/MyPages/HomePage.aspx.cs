using System;
using System.Data.SqlClient;
using System.Data;

namespace DatabaseProject.MyPages
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            getDepartmentNames();

            if (LoginPage.myPersonEmail != null) //check if user Logined
            {
                companyNamePlace.InnerText = "  " + LoginPage.myPersonName + " " + LoginPage.myPersonSurname;
            }
            else
            {
                Response.Redirect("LoginPage.aspx"); //return login if user don't.
            }
        }

        protected void ProductsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx"); //return login if user don't.
        }

        public void getDepartmentNames()
        {
            try
            {
                string connectionString = "Data Source=localhost;Initial Catalog=DatabaseProjectDB;Integrated Security=True";

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                DataTable dtCourse = new DataTable();

                if (connection.State == ConnectionState.Open)
                {                                                   //Select usage
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT dName, information FROM Departments", connection);
                    adapter.Fill(dtCourse);

                    if (dtCourse.Rows != null)
                    {
                        departmentName1.InnerText = dtCourse.Rows[0][0].ToString();
                        departmentInfo1.InnerHtml = dtCourse.Rows[0][1].ToString() + "<br/><br/><br/>";
                        departmentName2.InnerText = dtCourse.Rows[1][0].ToString();
                        departmentInfo2.InnerText = dtCourse.Rows[1][1].ToString();
                        departmentName3.InnerText = dtCourse.Rows[2][0].ToString();
                        departmentInfo3.InnerHtml = dtCourse.Rows[2][1].ToString() + "<br/><br/><br/>";
                    }
                }
            }
            catch (Exception ex) { }
        }
    }
}

